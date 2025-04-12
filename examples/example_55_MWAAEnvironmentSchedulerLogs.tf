resource "awscc_mwaa_environment" "pass" {
  name = "example-mwaa-environment"
  airflow_version = "2.5.1"
  
  source_bucket_arn = "arn:aws:s3:::example-mwaa-bucket"
  dag_s3_path = "dags/"
  
  execution_role_arn = "arn:aws:iam::123456789012:role/mwaa-execution-role"
  
  network_configuration = {
    security_group_ids = ["sg-12345678"]
    subnet_ids = ["subnet-12345678", "subnet-87654321"]
  }
  
  logging_configuration = {
    dag_processing_logs = {
      enabled = true
      log_level = "INFO"
    }
    scheduler_logs = {
      enabled = true
      log_level = "INFO"
    }
    task_logs = {
      enabled = true
      log_level = "INFO"
    }
    webserver_logs = {
      enabled = true
      log_level = "INFO"
    }
    worker_logs = {
      enabled = true
      log_level = "INFO"
    }
  }
  
  tags = {
    Environment = "Production"
    Owner = "Data Team"
  }
}

resource "awscc_mwaa_environment" "fail_no_scheduler_logs" {
  name = "example-mwaa-environment"
  airflow_version = "2.5.1"
  
  source_bucket_arn = "arn:aws:s3:::example-mwaa-bucket"
  dag_s3_path = "dags/"
  
  execution_role_arn = "arn:aws:iam::123456789012:role/mwaa-execution-role"
  
  network_configuration = {
    security_group_ids = ["sg-12345678"]
    subnet_ids = ["subnet-12345678", "subnet-87654321"]
  }
  
  logging_configuration = {
    dag_processing_logs = {
      enabled = true
      log_level = "INFO"
    }
    scheduler_logs = {
      enabled = false
      log_level = "INFO"
    }
    task_logs = {
      enabled = true
      log_level = "INFO"
    }
    webserver_logs = {
      enabled = true
      log_level = "INFO"
    }
    worker_logs = {
      enabled = true
      log_level = "INFO"
    }
  }
  
  tags = {
    Environment = "Development"
    Owner = "Data Team"
  }
}
