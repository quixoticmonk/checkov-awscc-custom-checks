from checkov.common.models.enums import CheckCategories, CheckResult
from checkov.terraform.checks.resource.base_resource_value_check import BaseResourceValueCheck


class RedshiftClusterAllowVersionUpgrade(BaseResourceValueCheck):
    def __init__(self):
        name = "Ensure that Redshift cluster allowing version upgrade by default"
        id = "CKV_AWSCC_39"
        supported_resources = ("awscc_redshift_cluster",)
        categories = (CheckCategories.GENERAL_SECURITY,)
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources,
                         missing_block_result=CheckResult.PASSED)

    def get_inspected_key(self):
        return "allow_version_upgrade"

    def get_expected_value(self):
        return True


check = RedshiftClusterAllowVersionUpgrade()
