from checkov.terraform.checks.resource.base_resource_check import BaseResourceCheck
from checkov.common.models.enums import CheckCategories, CheckResult


class ECSContainerPrivilege(BaseResourceCheck):
    def __init__(self):
        name = "Ensure ECS containers should run as non-privileged"
        id = "CKV_AWSCC_76"
        supported_resources = ["awscc_ecs_task_definition"]
        categories = [CheckCategories.GENERAL_SECURITY]
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources)

    def scan_resource_conf(self, conf):
        if conf.get("container_definitions") and isinstance(conf["container_definitions"], list):
            for idx, container in enumerate(conf["container_definitions"]):
                if isinstance(container, dict) and container.get("privileged") and isinstance(container["privileged"], list) and len(container["privileged"]) > 0:
                    if container["privileged"][0] is True:
                        self.evaluated_keys = [f"container_definitions/[{idx}]/privileged"]
                        return CheckResult.FAILED
        
        return CheckResult.PASSED


check = ECSContainerPrivilege()
