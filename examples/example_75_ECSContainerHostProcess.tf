resource "awscc_ecs_task_definition" "pass" {
  family = "secure-task-definition"
  
  container_definitions = [
    {
      name      = "web"
      image     = "nginx:latest"
      essential = true
      port_mappings = [
        {
          container_port = 80
          host_port      = 80
        }
      ]
    }
  ]
  
  # pid_mode not specified (defaults to task)
  
  tags = [
    {
      key   = "Environment"
      value = "Production"
    }
  ]
}

resource "awscc_ecs_task_definition" "pass2" {
  family = "secure-task-definition-explicit"
  
  container_definitions = [
    {
      name      = "web"
      image     = "nginx:latest"
      essential = true
      port_mappings = [
        {
          container_port = 80
          host_port      = 80
        }
      ]
    }
  ]
  
  pid_mode = "task"
  
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
      port_mappings = [
        {
          container_port = 80
          host_port      = 80
        }
      ]
    }
  ]
  
  pid_mode = "host"
  
  tags = [
    {
      key   = "Environment"
      value = "Development"
    }
  ]
}
