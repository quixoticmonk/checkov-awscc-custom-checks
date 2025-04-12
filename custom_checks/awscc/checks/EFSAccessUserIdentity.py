from checkov.terraform.checks.resource.base_resource_check import BaseResourceCheck
from checkov.common.models.enums import CheckCategories, CheckResult


class EFSAccessUserIdentity(BaseResourceCheck):
    def __init__(self):
        name = "EFS access points should enforce a user identity"
        id = "CKV_AWSCC_67"
        supported_resources = ["awscc_efs_access_point"]
        categories = [CheckCategories.GENERAL_SECURITY]
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources)

    def scan_resource_conf(self, conf):
        if conf.get("posix_user") and isinstance(conf["posix_user"], list) and len(conf["posix_user"]) > 0:
            posix_user = conf["posix_user"][0]
            if posix_user.get("uid") and isinstance(posix_user["uid"], list) and len(posix_user["uid"]) > 0:
                if posix_user.get("gid") and isinstance(posix_user["gid"], list) and len(posix_user["gid"]) > 0:
                    self.evaluated_keys = ["posix_user/[0]/uid", "posix_user/[0]/gid"]
                    return CheckResult.PASSED
        return CheckResult.FAILED


check = EFSAccessUserIdentity()
