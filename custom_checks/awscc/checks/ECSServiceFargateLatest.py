from checkov.terraform.checks.resource.base_resource_value_check import BaseResourceValueCheck
from checkov.common.models.enums import CheckCategories


class ECSServiceFargateLatest(BaseResourceValueCheck):
    def __init__(self):
        name = "Ensure ECS Fargate services run on the latest Fargate platform version"
        id = "CKV_AWSCC_78"
        supported_resources = ["awscc_ecs_service"]
        categories = [CheckCategories.GENERAL_SECURITY]
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources)

    def get_inspected_key(self):
        return "platform_version"

    def get_expected_value(self):
        return "LATEST"


check = ECSServiceFargateLatest()
