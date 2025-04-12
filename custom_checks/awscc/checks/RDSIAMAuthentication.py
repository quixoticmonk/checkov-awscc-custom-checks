from checkov.terraform.checks.resource.base_resource_value_check import BaseResourceValueCheck
from checkov.common.models.enums import CheckCategories


class RDSIAMAuthentication(BaseResourceValueCheck):
    def __init__(self):
        name = "Ensure RDS database has IAM authentication enabled"
        id = "CKV_AWSCC_91"
        supported_resources = ["awscc_rds_db_instance"]
        categories = [CheckCategories.IAM]
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources)

    def get_inspected_key(self):
        return "enable_iam_database_authentication"

    def get_expected_value(self):
        return True


check = RDSIAMAuthentication()
