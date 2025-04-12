resource "awscc_neptune_db_cluster" "pass" {
  name = "neptune-cluster-with-iam-auth"
  engine = "neptune"
  iam_database_authentication_enabled = true
  master_username = "admin"
  master_user_password = "Password123"
}

resource "awscc_neptune_db_cluster" "fail" {
  name = "neptune-cluster-without-iam-auth"
  engine = "neptune"
  iam_database_authentication_enabled = false
  master_username = "admin"
  master_user_password = "Password123"
}
