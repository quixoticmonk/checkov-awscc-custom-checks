resource "awscc_redshift_cluster" "pass" {
  cluster_identifier = "redshift-kms-encrypted"
  node_type          = "dc2.large"
  master_username    = "admin"
  master_user_password = "Password123"
  encrypted          = true
  kms_key_id         = "arn:aws:kms:us-west-2:123456789012:key/abcd1234-a123-456a-a12b-a123b4cd56ef"
}

resource "awscc_redshift_cluster" "fail" {
  cluster_identifier = "redshift-default-encryption"
  node_type          = "dc2.large"
  master_username    = "admin"
  master_user_password = "Password123"
  encrypted          = true
  # No KMS key specified, will use default AWS managed key
}

resource "awscc_redshift_cluster" "fail2" {
  cluster_identifier = "redshift-unencrypted"
  node_type          = "dc2.large"
  master_username    = "admin"
  master_user_password = "Password123"
  encrypted          = false
  # No encryption, so KMS key is irrelevant
}
