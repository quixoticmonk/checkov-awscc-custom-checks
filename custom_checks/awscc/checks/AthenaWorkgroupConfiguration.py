from checkov.terraform.checks.resource.base_resource_value_check import BaseResourceValueCheck
from checkov.common.models.enums import CheckCategories


class AthenaWorkgroupConfiguration(BaseResourceValueCheck):
    def __init__(self):
        name = "Ensure Athena Workgroup should enforce configuration to prevent client disabling encryption"
        id = "CKV_AWSCC_110"
        supported_resources = ["awscc_athena_work_group"]
        categories = [CheckCategories.ENCRYPTION]
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources)

    def get_inspected_key(self):
        return "configuration/enforce_workgroup_configuration"

    def get_expected_value(self):
        return True


check = AthenaWorkgroupConfiguration()
