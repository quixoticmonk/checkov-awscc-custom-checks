resource "awscc_neptune_db_cluster" "pass" {
  name = "neptune-cluster-with-logging"
  engine = "neptune"
  enable_cloudwatch_logs_exports = ["audit"]
  master_username = "admin"
  master_user_password = "Password123"
}

resource "awscc_neptune_db_cluster" "fail" {
  name = "neptune-cluster-without-logging"
  engine = "neptune"
  # No CloudWatch logs exports specified
  master_username = "admin"
  master_user_password = "Password123"
}
