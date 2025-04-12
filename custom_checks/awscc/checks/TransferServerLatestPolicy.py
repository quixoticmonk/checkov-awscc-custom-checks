from checkov.terraform.checks.resource.base_resource_value_check import BaseResourceValueCheck
from checkov.common.models.enums import CheckCategories


class TransferServerLatestPolicy(BaseResourceValueCheck):
    def __init__(self):
        name = "Ensure AWS Transfer Server uses latest Security Policy"
        id = "CKV_AWSCC_102"
        supported_resources = ["awscc_transfer_server"]
        categories = [CheckCategories.GENERAL_SECURITY]
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources)

    def get_inspected_key(self):
        return "security_policy_name"

    def get_expected_value(self):
        return "TransferSecurityPolicy-2023-05"


check = TransferServerLatestPolicy()
