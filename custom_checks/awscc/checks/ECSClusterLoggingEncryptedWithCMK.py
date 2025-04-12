from checkov.common.models.consts import ANY_VALUE
from checkov.terraform.checks.resource.base_resource_check import BaseResourceCheck
from checkov.common.models.enums import CheckCategories, CheckResult


class ECSClusterLoggingEncryptedWithCMK(BaseResourceCheck):
    def __init__(self):
        name = "Ensure ECS Cluster logging is enabled and client to container communication uses CMK"
        id = "CKV_AWSCC_74"
        supported_resources = ["awscc_ecs_cluster"]
        categories = [CheckCategories.ENCRYPTION]
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources)

    def scan_resource_conf(self, conf):
        if conf.get("configuration") and isinstance(conf["configuration"], list) and len(conf["configuration"]) > 0:
            configuration = conf["configuration"][0]
            if configuration.get("execute_command_configuration") and isinstance(configuration["execute_command_configuration"], list) and len(configuration["execute_command_configuration"]) > 0:
                exec_cmd_config = configuration["execute_command_configuration"][0]
                
                # Check for KMS key
                if exec_cmd_config.get("kms_key_id") and isinstance(exec_cmd_config["kms_key_id"], list) and len(exec_cmd_config["kms_key_id"]) > 0:
                    
                    # Check for logging
                    if exec_cmd_config.get("logging") and isinstance(exec_cmd_config["logging"], list) and len(exec_cmd_config["logging"]) > 0:
                        logging_config = exec_cmd_config["logging"][0]
                        if logging_config.get("cloud_watch_logs_configuration") or logging_config.get("s3_bucket_configuration"):
                            return CheckResult.PASSED
        
        self.evaluated_keys = ["configuration/[0]/execute_command_configuration/[0]/kms_key_id", "configuration/[0]/execute_command_configuration/[0]/logging"]
        return CheckResult.FAILED


check = ECSClusterLoggingEncryptedWithCMK()
