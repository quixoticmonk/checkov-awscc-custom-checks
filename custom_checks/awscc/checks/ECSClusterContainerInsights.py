from checkov.terraform.checks.resource.base_resource_value_check import BaseResourceValueCheck
from checkov.common.models.enums import CheckCategories


class ECSClusterContainerInsights(BaseResourceValueCheck):
    def __init__(self):
        name = "Ensure container insights are enabled on ECS cluster"
        id = "CKV_AWSCC_72"
        supported_resources = ["awscc_ecs_cluster"]
        categories = [CheckCategories.LOGGING]
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources)

    def get_inspected_key(self):
        return "cluster_settings/[0]/value"

    def get_expected_value(self):
        return "enabled"


check = ECSClusterContainerInsights()
