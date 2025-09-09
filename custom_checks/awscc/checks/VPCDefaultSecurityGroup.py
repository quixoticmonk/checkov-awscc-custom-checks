from checkov.common.models.enums import Severities
from checkov.terraform.checks.base_check import BaseCheck
from checkov.common.models.consts import CheckResult


class VPCDefaultSecurityGroup(BaseCheck):
    def __init__(self):
        name = "Ensure VPC default security groups do not allow inbound or outbound traffic"
        id = "CKV_AWSCC_149"
        supported_resources = ['awscc_ec2_security_group']
        categories = []
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources,
                         severity=Severities.HIGH)

    def scan_resource_conf(self, conf):
        """
        Looks for default security groups that allow traffic:
        https://docs.aws.amazon.com/securityhub/latest/userguide/ec2-controls.html#ec2-2
        """
        # Check if this is a default security group
        group_name = conf.get('group_name', [None])[0]
        group_description = conf.get('group_description', [None])[0]
        
        # Default security groups have name "default" or description "default VPC security group"
        is_default = (group_name == 'default' or 
                     (group_description and 'default VPC security group' in group_description))
        
        if not is_default:
            return CheckResult.PASSED
            
        # Check for any inbound rules
        security_group_ingress = conf.get('security_group_ingress', [])
        if security_group_ingress and len(security_group_ingress) > 0:
            return CheckResult.FAILED
            
        # Check for any outbound rules (other than default allow-all)
        security_group_egress = conf.get('security_group_egress', [])
        if security_group_egress and len(security_group_egress) > 0:
            # Check if it's not just the default allow-all rule
            for rule in security_group_egress:
                if isinstance(rule, dict):
                    cidr_ip = rule.get('cidr_ip')
                    ip_protocol = rule.get('ip_protocol')
                    # Default rule allows all traffic (0.0.0.0/0, protocol -1)
                    if not (cidr_ip == '0.0.0.0/0' and ip_protocol == '-1'):
                        return CheckResult.FAILED
        
        return CheckResult.PASSED


check = VPCDefaultSecurityGroup()
