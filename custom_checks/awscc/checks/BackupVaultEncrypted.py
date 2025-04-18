from typing import Any

from checkov.common.models.consts import ANY_VALUE
from checkov.common.models.enums import CheckCategories
from checkov.terraform.checks.resource.base_resource_value_check import (
    BaseResourceValueCheck,
)


class BackupVaultEncrypted(BaseResourceValueCheck):
    def __init__(self) -> None:
        name = "Ensure Backup Vault is encrypted at rest using KMS CMK"
        id = "CKV_AWSCC_23"
        supported_resources = ("awscc_backup_backup_vault",)
        categories = (CheckCategories.ENCRYPTION,)
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources)

    def get_inspected_key(self) -> str:
        return "encryption_key_arn"

    def get_expected_value(self) -> Any:
        return ANY_VALUE


check = BackupVaultEncrypted()
