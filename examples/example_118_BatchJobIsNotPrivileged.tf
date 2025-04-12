# pass

resource "awscc_batch_job_definition" "pass" {
  job_definition_name = "example-batch-job"
  type                = "container"
  
  container_properties = {
    image       = "amazonlinux:latest"
    vcpus       = 1
    memory      = 1024
    command     = ["echo", "Hello, World!"]
    privileged  = false
    environment = [
      {
        name  = "ENVIRONMENT"
        value = "production"
      }
    ]
  }
}

resource "awscc_batch_job_definition" "pass2" {
  job_definition_name = "example-batch-job-no-privileged"
  type                = "container"
  
  container_properties = {
    image       = "amazonlinux:latest"
    vcpus       = 1
    memory      = 1024
    command     = ["echo", "Hello, World!"]
    # privileged not specified, defaults to false
    environment = [
      {
        name  = "ENVIRONMENT"
        value = "production"
      }
    ]
  }
}

# fail

resource "awscc_batch_job_definition" "fail" {
  job_definition_name = "example-batch-job-privileged"
  type                = "container"
  
  container_properties = {
    image       = "amazonlinux:latest"
    vcpus       = 1
    memory      = 1024
    command     = ["echo", "Hello, World!"]
    privileged  = true
    environment = [
      {
        name  = "ENVIRONMENT"
        value = "production"
      }
    ]
  }
}

# Using JSON string for container properties
resource "awscc_batch_job_definition" "unknown" {
  job_definition_name = "example-batch-job-json"
  type                = "container"
  
  container_properties = jsonencode({
    image       = "amazonlinux:latest"
    vcpus       = 1
    memory      = 1024
    command     = ["echo", "Hello, World!"]
    privileged  = true
    environment = [
      {
        name  = "ENVIRONMENT"
        value = "production"
      }
    ]
  })
}
