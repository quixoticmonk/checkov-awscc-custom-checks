import json
from checkov.common.models.enums import CheckCategories, CheckResult
from checkov.terraform.checks.resource.base_resource_check import BaseResourceCheck


class IAMAdminPolicyDocument(BaseResourceCheck):
    def __init__(self):
        name = "Ensure IAM policies do not allow admin privileges"
        id = "CKV_AWSCC_146"
        supported_resources = ["awscc_iam_role_policy", "awscc_iam_group_policy", "awscc_iam_user_policy"]
        categories = [CheckCategories.IAM]
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources)

    def scan_resource_conf(self, conf):
        if "policy_document" not in conf:
            return CheckResult.UNKNOWN
            
        try:
            policy_doc = conf["policy_document"][0]
            if isinstance(policy_doc, str):
                policy = json.loads(policy_doc)
            else:
                policy = policy_doc
                
            if "Statement" not in policy:
                return CheckResult.UNKNOWN
                
            for statement in policy["Statement"]:
                if statement.get("Effect", "") == "Allow":
                    actions = statement.get("Action", [])
                    resources = statement.get("Resource", [])
                    
                    # Convert to list if it's a string
                    if isinstance(actions, str):
                        actions = [actions]
                    if isinstance(resources, str):
                        resources = [resources]
                    
                    # Check for admin privileges
                    if "*" in actions and "*" in resources:
                        return CheckResult.FAILED
                        
            return CheckResult.PASSED
            
        except Exception:
            return CheckResult.UNKNOWN


check = IAMAdminPolicyDocument()
