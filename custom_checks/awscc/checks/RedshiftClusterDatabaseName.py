from checkov.common.models.consts import ANY_VALUE
from checkov.common.models.enums import CheckCategories, CheckResult
from checkov.terraform.checks.resource.base_resource_value_check import BaseResourceValueCheck
from typing import Any


class RedshiftClusterDatabaseName(BaseResourceValueCheck):
    def __init__(self):
        name = "Ensure Redshift clusters do not use the default database name"
        id = "CKV_AWSCC_40"
        supported_resources = ("awscc_redshift_cluster",)
        categories = (CheckCategories.GENERAL_SECURITY,)
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources,
                         missing_block_result=CheckResult.FAILED)

    def get_inspected_key(self):
        return "database_name"

    def get_expected_value(self) -> Any:
        return ANY_VALUE


check = RedshiftClusterDatabaseName()
