resource "awscc_neptune_db_instance" "pass" {
  db_instance_identifier = "neptune-instance-private"
  db_instance_class = "db.r5.large"
  engine = "neptune"
  db_cluster_identifier = "neptune-cluster"
  publicly_accessible = false
}

resource "awscc_neptune_db_instance" "fail" {
  db_instance_identifier = "neptune-instance-public"
  db_instance_class = "db.r5.large"
  engine = "neptune"
  db_cluster_identifier = "neptune-cluster"
  publicly_accessible = true
}
