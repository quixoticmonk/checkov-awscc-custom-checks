resource "awscc_msk_cluster" "pass" {
  cluster_name           = "example-msk-cluster"
  kafka_version          = "2.8.1"
  number_of_broker_nodes = 3

  broker_node_group_info = {
    instance_type   = "kafka.m5.large"
    client_subnets  = ["subnet-12345678", "subnet-87654321", "subnet-11223344"]
    security_groups = ["sg-12345678"]
    storage_info = {
      ebs_storage_info = {
        volume_size = 100
      }
    }
  }

  logging_info = {
    broker_logs = {
      cloudwatch_logs = {
        enabled   = true
        log_group = "msk-cluster-logs"
      }
      s3 = {
        enabled = true
        bucket  = "msk-logs-bucket"
        prefix  = "logs/msk-cluster/"
      }
      firehose = {
        enabled         = true
        delivery_stream = "msk-delivery-stream"
      }
    }
  }

  tags = {
    Environment = "Production"
    Owner       = "Data Team"
  }
}

resource "awscc_msk_cluster" "fail_no_logging" {
  cluster_name           = "example-msk-cluster-no-logging"
  kafka_version          = "2.8.1"
  number_of_broker_nodes = 3

  broker_node_group_info = {
    instance_type   = "kafka.m5.large"
    client_subnets  = ["subnet-12345678", "subnet-87654321", "subnet-11223344"]
    security_groups = ["sg-12345678"]
    storage_info = {
      ebs_storage_info = {
        volume_size = 100
      }
    }
  }

  logging_info = {
    broker_logs = {
      cloudwatch_logs = {
        enabled = false
      }
      s3 = {
        enabled = false
      }
      firehose = {
        enabled = false
      }
    }
  }

  tags = {
    Environment = "Development"
    Owner       = "Data Team"
  }
}
