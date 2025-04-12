from checkov.terraform.checks.resource.base_resource_check import BaseResourceCheck
from checkov.common.models.enums import CheckCategories, CheckResult


class RDSClusterLogging(BaseResourceCheck):
    def __init__(self):
        name = "Ensure that RDS Cluster log capture is enabled"
        id = "CKV_AWSCC_88"
        supported_resources = ["awscc_rds_db_cluster"]
        categories = [CheckCategories.LOGGING]
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources)

    def scan_resource_conf(self, conf):
        # Check for enabled_cloudwatch_logs_exports
        if conf.get("enabled_cloudwatch_logs_exports") and isinstance(conf["enabled_cloudwatch_logs_exports"], list) and len(conf["enabled_cloudwatch_logs_exports"]) > 0:
            log_exports = conf["enabled_cloudwatch_logs_exports"][0]
            if isinstance(log_exports, list) and len(log_exports) > 0:
                return CheckResult.PASSED
        
        self.evaluated_keys = ["enabled_cloudwatch_logs_exports"]
        return CheckResult.FAILED


check = RDSClusterLogging()
