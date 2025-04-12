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
  
  tags = {
    Environment = "Production"
    Owner = "Data Team"
  }
}

resource "awscc_msk_cluster" "fail_public_access" {
  cluster_name = "example-msk-cluster-public"
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
        type = "SERVICE_PROVIDED_EIPS"
      }
    }
  }
  
  tags = {
    Environment = "Development"
    Owner = "Data Team"
  }
}
