from typing import Any

from checkov.common.models.consts import ANY_VALUE
from checkov.common.models.enums import CheckCategories
from checkov.terraform.checks.resource.base_resource_value_check import BaseResourceValueCheck


class APIGatewayAccessLogging(BaseResourceValueCheck):
    def __init__(self) -> None:
        name = "Ensure API Gateway has access logging enabled"
        id = "CKV_AWSCC_14"
        supported_resources = ("awscc_apigateway_stage",)
        categories = (CheckCategories.LOGGING,)
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources)

    def get_inspected_key(self) -> str:
        return "access_log_setting"

    def get_expected_value(self) -> Any:
        return ANY_VALUE


check = APIGatewayAccessLogging()
