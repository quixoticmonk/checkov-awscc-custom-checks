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
      # privileged not specified (defaults to false)
    }
  ]
  
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
      privileged = false
    }
  ]
  
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
      privileged = true
    }
  ]
  
  tags = [
    {
      key   = "Environment"
      value = "Development"
    }
  ]
}

resource "awscc_ecs_task_definition" "fail2" {
  family = "insecure-task-definition-multiple"
  
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
      # privileged not specified (defaults to false)
    },
    {
      name      = "sidecar"
      image     = "sidecar:latest"
      essential = false
      privileged = true
    }
  ]
  
  tags = [
    {
      key   = "Environment"
      value = "Development"
    }
  ]
}
