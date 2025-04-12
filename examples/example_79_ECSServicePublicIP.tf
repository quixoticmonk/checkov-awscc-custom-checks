resource "awscc_ecs_service" "pass" {
  service_name  = "secure-ecs-service"
  cluster       = "arn:aws:ecs:us-west-2:123456789012:cluster/secure-cluster"
  desired_count = 2
  
  launch_type       = "FARGATE"
  
  network_configuration = {
    awsvpc_configuration = {
      subnets = ["subnet-12345678", "subnet-87654321"]
      security_groups = ["sg-12345678"]
      assign_public_ip = "DISABLED"
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

resource "awscc_ecs_service" "pass2" {
  service_name  = "secure-ecs-service-default"
  cluster       = "arn:aws:ecs:us-west-2:123456789012:cluster/secure-cluster"
  desired_count = 2
  
  launch_type       = "FARGATE"
  
  network_configuration = {
    awsvpc_configuration = {
      subnets = ["subnet-12345678", "subnet-87654321"]
      security_groups = ["sg-12345678"]
      # assign_public_ip defaults to DISABLED when not specified
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
  
  network_configuration = {
    awsvpc_configuration = {
      subnets = ["subnet-12345678", "subnet-87654321"]
      security_groups = ["sg-12345678"]
      assign_public_ip = "ENABLED"
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
