from checkov.terraform.checks.resource.base_resource_check import BaseResourceCheck
from checkov.common.models.enums import CheckCategories, CheckResult


class AppSyncLogging(BaseResourceCheck):
    def __init__(self):
        name = "Ensure AppSync has Logging enabled"
        id = "CKV_AWSCC_109"
        supported_resources = ["awscc_appsync_graph_ql_api"]
        categories = [CheckCategories.LOGGING]
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources)

    def scan_resource_conf(self, conf):
        # Check if logging is configured
        if conf.get("log_config") and isinstance(conf["log_config"], list) and len(conf["log_config"]) > 0:
            log_config = conf["log_config"][0]
            
            # Check if CloudWatch logs role ARN is specified
            if log_config.get("cloud_watch_logs_role_arn"):
                # Check if field_log_level is specified and not OFF
                if log_config.get("field_log_level") and log_config["field_log_level"] != "OFF":
                    return CheckResult.PASSED
            
            self.evaluated_keys = ["log_config", "cloud_watch_logs_role_arn", "field_log_level"]
            return CheckResult.FAILED
        
        # If no logging is configured
        self.evaluated_keys = ["log_config"]
        return CheckResult.FAILED


check = AppSyncLogging()
