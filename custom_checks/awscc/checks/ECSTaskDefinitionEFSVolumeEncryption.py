from checkov.terraform.checks.resource.base_resource_check import BaseResourceCheck
from checkov.common.models.enums import CheckCategories, CheckResult


class ECSTaskDefinitionEFSVolumeEncryption(BaseResourceCheck):
    def __init__(self):
        name = "Ensure Encryption in transit is enabled for EFS volumes in ECS Task definitions"
        id = "CKV_AWSCC_80"
        supported_resources = ["awscc_ecs_task_definition"]
        categories = [CheckCategories.ENCRYPTION]
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources)

    def scan_resource_conf(self, conf):
        if conf.get("volumes") and isinstance(conf["volumes"], list):
            for idx, volume in enumerate(conf["volumes"]):
                if isinstance(volume, dict) and volume.get("efs_volume_configuration") and isinstance(volume["efs_volume_configuration"], list) and len(volume["efs_volume_configuration"]) > 0:
                    efs_config = volume["efs_volume_configuration"][0]
                    if efs_config.get("transit_encryption") and isinstance(efs_config["transit_encryption"], list) and len(efs_config["transit_encryption"]) > 0:
                        if efs_config["transit_encryption"][0] != "ENABLED":
                            self.evaluated_keys = [f"volumes/[{idx}]/efs_volume_configuration/[0]/transit_encryption"]
                            return CheckResult.FAILED
                    else:
                        # If transit_encryption is not specified, it's not enabled
                        self.evaluated_keys = [f"volumes/[{idx}]/efs_volume_configuration"]
                        return CheckResult.FAILED
        
        # If no EFS volumes are found, the check passes
        return CheckResult.PASSED


check = ECSTaskDefinitionEFSVolumeEncryption()
