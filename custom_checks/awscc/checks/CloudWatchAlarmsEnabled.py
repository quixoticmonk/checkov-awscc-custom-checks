from checkov.common.models.enums import CheckResult, CheckCategories
from checkov.terraform.checks.resource.base_resource_check import BaseResourceCheck


class CloudWatchAlarmsEnabled(BaseResourceCheck):
    def __init__(self):
        name = "Ensure that CloudWatch alarm actions are enabled"
        id = "CKV_AWSCC_120"
        supported_resources = ["awscc_cloudwatch_alarm"]
        categories = [CheckCategories.LOGGING]
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources)

    def scan_resource_conf(self, conf):
        if "actions_enabled" in conf:
            if conf["actions_enabled"] is True:
                return CheckResult.PASSED
            # If explicitly set to false
            return CheckResult.FAILED
        # Default is true if not specified
        return CheckResult.PASSED


check = CloudWatchAlarmsEnabled()
