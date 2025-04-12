resource "awscc_athena_work_group" "pass" {
  name = "secure-workgroup"
  
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

resource "awscc_athena_work_group" "fail" {
  name = "insecure-workgroup"
  
  configuration = {
    enforce_workgroup_configuration = false
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
      value = "Development"
    }
  ]
}

resource "awscc_athena_work_group" "fail2" {
  name = "insecure-workgroup-default"
  
  configuration = {
    # enforce_workgroup_configuration not specified (defaults to false)
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
      value = "Development"
    }
  ]
}
