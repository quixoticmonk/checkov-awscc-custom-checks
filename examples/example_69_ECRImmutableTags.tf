resource "awscc_ecr_repository" "pass" {
  repository_name = "secure-ecr-repo"
  image_tag_mutability = "IMMUTABLE"
  
  tags = [
    {
      key   = "Environment"
      value = "Production"
    }
  ]
}

resource "awscc_ecr_repository" "fail" {
  repository_name = "insecure-ecr-repo"
  image_tag_mutability = "MUTABLE"
  
  tags = [
    {
      key   = "Environment"
      value = "Development"
    }
  ]
}

resource "awscc_ecr_repository" "fail2" {
  repository_name = "default-ecr-repo"
  # image_tag_mutability defaults to MUTABLE
  
  tags = [
    {
      key   = "Environment"
      value = "Testing"
    }
  ]
}
