# pass
resource "awscc_logs_log_group" "pass" {
  log_group_name    = "example-log-group"
  retention_in_days = 30
}

# fail - no retention specified
resource "awscc_logs_log_group" "fail" {
  log_group_name = "example-log-group-no-retention"
}
