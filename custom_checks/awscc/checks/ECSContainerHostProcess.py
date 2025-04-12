from checkov.terraform.checks.resource.base_resource_value_check import BaseResourceValueCheck
from checkov.common.models.enums import CheckCategories


class ECSContainerHostProcess(BaseResourceValueCheck):
    def __init__(self):
        name = "Ensure ECS task definitions should not share the host's process namespace"
        id = "CKV_AWSCC_75"
        supported_resources = ["awscc_ecs_task_definition"]
        categories = [CheckCategories.GENERAL_SECURITY]
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources)

    def get_inspected_key(self):
        return "pid_mode"

    def get_expected_values(self):
        return ["task", None]


check = ECSContainerHostProcess()
