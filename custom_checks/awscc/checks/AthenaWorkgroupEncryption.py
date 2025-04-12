from checkov.terraform.checks.resource.base_resource_check import BaseResourceCheck
from checkov.common.models.enums import CheckCategories, CheckResult


class AthenaWorkgroupEncryption(BaseResourceCheck):
    def __init__(self):
        name = "Ensure that Athena Workgroup is encrypted"
        id = "CKV_AWSCC_111"
        supported_resources = ["awscc_athena_work_group"]
        categories = [CheckCategories.ENCRYPTION]
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources)

    def scan_resource_conf(self, conf):
        # Check if configuration is specified
        if conf.get("configuration") and isinstance(conf["configuration"], list) and len(conf["configuration"]) > 0:
            configuration = conf["configuration"][0]
            
            # Check if result_configuration is specified
            if configuration.get("result_configuration") and isinstance(configuration["result_configuration"], dict):
                result_config = configuration["result_configuration"]
                
                # Check if encryption_configuration is specified
                if result_config.get("encryption_configuration") and isinstance(result_config["encryption_configuration"], dict):
                    encryption_config = result_config["encryption_configuration"]
                    
                    # Check if encryption_option is specified
                    if encryption_config.get("encryption_option"):
                        return CheckResult.PASSED
            
            self.evaluated_keys = ["configuration", "result_configuration", "encryption_configuration"]
            return CheckResult.FAILED
        
        # If no configuration is specified
        self.evaluated_keys = ["configuration"]
        return CheckResult.FAILED


check = AthenaWorkgroupEncryption()
