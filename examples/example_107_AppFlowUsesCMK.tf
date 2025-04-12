resource "awscc_appflow_flow" "pass" {
  flow_name    = "secure-flow"
  source_flow_config = {
    connector_type = "S3"
    source_connector_properties = {
      s3 = {
        bucket_name = "source-bucket"
        bucket_prefix = "data/"
      }
    }
  }
  destination_flow_config_list = [
    {
      connector_type = "S3"
      destination_connector_properties = {
        s3 = {
          bucket_name = "destination-bucket"
          bucket_prefix = "processed/"
        }
      }
    }
  ]
  tasks = [
    {
      source_fields = ["field1", "field2"]
      task_type = "Filter"
      connector_operator = {
        s3 = "PROJECTION"
      }
    }
  ]
  trigger_config = {
    trigger_type = "OnDemand"
  }
  
  kms_arn = "arn:aws:kms:us-west-2:123456789012:key/abcd1234-a123-456a-a12b-a123b4cd56ef"
  
  tags = [
    {
      key   = "Environment"
      value = "Production"
    }
  ]
}

resource "awscc_appflow_flow" "fail" {
  flow_name    = "insecure-flow"
  source_flow_config = {
    connector_type = "S3"
    source_connector_properties = {
      s3 = {
        bucket_name = "source-bucket"
        bucket_prefix = "data/"
      }
    }
  }
  destination_flow_config_list = [
    {
      connector_type = "S3"
      destination_connector_properties = {
        s3 = {
          bucket_name = "destination-bucket"
          bucket_prefix = "processed/"
        }
      }
    }
  ]
  tasks = [
    {
      source_fields = ["field1", "field2"]
      task_type = "Filter"
      connector_operator = {
        s3 = "PROJECTION"
      }
    }
  ]
  trigger_config = {
    trigger_type = "OnDemand"
  }
  
  # No KMS key specified (uses default AWS managed key)
  
  tags = [
    {
      key   = "Environment"
      value = "Development"
    }
  ]
}
