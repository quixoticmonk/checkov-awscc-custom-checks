resource "awscc_rds_db_cluster" "pass" {
  db_cluster_identifier = "secure-db-cluster"
  engine                = "aurora-mysql"
  engine_version        = "5.7.mysql_aurora.2.10.2"
  master_username       = "admin"
  master_user_password  = "Password123!"
  
  storage_encrypted     = true
  kms_key_id            = "arn:aws:kms:us-west-2:123456789012:key/abcd1234-a123-456a-a12b-a123b4cd56ef"
  
  tags = [
    {
      key   = "Environment"
      value = "Production"
    }
  ]
}

resource "awscc_rds_db_cluster" "fail_no_cmk" {
  db_cluster_identifier = "insecure-db-cluster-no-cmk"
  engine                = "aurora-mysql"
  engine_version        = "5.7.mysql_aurora.2.10.2"
  master_username       = "admin"
  master_user_password  = "Password123!"
  
  storage_encrypted     = true
  # No KMS key specified (uses default AWS managed key)
  
  tags = [
    {
      key   = "Environment"
      value = "Development"
    }
  ]
}

resource "awscc_rds_db_cluster" "fail_not_encrypted" {
  db_cluster_identifier = "insecure-db-cluster-not-encrypted"
  engine                = "aurora-mysql"
  engine_version        = "5.7.mysql_aurora.2.10.2"
  master_username       = "admin"
  master_user_password  = "Password123!"
  
  storage_encrypted     = false
  
  tags = [
    {
      key   = "Environment"
      value = "Development"
    }
  ]
}

resource "awscc_rds_db_cluster" "fail_default" {
  db_cluster_identifier = "insecure-db-cluster-default"
  engine                = "aurora-mysql"
  engine_version        = "5.7.mysql_aurora.2.10.2"
  master_username       = "admin"
  master_user_password  = "Password123!"
  
  # storage_encrypted not specified (defaults to false)
  
  tags = [
    {
      key   = "Environment"
      value = "Development"
    }
  ]
}
