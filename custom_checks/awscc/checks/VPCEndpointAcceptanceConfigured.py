from checkov.terraform.checks.resource.base_resource_value_check import BaseResourceValueCheck
from checkov.common.models.enums import CheckCategories


class VPCEndpointAcceptanceConfigured(BaseResourceValueCheck):
    def __init__(self):
        name = "Ensure that VPC Endpoint Service is configured for Manual Acceptance"
        id = "CKV_AWSCC_103"
        supported_resources = ["awscc_ec2_vpc_endpoint_service"]
        categories = [CheckCategories.NETWORKING]
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources)

    def get_inspected_key(self):
        return "acceptance_required"

    def get_expected_value(self):
        return True


check = VPCEndpointAcceptanceConfigured()
