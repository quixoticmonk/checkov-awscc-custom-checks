from checkov.common.models.enums import CheckResult, CheckCategories
from checkov.terraform.checks.resource.base_resource_check import BaseResourceCheck


class CloudWatchLogGroupRetention(BaseResourceCheck):
    def __init__(self):
        name = "Ensure that CloudWatch Log Group specifies retention days"
        id = "CKV_AWSCC_121"
        supported_resources = ["awscc_logs_log_group"]
        categories = [CheckCategories.LOGGING]
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources)

    def scan_resource_conf(self, conf):
        if "retention_in_days" in conf:
            if conf["retention_in_days"] is not None:
                return CheckResult.PASSED
        return CheckResult.FAILED


check = CloudWatchLogGroupRetention()
