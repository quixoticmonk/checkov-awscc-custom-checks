from checkov.terraform.checks.resource.base_resource_value_check import BaseResourceValueCheck
from checkov.common.models.enums import CheckCategories


class StateMachineXray(BaseResourceValueCheck):
    def __init__(self):
        name = "Ensure State Machine has X-Ray tracing enabled"
        id = "CKV_AWSCC_98"
        supported_resources = ["awscc_stepfunctions_state_machine"]
        categories = [CheckCategories.LOGGING]
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources)

    def get_inspected_key(self):
        return "tracing_configuration/enabled"

    def get_expected_value(self):
        return True


check = StateMachineXray()
