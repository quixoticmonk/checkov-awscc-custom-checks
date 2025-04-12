from checkov.common.models.enums import CheckCategories
from checkov.terraform.checks.resource.base_resource_value_check import BaseResourceValueCheck


class NeptuneClusterStorageEncrypted(BaseResourceValueCheck):
    def __init__(self):
        name = "Ensure Neptune storage is securely encrypted"
        id = "CKV_AWSCC_49"
        supported_resources = ("awscc_neptune_db_cluster",)
        categories = (CheckCategories.ENCRYPTION,)
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources)

    def get_inspected_key(self):
        return "storage_encrypted"

    def get_expected_value(self):
        return True


check = NeptuneClusterStorageEncrypted()
