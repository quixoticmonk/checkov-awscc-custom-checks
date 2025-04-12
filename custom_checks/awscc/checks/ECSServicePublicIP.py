from checkov.terraform.checks.resource.base_resource_check import BaseResourceCheck
from checkov.common.models.enums import CheckCategories, CheckResult


class ECSServicePublicIP(BaseResourceCheck):
    def __init__(self):
        name = "Ensure ECS services do not have public IP addresses assigned to them automatically"
        id = "CKV_AWSCC_79"
        supported_resources = ["awscc_ecs_service"]
        categories = [CheckCategories.NETWORKING]
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources)

    def scan_resource_conf(self, conf):
        if conf.get("network_configuration") and isinstance(conf["network_configuration"], list) and len(conf["network_configuration"]) > 0:
            network_config = conf["network_configuration"][0]
            if network_config.get("awsvpc_configuration") and isinstance(network_config["awsvpc_configuration"], list) and len(network_config["awsvpc_configuration"]) > 0:
                awsvpc_config = network_config["awsvpc_configuration"][0]
                if awsvpc_config.get("assign_public_ip") and isinstance(awsvpc_config["assign_public_ip"], list) and len(awsvpc_config["assign_public_ip"]) > 0:
                    if awsvpc_config["assign_public_ip"][0] == "ENABLED":
                        self.evaluated_keys = ["network_configuration/[0]/awsvpc_configuration/[0]/assign_public_ip"]
                        return CheckResult.FAILED
        
        return CheckResult.PASSED


check = ECSServicePublicIP()
