resource "awscc_neptune_db_cluster" "pass" {
  name = "neptune-cluster-encrypted"
  engine = "neptune"
  storage_encrypted = true
  master_username = "admin"
  master_user_password = "Password123"
}

resource "awscc_neptune_db_cluster" "fail" {
  name = "neptune-cluster-not-encrypted"
  engine = "neptune"
  storage_encrypted = false
  master_username = "admin"
  master_user_password = "Password123"
}
