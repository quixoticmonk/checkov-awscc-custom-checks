from checkov.common.models.enums import CheckCategories
from checkov.terraform.checks.resource.base_resource_negative_value_check import \
    BaseResourceNegativeValueCheck


class SubnetPublicIP(BaseResourceNegativeValueCheck):
    def __init__(self):
        name = "Ensure VPC subnets do not assign public IP by default"
        id = "CKV_AWSCC_16"
        supported_resources = ['awscc_ec2_subnet']
        categories = [CheckCategories.NETWORKING]
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources)

    def get_forbidden_values(self):
        return [True]

    def get_inspected_key(self):
        return "map_public_ip_on_launch"


check = SubnetPublicIP()
