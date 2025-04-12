from checkov.terraform.checks.resource.base_resource_value_check import BaseResourceValueCheck
from checkov.common.models.enums import CheckCategories


class RDSMultiAZEnabled(BaseResourceValueCheck):
    def __init__(self):
        name = "Ensure that RDS instances have Multi-AZ enabled"
        id = "CKV_AWSCC_95"
        supported_resources = ["awscc_rds_db_instance"]
        categories = [CheckCategories.BACKUP_AND_RECOVERY]
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources)

    def get_inspected_key(self):
        return "multi_az"

    def get_expected_value(self):
        return True


check = RDSMultiAZEnabled()
