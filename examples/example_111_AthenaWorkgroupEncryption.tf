resource "awscc_athena_work_group" "pass_kms" {
  name = "secure-workgroup-kms"
  
  configuration = {
    enforce_workgroup_configuration = true
    result_configuration = {
      encryption_configuration = {
        encryption_option = "SSE_KMS"
        kms_key           = "arn:aws:kms:us-west-2:123456789012:key/abcd1234-a123-456a-a12b-a123b4cd56ef"
      }
    }
  }
  
  tags = [
    {
      key   = "Environment"
      value = "Production"
    }
  ]
}

resource "awscc_athena_work_group" "pass_s3" {
  name = "secure-workgroup-s3"
  
  configuration = {
    enforce_workgroup_configuration = true
    result_configuration = {
      encryption_configuration = {
        encryption_option = "SSE_S3"
      }
    }
  }
  
  tags = [
    {
      key   = "Environment"
      value = "Production"
    }
  ]
}

resource "awscc_athena_work_group" "fail_no_encryption" {
  name = "insecure-workgroup-no-encryption"
  
  configuration = {
    enforce_workgroup_configuration = true
    result_configuration = {
      # No encryption_configuration specified
    }
  }
  
  tags = [
    {
      key   = "Environment"
      value = "Development"
    }
  ]
}

resource "awscc_athena_work_group" "fail_no_result_config" {
  name = "insecure-workgroup-no-result-config"
  
  configuration = {
    enforce_workgroup_configuration = true
    # No result_configuration specified
  }
  
  tags = [
    {
      key   = "Environment"
      value = "Development"
    }
  ]
}

resource "awscc_athena_work_group" "fail_no_config" {
  name = "insecure-workgroup-no-config"
  
  # No configuration specified
  
  tags = [
    {
      key   = "Environment"
      value = "Development"
    }
  ]
}
