from checkov.common.models.enums import CheckResult, CheckCategories
from checkov.terraform.checks.resource.base_resource_check import BaseResourceCheck


class EC2EBSOptimized(BaseResourceCheck):
    def __init__(self):
        name = "Ensure that EC2 is EBS optimized"
        id = "CKV_AWSCC_135"
        supported_resources = ["awscc_ec2_instance"]
        categories = [CheckCategories.NETWORKING]
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources)

    def scan_resource_conf(self, conf):
        # Some instance types are EBS optimized by default
        ebs_optimized_by_default = [
            't3', 'm5', 'c5', 'r5', 'z1d', 'd2', 'i3', 'i3en', 'p3', 'p3dn', 'g3', 'g3s', 'f1', 'x1', 'x1e'
        ]
        
        # Check if instance type is specified and is EBS optimized by default
        if "instance_type" in conf:
            instance_type = conf["instance_type"]
            if isinstance(instance_type, str):
                for prefix in ebs_optimized_by_default:
                    if instance_type.startswith(prefix):
                        return CheckResult.PASSED
        
        # Check if ebs_optimized is explicitly set to true
        if "ebs_optimized" in conf:
            if conf["ebs_optimized"] is True:
                return CheckResult.PASSED
            # If explicitly set to false
            return CheckResult.FAILED
        
        # Default is false if not specified and not an instance type that's EBS optimized by default
        return CheckResult.FAILED


check = EC2EBSOptimized()
