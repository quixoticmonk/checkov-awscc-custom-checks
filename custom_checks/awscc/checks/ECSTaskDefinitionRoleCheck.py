from checkov.terraform.checks.resource.base_resource_check import BaseResourceCheck
from checkov.common.models.enums import CheckCategories, CheckResult


class ECSTaskDefinitionRoleCheck(BaseResourceCheck):
    def __init__(self):
        name = "Ensure that the Execution Role ARN and the Task Role ARN are different in ECS Task definitions"
        id = "CKV_AWSCC_81"
        supported_resources = ["awscc_ecs_task_definition"]
        categories = [CheckCategories.IAM]
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources)

    def scan_resource_conf(self, conf):
        # Check if both roles are defined
        if conf.get("execution_role_arn") and conf.get("task_role_arn"):
            if isinstance(conf["execution_role_arn"], list) and isinstance(conf["task_role_arn"], list):
                if len(conf["execution_role_arn"]) > 0 and len(conf["task_role_arn"]) > 0:
                    execution_role = conf["execution_role_arn"][0]
                    task_role = conf["task_role_arn"][0]
                    
                    # Check if they are the same
                    if execution_role == task_role:
                        self.evaluated_keys = ["execution_role_arn", "task_role_arn"]
                        return CheckResult.FAILED
        
        return CheckResult.PASSED


check = ECSTaskDefinitionRoleCheck()
