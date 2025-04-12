resource "awscc_redshiftserverless_namespace" "pass" {
  namespace_name = "example-namespace"
  admin_username = "admin"
  admin_user_password = "Password123"
  kms_key_id = "arn:aws:kms:us-west-2:123456789012:key/abcd1234-a123-456a-a12b-a123b4cd56ef"
}

resource "awscc_redshiftserverless_namespace" "fail" {
  namespace_name = "example-namespace-no-kms"
  admin_username = "admin"
  admin_user_password = "Password123"
  # No KMS key specified, will use default encryption
}
