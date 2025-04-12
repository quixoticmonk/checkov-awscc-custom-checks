from checkov.common.models.enums import CheckResult, CheckCategories
from checkov.terraform.checks.resource.base_resource_check import BaseResourceCheck


class CognitoUnauthenticatedIdentities(BaseResourceCheck):
    def __init__(self):
        name = "Ensure AWS Cognito identity pool does not allow unauthenticated guest access"
        id = "CKV_AWSCC_126"
        supported_resources = ["awscc_cognito_identity_pool"]
        categories = [CheckCategories.IAM]
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources)

    def scan_resource_conf(self, conf):
        # Check if allow_unauthenticated_identities is specified and set to false
        if "allow_unauthenticated_identities" in conf:
            if conf["allow_unauthenticated_identities"] is False:
                return CheckResult.PASSED
            # If explicitly set to true
            return CheckResult.FAILED
        # Default is false if not specified
        return CheckResult.PASSED


check = CognitoUnauthenticatedIdentities()
