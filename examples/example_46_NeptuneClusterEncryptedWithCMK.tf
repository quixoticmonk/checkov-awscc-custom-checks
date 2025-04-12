resource "awscc_neptune_db_cluster" "pass" {
  name = "neptune-cluster-with-cmk"
  engine = "neptune"
  kms_key_id = "arn:aws:kms:us-west-2:123456789012:key/abcd1234-a123-456a-a12b-a123b4cd56ef"
  master_username = "admin"
  master_user_password = "Password123"
}

resource "awscc_neptune_db_cluster" "fail" {
  name = "neptune-cluster-without-cmk"
  engine = "neptune"
  # No KMS key specified, will use default encryption
  master_username = "admin"
  master_user_password = "Password123"
}
