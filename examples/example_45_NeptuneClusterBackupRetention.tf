resource "awscc_neptune_db_cluster" "pass" {
  name = "neptune-cluster-with-backup"
  engine = "neptune"
  backup_retention_period = 7
  master_username = "admin"
  master_user_password = "Password123"
}

resource "awscc_neptune_db_cluster" "fail" {
  name = "neptune-cluster-without-backup"
  engine = "neptune"
  backup_retention_period = 1
  master_username = "admin"
  master_user_password = "Password123"
}
