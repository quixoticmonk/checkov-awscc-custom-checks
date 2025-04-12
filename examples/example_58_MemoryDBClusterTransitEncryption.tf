resource "awscc_memorydb_cluster" "pass" {
  cluster_name = "example-memorydb-cluster"
  node_type = "db.r6g.large"
  num_shards = 2
  
  acl_name = "open-access"
  subnet_group_name = "memorydb-subnet-group"
  
  tls_enabled = true
  kms_key_arn = "arn:aws:kms:us-west-2:123456789012:key/abcd1234-a123-456a-a12b-a123b4cd56ef"
  
  tags = {
    Environment = "Production"
    Owner = "Data Team"
  }
}

resource "awscc_memorydb_cluster" "fail_no_tls" {
  cluster_name = "example-memorydb-cluster"
  node_type = "db.r6g.large"
  num_shards = 2
  
  acl_name = "open-access"
  subnet_group_name = "memorydb-subnet-group"
  
  tls_enabled = false
  kms_key_arn = "arn:aws:kms:us-west-2:123456789012:key/abcd1234-a123-456a-a12b-a123b4cd56ef"
  
  tags = {
    Environment = "Development"
    Owner = "Data Team"
  }
}
