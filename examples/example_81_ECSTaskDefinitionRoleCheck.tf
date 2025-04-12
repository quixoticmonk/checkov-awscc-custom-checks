resource "awscc_ecs_task_definition" "pass" {
  family = "secure-task-definition"
  
  container_definitions = [
    {
      name      = "web"
      image     = "nginx:latest"
      essential = true
    }
  ]
  
  execution_role_arn = "arn:aws:iam::123456789012:role/ecsTaskExecutionRole"
  task_role_arn      = "arn:aws:iam::123456789012:role/ecsTaskRole"
  
  tags = [
    {
      key   = "Environment"
      value = "Production"
    }
  ]
}

resource "awscc_ecs_task_definition" "pass2" {
  family = "secure-task-definition-single-role"
  
  container_definitions = [
    {
      name      = "web"
      image     = "nginx:latest"
      essential = true
    }
  ]
  
  # Only one role defined, so no conflict
  task_role_arn = "arn:aws:iam::123456789012:role/ecsTaskRole"
  
  tags = [
    {
      key   = "Environment"
      value = "Production"
    }
  ]
}

resource "awscc_ecs_task_definition" "pass3" {
  family = "secure-task-definition-execution-only"
  
  container_definitions = [
    {
      name      = "web"
      image     = "nginx:latest"
      essential = true
    }
  ]
  
  # Only one role defined, so no conflict
  execution_role_arn = "arn:aws:iam::123456789012:role/ecsTaskExecutionRole"
  
  tags = [
    {
      key   = "Environment"
      value = "Production"
    }
  ]
}

resource "awscc_ecs_task_definition" "fail" {
  family = "insecure-task-definition"
  
  container_definitions = [
    {
      name      = "web"
      image     = "nginx:latest"
      essential = true
    }
  ]
  
  # Same role used for both execution and task
  execution_role_arn = "arn:aws:iam::123456789012:role/ecsSharedRole"
  task_role_arn      = "arn:aws:iam::123456789012:role/ecsSharedRole"
  
  tags = [
    {
      key   = "Environment"
      value = "Development"
    }
  ]
}
