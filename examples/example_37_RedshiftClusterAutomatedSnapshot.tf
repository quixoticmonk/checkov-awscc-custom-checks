resource "awscc_redshift_cluster" "pass" {
  cluster_identifier = "redshift-snapshot-enabled"
  node_type          = "dc2.large"
  master_username    = "admin"
  master_user_password = "Password123"
  automated_snapshot_retention_period = 7  # Default is 1, which is also a pass
}

resource "awscc_redshift_cluster" "fail" {
  cluster_identifier = "redshift-snapshot-disabled"
  node_type          = "dc2.large"
  master_username    = "admin"
  master_user_password = "Password123"
  automated_snapshot_retention_period = 0  # Disabled
}
