from checkov.terraform.checks.resource.base_resource_check import BaseResourceCheck
from checkov.common.models.enums import CheckCategories, CheckResult


class EFSAccessPointRoot(BaseResourceCheck):
    def __init__(self):
        name = "EFS access points should enforce a root directory"
        id = "CKV_AWSCC_66"
        supported_resources = ["awscc_efs_access_point"]
        categories = [CheckCategories.GENERAL_SECURITY]
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources)

    def scan_resource_conf(self, conf):
        if conf.get("root_directory") and isinstance(conf["root_directory"], list) and len(conf["root_directory"]) > 0:
            root_dir = conf["root_directory"][0]
            if root_dir.get("path") and isinstance(root_dir["path"], list) and len(root_dir["path"]) > 0:
                if root_dir["path"][0] != "/":
                    self.evaluated_keys = ["root_directory/[0]/path"]
                    return CheckResult.PASSED
            self.evaluated_keys = ["root_directory/[0]/path"]
        return CheckResult.FAILED


check = EFSAccessPointRoot()
