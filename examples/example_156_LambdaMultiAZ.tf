resource "awscc_lambda_function" "pass_156" {
  function_name = "example-multi-az-lambda-156"
  runtime       = "python3.9"
  handler       = "index.handler"
  role          = "arn:aws:iam::123456789012:role/lambda-execution-role"

  code = {
    zip_file = "def handler(event, context): return 'Hello from Multi-AZ Lambda'"
  }

  vpc_config = {
    subnet_ids = [
      "subnet-12345678",
      "subnet-87654321"
    ]
    security_group_ids = [
      "sg-12345678"
    ]
  }
}

resource "awscc_lambda_function" "pass2_156" {
  function_name = "example-no-vpc-lambda-156"
  runtime       = "python3.9"
  handler       = "index.handler"
  role          = "arn:aws:iam::123456789012:role/lambda-execution-role"

  code = {
    zip_file = "def handler(event, context): return 'Hello from Lambda'"
  }
}

resource "awscc_lambda_function" "fail_156" {
  function_name = "example-single-az-lambda-156"
  runtime       = "python3.9"
  handler       = "index.handler"
  role          = "arn:aws:iam::123456789012:role/lambda-execution-role"

  code = {
    zip_file = "def handler(event, context): return 'Hello from Single-AZ Lambda'"
  }

  vpc_config = {
    subnet_ids = [
      "subnet-12345678"
    ]
    security_group_ids = [
      "sg-12345678"
    ]
  }
}
