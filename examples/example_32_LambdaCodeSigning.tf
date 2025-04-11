resource "awscc_lambda_function" "pass" {
  function_name = "lambda-with-code-signing"
  runtime       = "python3.9"
  role          = "arn:aws:iam::123456789012:role/lambda-role"
  handler       = "index.handler"
  code = {
    s3_bucket = "my-lambda-bucket"
    s3_key    = "function.zip"
  }
  
  # Code signing configuration is defined
  code_signing_config_arn = "arn:aws:lambda:us-west-2:123456789012:code-signing-config:csc-0123456789abcdef"
}

resource "awscc_lambda_function" "fail" {
  function_name = "lambda-without-code-signing"
  runtime       = "python3.9"
  role          = "arn:aws:iam::123456789012:role/lambda-role"
  handler       = "index.handler"
  code = {
    s3_bucket = "my-lambda-bucket"
    s3_key    = "function.zip"
  }
  
  # No code_signing_config_arn defined
}
