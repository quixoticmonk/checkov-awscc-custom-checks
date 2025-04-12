from checkov.terraform.checks.resource.base_resource_check import BaseResourceCheck
from checkov.common.models.enums import CheckCategories, CheckResult


class RDSEnhancedMonitorEnabled(BaseResourceCheck):
    def __init__(self):
        name = "Ensure that enhanced monitoring is enabled for Amazon RDS instances"
        id = "CKV_AWSCC_90"
        supported_resources = ["awscc_rds_db_instance"]
        categories = [CheckCategories.LOGGING]
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources)

    def scan_resource_conf(self, conf):
        # Check for monitoring_interval
        if conf.get("monitoring_interval") and isinstance(conf["monitoring_interval"], list) and len(conf["monitoring_interval"]) > 0:
            monitoring_interval = conf["monitoring_interval"][0]
            if isinstance(monitoring_interval, int) and monitoring_interval > 0:
                # Check for monitoring_role_arn
                if conf.get("monitoring_role_arn") and isinstance(conf["monitoring_role_arn"], list) and len(conf["monitoring_role_arn"]) > 0:
                    monitoring_role = conf["monitoring_role_arn"][0]
                    if monitoring_role:  # If monitoring role is specified and not empty
                        return CheckResult.PASSED
                
                self.evaluated_keys = ["monitoring_interval", "monitoring_role_arn"]
                return CheckResult.FAILED
        
        self.evaluated_keys = ["monitoring_interval"]
        return CheckResult.FAILED


check = RDSEnhancedMonitorEnabled()
