from checkov.common.models.enums import CheckCategories, CheckResult
from checkov.terraform.checks.resource.base_resource_negative_value_check import BaseResourceNegativeValueCheck


class RedshiftClusterAutomatedSnapshot(BaseResourceNegativeValueCheck):
    def __init__(self):
        name = "Ensure Redshift clusters have automatic snapshots enabled"
        id = "CKV_AWSCC_37"
        supported_resources = ("awscc_redshift_cluster",)
        categories = (CheckCategories.BACKUP_AND_RECOVERY,)
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources,
                         missing_attribute_result=CheckResult.PASSED)

    def get_inspected_key(self):
        return "automated_snapshot_retention_period"

    def get_forbidden_values(self):
        return [0]


check = RedshiftClusterAutomatedSnapshot()
