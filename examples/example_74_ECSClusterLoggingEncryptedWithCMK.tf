resource "awscc_ecs_cluster" "pass_cloudwatch" {
  cluster_name = "secure-ecs-cluster-cloudwatch"
  
  configuration = {
    execute_command_configuration = {
      kms_key_id = "arn:aws:kms:us-west-2:123456789012:key/abcd1234-a123-456a-a12b-a123b4cd56ef"
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
      kms_key_id = "arn:aws:kms:us-west-2:123456789012:key/abcd1234-a123-456a-a12b-a123b4cd56ef"
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

resource "awscc_ecs_cluster" "fail_no_kms" {
  cluster_name = "insecure-ecs-cluster-no-kms"
  
  configuration = {
    execute_command_configuration = {
      # No KMS key specified
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
      value = "Development"
    }
  ]
}

resource "awscc_ecs_cluster" "fail_no_logging" {
  cluster_name = "insecure-ecs-cluster-no-logging"
  
  configuration = {
    execute_command_configuration = {
      kms_key_id = "arn:aws:kms:us-west-2:123456789012:key/abcd1234-a123-456a-a12b-a123b4cd56ef"
      # No logging configuration
    }
  }
  
  tags = [
    {
      key   = "Environment"
      value = "Development"
    }
  ]
}

resource "awscc_ecs_cluster" "fail_no_config" {
  cluster_name = "default-ecs-cluster"
  
  # No configuration specified
  
  tags = [
    {
      key   = "Environment"
      value = "Testing"
    }
  ]
}
