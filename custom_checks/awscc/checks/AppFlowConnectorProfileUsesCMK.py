from checkov.terraform.checks.resource.base_resource_check import BaseResourceCheck
from checkov.common.models.enums import CheckCategories, CheckResult


class AppFlowConnectorProfileUsesCMK(BaseResourceCheck):
    def __init__(self):
        name = "Ensure AppFlow connector profile uses CMK"
        id = "CKV_AWSCC_106"
        supported_resources = ["awscc_appflow_connector_profile"]
        categories = [CheckCategories.ENCRYPTION]
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources)

    def scan_resource_conf(self, conf):
        # Check if KMS key is specified
        if conf.get("kms_arn") and isinstance(conf["kms_arn"], list) and len(conf["kms_arn"]) > 0:
            kms_arn = conf["kms_arn"][0]
            if kms_arn:  # If KMS key is specified and not empty
                return CheckResult.PASSED
        
        self.evaluated_keys = ["kms_arn"]
        return CheckResult.FAILED


check = AppFlowConnectorProfileUsesCMK()
