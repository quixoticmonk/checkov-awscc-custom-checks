from checkov.terraform.checks.resource.base_resource_check import BaseResourceCheck
from checkov.common.models.enums import CheckCategories, CheckResult


class AppSyncFieldLevelLogs(BaseResourceCheck):
    def __init__(self):
        name = "Ensure AppSync has Field-Level logs enabled"
        id = "CKV_AWSCC_108"
        supported_resources = ["awscc_appsync_graph_ql_api"]
        categories = [CheckCategories.LOGGING]
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources)

    def scan_resource_conf(self, conf):
        # Check if logging is configured
        if conf.get("log_config") and isinstance(conf["log_config"], list) and len(conf["log_config"]) > 0:
            log_config = conf["log_config"][0]
            
            # Check if field_log_level is specified and not OFF or ERROR
            if log_config.get("field_log_level") and log_config["field_log_level"] in ["ALL", "INFO", "DEBUG"]:
                return CheckResult.PASSED
            
            self.evaluated_keys = ["log_config", "field_log_level"]
            return CheckResult.FAILED
        
        # If no logging is configured
        self.evaluated_keys = ["log_config"]
        return CheckResult.FAILED


check = AppSyncFieldLevelLogs()
