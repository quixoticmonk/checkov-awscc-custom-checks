from checkov.common.models.enums import CheckResult, CheckCategories
from checkov.terraform.checks.resource.base_resource_check import BaseResourceCheck
import re


class EC2Credentials(BaseResourceCheck):
    def __init__(self):
        name = "Ensure no hard-coded secrets exist in EC2 user data"
        id = "CKV_AWSCC_133"
        supported_resources = ["awscc_ec2_instance"]
        categories = [CheckCategories.SECRETS]
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources)
        
        # Patterns to look for in user data
        self.secret_patterns = [
            r'(?:password|passwd|pass).*?[=:].+',
            r'(?:aws_access_key_id|aws_secret_access_key).*?[=:].+',
            r'(?:secret|token|api[_-]?key).*?[=:].+',
            r'-----BEGIN (?:RSA|DSA|EC|PGP|OPENSSH) PRIVATE KEY-----',
            r'(?:ssh-rsa|ssh-dss|ssh-ed25519|ecdsa-sha2-nistp256|ecdsa-sha2-nistp384|ecdsa-sha2-nistp521)',
        ]

    def scan_resource_conf(self, conf):
        if "user_data" in conf:
            user_data = conf["user_data"]
            if isinstance(user_data, str):
                # Check for potential secrets in user data
                for pattern in self.secret_patterns:
                    if re.search(pattern, user_data, re.IGNORECASE):
                        return CheckResult.FAILED
        
        return CheckResult.PASSED


check = EC2Credentials()
