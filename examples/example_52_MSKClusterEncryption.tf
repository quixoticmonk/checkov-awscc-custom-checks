resource "awscc_msk_cluster" "pass" {
  cluster_name = "example-msk-cluster"
  kafka_version = "2.8.1"
  number_of_broker_nodes = 3
  
  broker_node_group_info = {
    instance_type = "kafka.m5.large"
    client_subnets = ["subnet-12345678", "subnet-87654321", "subnet-11223344"]
    security_groups = ["sg-12345678"]
    storage_info = {
      ebs_storage_info = {
        volume_size = 100
      }
    }
    connectivity_info = {
      public_access = {
        type = "DISABLED"
      }
    }
  }
  
  encryption_info = {
    encryption_at_rest_kms_key_arn = "arn:aws:kms:us-west-2:123456789012:key/abcd1234-a123-456a-a12b-a123b4cd56ef"
    encryption_in_transit = {
      client_broker = "TLS"
      in_cluster = true
    }
  }
  
  # Add logging configuration to pass the logging check
  logging_info = {
    broker_logs = {
      cloudwatch_logs = {
        enabled = true
        log_group = "msk-cluster-logs"
      }
    }
  }
  
  tags = {
    Environment = "Production"
    Owner = "Data Team"
  }
}

resource "awscc_msk_cluster" "fail_no_encryption" {
  cluster_name = "example-msk-cluster-no-encryption"
  kafka_version = "2.8.1"
  number_of_broker_nodes = 3
  
  broker_node_group_info = {
    instance_type = "kafka.m5.large"
    client_subnets = ["subnet-12345678", "subnet-87654321", "subnet-11223344"]
    security_groups = ["sg-12345678"]
    storage_info = {
      ebs_storage_info = {
        volume_size = 100
      }
    }
  }
  
  tags = {
    Environment = "Development"
    Owner = "Data Team"
  }
}

resource "awscc_msk_cluster" "fail_weak_encryption" {
  cluster_name = "example-msk-cluster-weak-encryption"
  kafka_version = "2.8.1"
  number_of_broker_nodes = 3
  
  broker_node_group_info = {
    instance_type = "kafka.m5.large"
    client_subnets = ["subnet-12345678", "subnet-87654321", "subnet-11223344"]
    security_groups = ["sg-12345678"]
    storage_info = {
      ebs_storage_info = {
        volume_size = 100
      }
    }
  }
  
  encryption_info = {
    encryption_in_transit = {
      client_broker = "PLAINTEXT"
      in_cluster = false
    }
  }
  
  tags = {
    Environment = "Development"
    Owner = "Data Team"
  }
}
