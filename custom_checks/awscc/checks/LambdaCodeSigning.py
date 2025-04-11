from typing import Any

from checkov.common.models.consts import ANY_VALUE
from checkov.common.models.enums import CheckCategories
from checkov.terraform.checks.resource.base_resource_value_check import (
    BaseResourceValueCheck,
)


class LambdaCodeSigning(BaseResourceValueCheck):
    def __init__(self) -> None:
        name = "Ensure AWS Lambda function is configured to validate code-signing"
        id = "CKV_AWSCC_32"
        supported_resources = ("awscc_lambda_function",)
        categories = (CheckCategories.GENERAL_SECURITY,)
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources)

    def get_inspected_key(self) -> str:
        return "code_signing_config_arn"

    def get_expected_value(self) -> Any:
        return ANY_VALUE


check = LambdaCodeSigning()
