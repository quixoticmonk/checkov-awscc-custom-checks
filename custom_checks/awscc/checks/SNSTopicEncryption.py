from typing import Any

from checkov.common.models.consts import ANY_VALUE
from checkov.common.models.enums import CheckCategories
from checkov.terraform.checks.resource.base_resource_value_check import (
    BaseResourceValueCheck,
)


class SNSTopicEncryption(BaseResourceValueCheck):
    def __init__(self) -> None:
        name = "Ensure all data stored in the SNS topic is encrypted"
        id = "CKV_AWSCC_04"
        supported_resources = ("awscc_sns_topic",)
        categories = (CheckCategories.ENCRYPTION,)
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources)

    def get_inspected_key(self) -> str:
        return "kms_master_key_id"

    def get_expected_value(self) -> Any:
        return ANY_VALUE


check = SNSTopicEncryption()
