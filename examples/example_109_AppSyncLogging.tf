resource "awscc_appsync_graph_ql_api" "pass_all" {
  name = "secure-api-all"
  authentication_type = "API_KEY"
  
  log_config = {
    cloud_watch_logs_role_arn = "arn:aws:iam::123456789012:role/AppSyncLoggingRole"
    field_log_level           = "ALL"
  }
  
  tags = [
    {
      key   = "Environment"
      value = "Production"
    }
  ]
}

resource "awscc_appsync_graph_ql_api" "pass_error" {
  name = "secure-api-error"
  authentication_type = "API_KEY"
  
  log_config = {
    cloud_watch_logs_role_arn = "arn:aws:iam::123456789012:role/AppSyncLoggingRole"
    field_log_level           = "ERROR"  # ERROR is acceptable for basic logging
  }
  
  tags = [
    {
      key   = "Environment"
      value = "Production"
    }
  ]
}

resource "awscc_appsync_graph_ql_api" "fail_off" {
  name = "insecure-api-off"
  authentication_type = "API_KEY"
  
  log_config = {
    cloud_watch_logs_role_arn = "arn:aws:iam::123456789012:role/AppSyncLoggingRole"
    field_log_level           = "OFF"  # Logging disabled
  }
  
  tags = [
    {
      key   = "Environment"
      value = "Development"
    }
  ]
}

resource "awscc_appsync_graph_ql_api" "fail_no_role" {
  name = "insecure-api-no-role"
  authentication_type = "API_KEY"
  
  log_config = {
    # No CloudWatch logs role ARN specified
    field_log_level = "ALL"
  }
  
  tags = [
    {
      key   = "Environment"
      value = "Development"
    }
  ]
}

resource "awscc_appsync_graph_ql_api" "fail_no_logs" {
  name = "insecure-api-no-logs"
  authentication_type = "API_KEY"
  
  # No log_config specified
  
  tags = [
    {
      key   = "Environment"
      value = "Development"
    }
  ]
}
