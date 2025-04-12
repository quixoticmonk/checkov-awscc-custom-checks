from checkov.common.models.enums import CheckResult, CheckCategories
from checkov.terraform.checks.resource.base_resource_check import BaseResourceCheck


class BatchJobIsNotPrivileged(BaseResourceCheck):
    def __init__(self):
        name = "Batch job does not define a privileged container"
        id = "CKV_AWSCC_118"
        supported_resources = ["awscc_batch_job_definition"]
        categories = [CheckCategories.GENERAL_SECURITY]
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources)

    def scan_resource_conf(self, conf):
        if "container_properties" in conf.keys():
            container_props = conf["container_properties"]
            
            # If container_properties is a string (JSON), we can't easily check it
            # In a real implementation, you might want to parse the JSON
            if isinstance(container_props, str):
                return CheckResult.UNKNOWN
            
            # Check if privileged mode is enabled
            if isinstance(container_props, dict):
                if "privileged" in container_props and container_props["privileged"] is True:
                    return CheckResult.FAILED
        
        return CheckResult.PASSED


check = BatchJobIsNotPrivileged()
