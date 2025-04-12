resource "awscc_ecs_cluster" "pass" {
  cluster_name = "secure-ecs-cluster"
  
  cluster_settings = [
    {
      name  = "containerInsights"
      value = "enabled"
    }
  ]
  
  tags = [
    {
      key   = "Environment"
      value = "Production"
    }
  ]
}

resource "awscc_ecs_cluster" "fail" {
  cluster_name = "insecure-ecs-cluster"
  
  cluster_settings = [
    {
      name  = "containerInsights"
      value = "disabled"
    }
  ]
  
  tags = [
    {
      key   = "Environment"
      value = "Development"
    }
  ]
}

resource "awscc_ecs_cluster" "fail2" {
  cluster_name = "default-ecs-cluster"
  
  # No cluster_settings specified
  
  tags = [
    {
      key   = "Environment"
      value = "Testing"
    }
  ]
}
