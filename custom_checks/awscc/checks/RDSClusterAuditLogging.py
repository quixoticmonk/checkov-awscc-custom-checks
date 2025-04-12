from checkov.terraform.checks.resource.base_resource_check import BaseResourceCheck
from checkov.common.models.enums import CheckCategories, CheckResult


class RDSClusterAuditLogging(BaseResourceCheck):
    def __init__(self):
        name = "Ensure that RDS Cluster audit logging is enabled for MySQL engine"
        id = "CKV_AWSCC_83"
        supported_resources = ["awscc_rds_db_cluster"]
        categories = [CheckCategories.LOGGING]
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources)

    def scan_resource_conf(self, conf):
        # Check if engine is MySQL
        if conf.get("engine") and isinstance(conf["engine"], list) and len(conf["engine"]) > 0:
            engine = conf["engine"][0].lower()
            if "mysql" not in engine and "aurora-mysql" not in engine:
                return CheckResult.PASSED  # Not applicable for non-MySQL engines
            
            # Check for enabled_cloudwatch_logs_exports
            if conf.get("enabled_cloudwatch_logs_exports") and isinstance(conf["enabled_cloudwatch_logs_exports"], list) and len(conf["enabled_cloudwatch_logs_exports"]) > 0:
                log_exports = conf["enabled_cloudwatch_logs_exports"][0]
                if isinstance(log_exports, list) and "audit" in log_exports:
                    return CheckResult.PASSED
            
            self.evaluated_keys = ["enabled_cloudwatch_logs_exports"]
            return CheckResult.FAILED
        
        return CheckResult.PASSED  # If engine is not specified, we can't determine if it's MySQL


check = RDSClusterAuditLogging()
