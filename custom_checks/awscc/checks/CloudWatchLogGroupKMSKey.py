from checkov.common.models.consts import ANY_VALUE
from checkov.terraform.checks.resource.base_resource_value_check import BaseResourceValueCheck
from checkov.common.models.enums import CheckCategories


class CloudWatchLogGroupKMSKey(BaseResourceValueCheck):
    def __init__(self):
        name = "Ensure that CloudWatch Log Group is encrypted by KMS"
        id = "CKV_AWSCC_21"
        supported_resources = ['awscc_logs_log_group']
        categories = [CheckCategories.ENCRYPTION]
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources)

    def get_inspected_key(self):
        return "kms_key_id"

    def get_expected_value(self):
        return ANY_VALUE


check = CloudWatchLogGroupKMSKey()
