from checkov.common.models.enums import CheckResult, CheckCategories
from checkov.terraform.checks.resource.base_resource_check import BaseResourceCheck


class CloudtrailEnableLogging(BaseResourceCheck):
    def __init__(self):
        name = "Ensure CloudTrail logging is enabled"
        id = "CKV_AWSCC_123"
        supported_resources = ["awscc_cloudtrail_trail"]
        categories = [CheckCategories.LOGGING]
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources)

    def scan_resource_conf(self, conf):
        # Check if is_logging is specified and set to true
        if "is_logging" in conf:
            if conf["is_logging"] is True:
                return CheckResult.PASSED
            # If explicitly set to false
            return CheckResult.FAILED
        # Default is false if not specified
        return CheckResult.FAILED


check = CloudtrailEnableLogging()
