# pass - model encrypted with CMK
resource "awscc_comprehend_document_classifier" "pass" {
  document_classifier_name = "example-classifier"
  data_access_role_arn     = "arn:aws:iam::123456789012:role/ComprehendDataAccessRole"
  language_code            = "en"
  input_data_config        = {
    s3_uri = "s3://example-bucket/training-data/"
  }
  model_kms_key_id = "arn:aws:kms:us-east-1:123456789012:key/abcd1234-a123-456a-a12b-a123b4cd56ef"
}

# fail - no model encryption key specified
resource "awscc_comprehend_document_classifier" "fail" {
  document_classifier_name = "example-classifier-no-encryption"
  data_access_role_arn     = "arn:aws:iam::123456789012:role/ComprehendDataAccessRole"
  language_code            = "en"
  input_data_config        = {
    s3_uri = "s3://example-bucket/training-data/"
  }
}
