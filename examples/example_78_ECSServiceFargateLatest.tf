resource "awscc_ecs_service" "pass" {
  service_name  = "secure-ecs-service"
  cluster       = "arn:aws:ecs:us-west-2:123456789012:cluster/secure-cluster"
  desired_count = 2
  
  launch_type       = "FARGATE"
  platform_version  = "LATEST"
  
  network_configuration = {
    awsvpc_configuration = {
      subnets = ["subnet-12345678", "subnet-87654321"]
      security_groups = ["sg-12345678"]
    }
  }
  
  task_definition = "arn:aws:ecs:us-west-2:123456789012:task-definition/secure-task:1"
  
  tags = [
    {
      key   = "Environment"
      value = "Production"
    }
  ]
}

resource "awscc_ecs_service" "fail" {
  service_name  = "insecure-ecs-service"
  cluster       = "arn:aws:ecs:us-west-2:123456789012:cluster/insecure-cluster"
  desired_count = 2
  
  launch_type       = "FARGATE"
  platform_version  = "1.3.0"  # Specific older version
  
  network_configuration = {
    awsvpc_configuration = {
      subnets = ["subnet-12345678", "subnet-87654321"]
      security_groups = ["sg-12345678"]
    }
  }
  
  task_definition = "arn:aws:ecs:us-west-2:123456789012:task-definition/insecure-task:1"
  
  tags = [
    {
      key   = "Environment"
      value = "Development"
    }
  ]
}

resource "awscc_ecs_service" "fail2" {
  service_name  = "default-ecs-service"
  cluster       = "arn:aws:ecs:us-west-2:123456789012:cluster/default-cluster"
  desired_count = 2
  
  launch_type       = "FARGATE"
  # platform_version defaults to 1.4.0 when not specified
  
  network_configuration = {
    awsvpc_configuration = {
      subnets = ["subnet-12345678", "subnet-87654321"]
      security_groups = ["sg-12345678"]
    }
  }
  
  task_definition = "arn:aws:ecs:us-west-2:123456789012:task-definition/default-task:1"
  
  tags = [
    {
      key   = "Environment"
      value = "Testing"
    }
  ]
}
