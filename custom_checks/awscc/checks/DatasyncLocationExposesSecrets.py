from checkov.common.models.enums import CheckResult, CheckCategories
from checkov.terraform.checks.resource.base_resource_check import BaseResourceCheck
import re


class DatasyncLocationExposesSecrets(BaseResourceCheck):
    def __init__(self):
        name = "Ensure DataSync Location Object Storage doesn't expose secrets"
        id = "CKV_AWSCC_132"
        supported_resources = ["awscc_datasync_location_object_storage"]
        categories = [CheckCategories.SECRETS]
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources)

    def scan_resource_conf(self, conf):
        # Check if access_key is specified directly in the configuration
        if "secret_key" in conf:
            # Check if the secret key is hardcoded
            secret_key = conf["secret_key"]
            if isinstance(secret_key, str) and not self._is_variable_reference(secret_key):
                return CheckResult.FAILED
        
        # Check if server_certificate is specified directly in the configuration
        if "server_certificate" in conf:
            # Check if the server certificate is hardcoded
            server_certificate = conf["server_certificate"]
            if isinstance(server_certificate, str) and not self._is_variable_reference(server_certificate):
                return CheckResult.FAILED
        
        return CheckResult.PASSED
    
    def _is_variable_reference(self, value):
        # Check if the value is a variable reference like ${var.something} or a parameter store reference
        # This is a simplified check - in a real implementation, you might want to check more thoroughly
        return bool(re.match(r'^\${.+}$', value) or 
                   value.startswith('aws_ssm_parameter') or 
                   value.startswith('data.aws_ssm_parameter') or
                   value.startswith('aws_secretsmanager_secret') or
                   value.startswith('data.aws_secretsmanager_secret'))


check = DatasyncLocationExposesSecrets()
