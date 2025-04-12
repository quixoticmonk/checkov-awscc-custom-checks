from checkov.common.models.enums import CheckResult, CheckCategories
from checkov.terraform.checks.resource.base_resource_check import BaseResourceCheck


class CloudWatchLogGroupRetentionYear(BaseResourceCheck):
    def __init__(self):
        name = "Ensure CloudWatch log groups retains logs for at least 1 year"
        id = "CKV_AWSCC_122"
        supported_resources = ["awscc_logs_log_group"]
        categories = [CheckCategories.LOGGING]
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources)

    def scan_resource_conf(self, conf):
        # Check if retention_in_days is specified
        if "retention_in_days" in conf:
            retention_days = conf["retention_in_days"]
            # Check if retention is at least 365 days (1 year)
            if isinstance(retention_days, int) and retention_days >= 365:
                return CheckResult.PASSED
            # Special case for "never expire" which is represented by 0
            if isinstance(retention_days, int) and retention_days == 0:
                return CheckResult.PASSED
        return CheckResult.FAILED


check = CloudWatchLogGroupRetentionYear()
