from checkov.common.models.enums import CheckCategories
from checkov.terraform.checks.resource.base_resource_value_check import BaseResourceValueCheck


class NeptuneDBClustersIAMDatabaseAuthenticationEnabled(BaseResourceValueCheck):
    def __init__(self):
        name = "Neptune DB clusters should have IAM database authentication enabled"
        id = "CKV_AWSCC_51"
        supported_resources = ("awscc_neptune_db_cluster",)
        categories = (CheckCategories.IAM,)
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources)

    def get_inspected_key(self):
        return "iam_database_authentication_enabled"

    def get_expected_value(self):
        return True


check = NeptuneDBClustersIAMDatabaseAuthenticationEnabled()
