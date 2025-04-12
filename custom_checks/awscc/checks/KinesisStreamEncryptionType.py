from checkov.terraform.checks.resource.base_resource_value_check import BaseResourceValueCheck
from checkov.common.models.enums import CheckCategories


class KinesisStreamEncryptionType(BaseResourceValueCheck):
    def __init__(self) -> None:
        name = "Ensure Kinesis Stream is securely encrypted"
        id = "CKV_AWSCC_61"
        supported_resources = ["awscc_kinesis_stream"]
        categories = [CheckCategories.ENCRYPTION]
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources)

    def get_inspected_key(self) -> str:
        return "stream_encryption/encryption_type"

    def get_expected_value(self) -> str:
        return "KMS"


check = KinesisStreamEncryptionType()
