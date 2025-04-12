from checkov.terraform.checks.resource.base_resource_check import BaseResourceCheck
from checkov.common.models.enums import CheckCategories, CheckResult


class TransferServerIsPublic(BaseResourceCheck):
    def __init__(self):
        name = "Ensure Transfer Server is not exposed publicly"
        id = "CKV_AWSCC_101"
        supported_resources = ["awscc_transfer_server"]
        categories = [CheckCategories.NETWORKING]
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources)

    def scan_resource_conf(self, conf):
        # Check if endpoint_type is specified
        if conf.get("endpoint_type") and isinstance(conf["endpoint_type"], list) and len(conf["endpoint_type"]) > 0:
            endpoint_type = conf["endpoint_type"][0]
            
            # Check if endpoint_type is not PUBLIC
            if endpoint_type != "PUBLIC":
                return CheckResult.PASSED
            
            self.evaluated_keys = ["endpoint_type"]
            return CheckResult.FAILED
        
        # If endpoint_type is not specified, default is PUBLIC which is insecure
        self.evaluated_keys = ["endpoint_type"]
        return CheckResult.FAILED


check = TransferServerIsPublic()
