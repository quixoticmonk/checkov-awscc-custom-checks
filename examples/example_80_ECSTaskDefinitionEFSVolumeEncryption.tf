resource "awscc_ecs_task_definition" "pass" {
  family = "secure-task-definition"
  
  container_definitions = [
    {
      name      = "web"
      image     = "nginx:latest"
      essential = true
      mount_points = [
        {
          source_volume  = "efs-data"
          container_path = "/data"
          read_only      = false
        }
      ]
    }
  ]
  
  volumes = [
    {
      name = "efs-data"
      efs_volume_configuration = {
        file_system_id = "fs-12345678"
        transit_encryption = "ENABLED"
        transit_encryption_port = 2049
        authorization_config = {
          access_point_id = "fsap-12345678"
          iam = "ENABLED"
        }
      }
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
      mount_points = [
        {
          source_volume  = "efs-data"
          container_path = "/data"
          read_only      = false
        }
      ]
    }
  ]
  
  volumes = [
    {
      name = "efs-data"
      efs_volume_configuration = {
        file_system_id = "fs-12345678"
        transit_encryption = "DISABLED"
      }
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
  family = "insecure-task-definition-default"
  
  container_definitions = [
    {
      name      = "web"
      image     = "nginx:latest"
      essential = true
      mount_points = [
        {
          source_volume  = "efs-data"
          container_path = "/data"
          read_only      = false
        }
      ]
    }
  ]
  
  volumes = [
    {
      name = "efs-data"
      efs_volume_configuration = {
        file_system_id = "fs-12345678"
        # transit_encryption not specified (defaults to disabled)
      }
    }
  ]
  
  tags = [
    {
      key   = "Environment"
      value = "Development"
    }
  ]
}
