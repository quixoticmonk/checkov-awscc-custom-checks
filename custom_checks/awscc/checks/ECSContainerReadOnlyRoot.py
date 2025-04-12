from checkov.terraform.checks.resource.base_resource_check import BaseResourceCheck
from checkov.common.models.enums import CheckCategories, CheckResult


class ECSContainerReadOnlyRoot(BaseResourceCheck):
    def __init__(self):
        name = "Ensure ECS containers are limited to read-only access to root filesystems"
        id = "CKV_AWSCC_77"
        supported_resources = ["awscc_ecs_task_definition"]
        categories = [CheckCategories.GENERAL_SECURITY]
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources)

    def scan_resource_conf(self, conf):
        if conf.get("container_definitions") and isinstance(conf["container_definitions"], list):
            for idx, container in enumerate(conf["container_definitions"]):
                if isinstance(container, dict):
                    # Check if read_only_root_filesystem is explicitly set to true
                    if container.get("read_only_root_filesystem") and isinstance(container["read_only_root_filesystem"], list) and len(container["read_only_root_filesystem"]) > 0:
                        if container["read_only_root_filesystem"][0] is True:
                            continue
                    
                    # If not explicitly set to true, mark as failed
                    self.evaluated_keys = [f"container_definitions/[{idx}]/read_only_root_filesystem"]
                    return CheckResult.FAILED
            
            # If all containers have read_only_root_filesystem set to true
            return CheckResult.PASSED
        
        # No container definitions found
        return CheckResult.FAILED


check = ECSContainerReadOnlyRoot()
