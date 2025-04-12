from checkov.common.models.enums import CheckResult, CheckCategories
from checkov.terraform.checks.resource.base_resource_check import BaseResourceCheck


class EKSSecretsEncryption(BaseResourceCheck):
    def __init__(self):
        name = "Ensure EKS Cluster has Secrets Encryption Enabled"
        id = "CKV_AWSCC_137"
        supported_resources = ["awscc_eks_cluster"]
        categories = [CheckCategories.ENCRYPTION]
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources)

    def scan_resource_conf(self, conf):
        # Check if encryption_config is specified
        if "encryption_config" in conf:
            encryption_config = conf["encryption_config"]
            if isinstance(encryption_config, list) and len(encryption_config) > 0:
                for config in encryption_config:
                    if isinstance(config, dict) and "resources" in config:
                        resources = config["resources"]
                        if isinstance(resources, list) and "secrets" in resources:
                            # Check if provider is specified with a KMS key
                            if "provider" in config:
                                provider = config["provider"]
                                if isinstance(provider, dict) and "key_arn" in provider:
                                    if provider["key_arn"]:
                                        return CheckResult.PASSED
            return CheckResult.FAILED
        return CheckResult.FAILED


check = EKSSecretsEncryption()
