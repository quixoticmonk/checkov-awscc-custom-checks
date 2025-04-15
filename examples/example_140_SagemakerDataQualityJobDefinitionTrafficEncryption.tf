resource "awscc_sagemaker_data_quality_job_definition" "pass" {
  job_definition_name = "example-data-quality-job"
  data_quality_app_specification {
    image_uri = "123456789012.dkr.ecr.us-west-2.amazonaws.com/sagemaker-model-monitor:latest"
  }
  data_quality_job_input {
    endpoint_input {
      endpoint_name = "example-endpoint"
      local_path    = "/opt/ml/processing/input"
    }
  }
  data_quality_job_output_config {
    monitoring_outputs {
      s3_output {
        s3_uri = "s3://example-bucket/output"
      }
    }
  }
  job_resources {
    cluster_config {
      instance_count    = 1
      instance_type     = "ml.m5.large"
      volume_size_in_gb = 20
    }
  }
  role_arn = "arn:aws:iam::123456789012:role/service-role/AmazonSageMaker-ExecutionRole"
  network_config {
    enable_inter_container_traffic_encryption = true
    vpc_config {
      security_group_ids = ["sg-12345678"]
      subnets            = ["subnet-12345678"]
    }
  }
}

resource "awscc_sagemaker_data_quality_job_definition" "fail" {
  job_definition_name = "example-data-quality-job-no-traffic-encryption"
  data_quality_app_specification {
    image_uri = "123456789012.dkr.ecr.us-west-2.amazonaws.com/sagemaker-model-monitor:latest"
  }
  data_quality_job_input {
    endpoint_input {
      endpoint_name = "example-endpoint"
      local_path    = "/opt/ml/processing/input"
    }
  }
  data_quality_job_output_config {
    monitoring_outputs {
      s3_output {
        s3_uri = "s3://example-bucket/output"
      }
    }
  }
  job_resources {
    cluster_config {
      instance_count    = 1
      instance_type     = "ml.m5.large"
      volume_size_in_gb = 20
    }
  }
  role_arn = "arn:aws:iam::123456789012:role/service-role/AmazonSageMaker-ExecutionRole"
  network_config {
    enable_inter_container_traffic_encryption = false
    vpc_config {
      security_group_ids = ["sg-12345678"]
      subnets            = ["subnet-12345678"]
    }
  }
}
