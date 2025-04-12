# pass - retention set to 1 year (365 days)
resource "awscc_logs_log_group" "pass" {
  log_group_name    = "example-log-group-1year"
  retention_in_days = 365
}

# pass - retention set to 2 years (730 days)
resource "awscc_logs_log_group" "pass_2years" {
  log_group_name    = "example-log-group-2years"
  retention_in_days = 730
}

# pass - retention set to never expire (0)
resource "awscc_logs_log_group" "pass_never_expire" {
  log_group_name    = "example-log-group-never-expire"
  retention_in_days = 0
}

# fail - retention less than 1 year
resource "awscc_logs_log_group" "fail" {
  log_group_name    = "example-log-group-30days"
  retention_in_days = 30
}

# fail - no retention specified
resource "awscc_logs_log_group" "fail_no_retention" {
  log_group_name = "example-log-group-no-retention"
}
