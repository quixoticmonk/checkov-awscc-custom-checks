from checkov.terraform.checks.resource.base_resource_value_check import BaseResourceValueCheck
from checkov.common.models.enums import CheckCategories


class RDSEncryption(BaseResourceValueCheck):
    def __init__(self):
        name = "Ensure all data stored in the RDS is securely encrypted at rest"
        id = "CKV_AWSCC_89"
        supported_resources = ["awscc_rds_db_instance"]
        categories = [CheckCategories.ENCRYPTION]
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources)

    def get_inspected_key(self):
        return "storage_encrypted"

    def get_expected_value(self):
        return True


check = RDSEncryption()
