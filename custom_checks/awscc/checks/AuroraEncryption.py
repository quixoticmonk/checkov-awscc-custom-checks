from checkov.terraform.checks.resource.base_resource_value_check import BaseResourceValueCheck
from checkov.common.models.enums import CheckCategories


class AuroraEncryption(BaseResourceValueCheck):
    def __init__(self):
        name = "Ensure all data stored in Aurora is securely encrypted at rest"
        id = "CKV_AWSCC_112"
        supported_resources = ["awscc_rds_db_cluster"]
        categories = [CheckCategories.ENCRYPTION]
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources)

    def get_inspected_key(self):
        return "storage_encrypted"

    def get_expected_value(self):
        return True


check = AuroraEncryption()
