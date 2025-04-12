resource "awscc_kinesisvideo_stream" "pass" {
  name = "example-kinesis-video-stream"
  data_retention_in_hours = 24
  
  kms_key_id = "arn:aws:kms:us-west-2:123456789012:key/abcd1234-a123-456a-a12b-a123b4cd56ef"
  
  tags = {
    Environment = "Production"
    Owner = "Data Team"
  }
}

resource "awscc_kinesisvideo_stream" "fail_no_cmk" {
  name = "example-kinesis-video-stream"
  data_retention_in_hours = 24
  
  # No kms_key_id specified, will use AWS managed key
  
  tags = {
    Environment = "Development"
    Owner = "Data Team"
  }
}
