from checkov.common.models.enums import CheckCategories
from checkov.terraform.checks.resource.base_resource_value_check import BaseResourceValueCheck


class RedshiftClusterPubliclyAccessible(BaseResourceValueCheck):
    def __init__(self):
        name = "Redshift cluster should not be publicly accessible"
        id = "CKV_AWSCC_44"
        supported_resources = ("awscc_redshift_cluster",)
        categories = (CheckCategories.NETWORKING,)
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources)

    def get_inspected_key(self):
        return "publicly_accessible"

    def get_expected_value(self):
        return False


check = RedshiftClusterPubliclyAccessible()
