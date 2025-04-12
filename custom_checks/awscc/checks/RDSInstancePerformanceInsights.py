from checkov.terraform.checks.resource.base_resource_value_check import BaseResourceValueCheck
from checkov.common.models.enums import CheckCategories


class RDSInstancePerformanceInsights(BaseResourceValueCheck):
    def __init__(self):
        name = "Ensure that RDS instances have performance insights enabled"
        id = "CKV_AWSCC_94"
        supported_resources = ["awscc_rds_db_instance"]
        categories = [CheckCategories.LOGGING]
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources)

    def get_inspected_key(self):
        return "enable_performance_insights"

    def get_expected_value(self):
        return True


check = RDSInstancePerformanceInsights()
