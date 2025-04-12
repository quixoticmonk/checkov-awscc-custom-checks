resource "awscc_neptune_db_cluster" "pass" {
  name = "neptune-cluster-with-tags-copy"
  engine = "neptune"
  copy_tags_to_snapshot = true
  master_username = "admin"
  master_user_password = "Password123"
}

resource "awscc_neptune_db_cluster" "fail" {
  name = "neptune-cluster-without-tags-copy"
  engine = "neptune"
  copy_tags_to_snapshot = false
  master_username = "admin"
  master_user_password = "Password123"
}
