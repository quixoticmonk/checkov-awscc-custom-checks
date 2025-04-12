resource "awscc_ecs_cluster" "pass_cloudwatch" {
  cluster_name = "secure-ecs-cluster-cloudwatch"
  
  configuration = {
    execute_command_configuration = {
      logging = {
        cloud_watch_logs_configuration = {
          cloud_watch_log_group_name = "ecs-exec-logs"
        }
      }
    }
  }
  
  tags = [
    {
      key   = "Environment"
      value = "Production"
    }
  ]
}

resource "awscc_ecs_cluster" "pass_s3" {
  cluster_name = "secure-ecs-cluster-s3"
  
  configuration = {
    execute_command_configuration = {
      logging = {
        s3_bucket_configuration = {
          bucket_name = "ecs-exec-logs-bucket"
          bucket_encryption_enabled = true
        }
      }
    }
  }
  
  tags = [
    {
      key   = "Environment"
      value = "Production"
    }
  ]
}

resource "awscc_ecs_cluster" "fail" {
  cluster_name = "insecure-ecs-cluster"
  
  configuration = {
    execute_command_configuration = {
      logging = "NONE"
    }
  }
  
  tags = [
    {
      key   = "Environment"
      value = "Development"
    }
  ]
}

resource "awscc_ecs_cluster" "fail2" {
  cluster_name = "default-ecs-cluster"
  
  # No configuration specified
  
  tags = [
    {
      key   = "Environment"
      value = "Testing"
    }
  ]
}
