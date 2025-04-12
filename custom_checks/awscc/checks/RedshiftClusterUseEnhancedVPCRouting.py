from checkov.common.models.enums import CheckCategories, CheckResult
from checkov.terraform.checks.resource.base_resource_value_check import BaseResourceValueCheck


class RedshiftClusterUseEnhancedVPCRouting(BaseResourceValueCheck):
    def __init__(self):
        name = "Ensure Redshift clusters use enhanced VPC routing"
        id = "CKV_AWSCC_41"
        supported_resources = ("awscc_redshift_cluster",)
        categories = (CheckCategories.GENERAL_SECURITY,)
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources,
                         missing_block_result=CheckResult.FAILED)

    def get_inspected_key(self):
        return "enhanced_vpc_routing"

    def get_expected_value(self):
        return True


check = RedshiftClusterUseEnhancedVPCRouting()
