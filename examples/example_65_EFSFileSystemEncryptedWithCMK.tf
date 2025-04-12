resource "awscc_efs_file_system" "pass" {
  file_system_tags = [
    {
      key   = "Name"
      value = "cmk-encrypted-efs"
    }
  ]
  encrypted  = true
  kms_key_id = "arn:aws:kms:us-west-2:123456789012:key/abcd1234-a123-456a-a12b-a123b4cd56ef"
}

resource "awscc_efs_file_system" "fail" {
  file_system_tags = [
    {
      key   = "Name"
      value = "default-encrypted-efs"
    }
  ]
  encrypted = true
  # No KMS key specified, will use AWS managed key
}
