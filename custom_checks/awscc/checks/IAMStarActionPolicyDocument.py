from checkov.common.models.enums import CheckResult
from checkov.terraform.checks.resource.base_resource_check import BaseResourceCheck
import json


class IAMStarActionPolicyDocument(BaseResourceCheck):
    def __init__(self):
        name = "Ensure no IAM policies documents allow '*' as a statement's actions"
        id = "CKV_AWSCC_147"
        supported_resources = ["awscc_iam_role_policy", "awscc_iam_group_policy", "awscc_iam_user_policy"]
        categories = ["security"]
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources)

    def scan_resource_conf(self, conf):
        """
        Looks for wildcard actions in IAM policies:
        https://github.com/bridgecrewio/checkov/blob/main/checkov/terraform/checks/resource/aws/IAMStarActionPolicyDocument.py
        """
        if "policy_document" in conf.keys():
            policy_doc = conf["policy_document"]
            
            # If policy_document is a string, try to parse it as JSON
            if isinstance(policy_doc, str):
                try:
                    policy_doc = json.loads(policy_doc)
                except:
                    return CheckResult.UNKNOWN
            
            # Check for wildcard actions
            if isinstance(policy_doc, dict) and "Statement" in policy_doc:
                statements = policy_doc["Statement"]
                if not isinstance(statements, list):
                    statements = [statements]
                
                for statement in statements:
                    if isinstance(statement, dict):
                        if "Effect" in statement and statement["Effect"] == "Allow":
                            # Check for wildcard action
                            if "Action" in statement:
                                actions = statement["Action"]
                                if not isinstance(actions, list):
                                    actions = [actions]
                                
                                for action in actions:
                                    if action == "*":
                                        return CheckResult.FAILED
                                    # Also check for service-specific wildcards like "s3:*"
                                    if isinstance(action, str) and action.endswith(":*"):
                                        return CheckResult.FAILED
        
        return CheckResult.PASSED


check = IAMStarActionPolicyDocument()
