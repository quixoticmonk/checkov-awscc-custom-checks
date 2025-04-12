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

resource "awscc_appsync_graph_ql_api" "pass_info" {
  name = "secure-api-info"
  authentication_type = "API_KEY"
  
  log_config = {
    cloud_watch_logs_role_arn = "arn:aws:iam::123456789012:role/AppSyncLoggingRole"
    field_log_level           = "INFO"
  }
  
  tags = [
    {
      key   = "Environment"
      value = "Production"
    }
  ]
}

resource "awscc_appsync_graph_ql_api" "pass_debug" {
  name = "secure-api-debug"
  authentication_type = "API_KEY"
  
  log_config = {
    cloud_watch_logs_role_arn = "arn:aws:iam::123456789012:role/AppSyncLoggingRole"
    field_log_level           = "DEBUG"
  }
  
  tags = [
    {
      key   = "Environment"
      value = "Production"
    }
  ]
}

resource "awscc_appsync_graph_ql_api" "fail_error" {
  name = "insecure-api-error"
  authentication_type = "API_KEY"
  
  log_config = {
    cloud_watch_logs_role_arn = "arn:aws:iam::123456789012:role/AppSyncLoggingRole"
    field_log_level           = "ERROR"  # Only logs errors, not sufficient
  }
  
  tags = [
    {
      key   = "Environment"
      value = "Development"
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
