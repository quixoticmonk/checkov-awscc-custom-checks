resource "awscc_redshift_cluster" "pass" {
  cluster_identifier = "redshift-version-upgrade"
  node_type          = "dc2.large"
  master_username    = "admin"
  master_user_password = "Password123"
  allow_version_upgrade = true
}

resource "awscc_redshift_cluster" "pass2" {
  cluster_identifier = "redshift-default-version-upgrade"
  node_type          = "dc2.large"
  master_username    = "admin"
  master_user_password = "Password123"
  # allow_version_upgrade defaults to true
}

resource "awscc_redshift_cluster" "fail" {
  cluster_identifier = "redshift-no-version-upgrade"
  node_type          = "dc2.large"
  master_username    = "admin"
  master_user_password = "Password123"
  allow_version_upgrade = false
}
