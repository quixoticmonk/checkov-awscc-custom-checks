from checkov.terraform.checks.resource.base_resource_value_check import BaseResourceValueCheck
from checkov.common.models.enums import CheckCategories


class RDSPubliclyAccessible(BaseResourceValueCheck):
    def __init__(self):
        name = "Ensure all data stored in RDS is not publicly accessible"
        id = "CKV_AWSCC_97"
        supported_resources = ["awscc_rds_db_instance"]
        categories = [CheckCategories.NETWORKING]
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources)

    def get_inspected_key(self):
        return "publicly_accessible"

    def get_expected_value(self):
        return False


check = RDSPubliclyAccessible()
