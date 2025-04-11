resource "awscc_lambda_function" "pass" {
  function_name = "lambda-with-current-runtime"
  runtime       = "python3.12"  # Current supported runtime
  role          = "arn:aws:iam::123456789012:role/lambda-role"
  handler       = "index.handler"
  code = {
    s3_bucket = "my-lambda-bucket"
    s3_key    = "function.zip"
  }
}

resource "awscc_lambda_function" "pass2" {
  function_name = "lambda-with-current-runtime-nodejs"
  runtime       = "nodejs20.x"  # Current supported runtime
  role          = "arn:aws:iam::123456789012:role/lambda-role"
  handler       = "index.handler"
  code = {
    s3_bucket = "my-lambda-bucket"
    s3_key    = "function.zip"
  }
}

resource "awscc_lambda_function" "fail" {
  function_name = "lambda-with-deprecated-runtime"
  runtime       = "nodejs16.x"  # Deprecated runtime
  role          = "arn:aws:iam::123456789012:role/lambda-role"
  handler       = "index.handler"
  code = {
    s3_bucket = "my-lambda-bucket"
    s3_key    = "function.zip"
  }
}

resource "awscc_lambda_function" "fail2" {
  function_name = "lambda-with-deprecated-runtime-python"
  runtime       = "python3.8"  # Deprecated runtime
  role          = "arn:aws:iam::123456789012:role/lambda-role"
  handler       = "index.handler"
  code = {
    s3_bucket = "my-lambda-bucket"
    s3_key    = "function.zip"
  }
}
