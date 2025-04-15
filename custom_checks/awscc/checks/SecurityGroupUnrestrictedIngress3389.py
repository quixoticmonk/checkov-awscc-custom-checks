from checkov.common.models.enums import CheckCategories, CheckResult
from checkov.terraform.checks.resource.base_resource_check import BaseResourceCheck


class SecurityGroupUnrestrictedIngress3389(BaseResourceCheck):
    def __init__(self):
        name = "Ensure no security groups allow ingress from 0.0.0.0/0 or ::/0 to port 3389"
        id = "CKV_AWSCC_145"
        supported_resources = ["awscc_ec2_security_group_ingress"]
        categories = [CheckCategories.NETWORKING]
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources)

    def scan_resource_conf(self, conf):
        # Check if the rule applies to port 3389 (RDP)
        from_port = conf.get("from_port", [None])[0]
        to_port = conf.get("to_port", [None])[0]
        
        if from_port is None or to_port is None:
            return CheckResult.UNKNOWN
            
        # Check if the rule includes port 3389
        if not (int(from_port) <= 3389 <= int(to_port)):
            return CheckResult.PASSED
            
        # Check for unrestricted access (0.0.0.0/0 or ::/0)
        cidr_ip = conf.get("cidr_ip", [None])[0]
        cidr_ipv6 = conf.get("cidr_ipv6", [None])[0]
        
        if cidr_ip == "0.0.0.0/0" or cidr_ipv6 == "::/0":
            return CheckResult.FAILED
            
        return CheckResult.PASSED


check = SecurityGroupUnrestrictedIngress3389()
