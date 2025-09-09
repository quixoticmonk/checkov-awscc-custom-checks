from checkov.common.models.enums import Severities
from checkov.terraform.checks.base_check import BaseCheck
from checkov.common.models.consts import CheckResult


class EBSSnapshotPublicAccess(BaseCheck):
    def __init__(self):
        name = "Ensure EBS snapshots are not publicly restorable"
        id = "CKV_AWSCC_148"
        supported_resources = ['awscc_ec2_snapshot']
        categories = []
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources,
                         severity=Severities.CRITICAL)

    def scan_resource_conf(self, conf):
        """
        Looks for EBS snapshots that are not publicly restorable:
        https://docs.aws.amazon.com/securityhub/latest/userguide/ec2-controls.html#ec2-1
        """
        if 'create_volume_permissions' in conf:
            permissions = conf['create_volume_permissions'][0]
            if isinstance(permissions, list):
                for permission in permissions:
                    if isinstance(permission, dict) and permission.get('group') == 'all':
                        return CheckResult.FAILED
            elif isinstance(permissions, dict) and permissions.get('group') == 'all':
                return CheckResult.FAILED
        return CheckResult.PASSED


check = EBSSnapshotPublicAccess()
