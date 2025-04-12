from checkov.common.models.enums import CheckResult, CheckCategories
from checkov.terraform.checks.resource.base_resource_check import BaseResourceCheck


class EC2PublicIP(BaseResourceCheck):
    def __init__(self):
        name = "EC2 instance should not have public IP"
        id = "CKV_AWSCC_136"
        supported_resources = ["awscc_ec2_instance"]
        categories = [CheckCategories.NETWORKING]
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources)

    def scan_resource_conf(self, conf):
        # Check if associate_public_ip_address is specified
        if "network_interfaces" in conf:
            network_interfaces = conf["network_interfaces"]
            if isinstance(network_interfaces, list):
                for interface in network_interfaces:
                    if isinstance(interface, dict) and "associate_public_ip_address" in interface:
                        if interface["associate_public_ip_address"] is True:
                            return CheckResult.FAILED
        
        # Check if associate_public_ip_address is specified at the instance level
        if "associate_public_ip_address" in conf:
            if conf["associate_public_ip_address"] is True:
                return CheckResult.FAILED
        
        return CheckResult.PASSED


check = EC2PublicIP()
