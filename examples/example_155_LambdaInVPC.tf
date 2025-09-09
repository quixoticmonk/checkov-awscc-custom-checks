resource "awscc_lambda_function" "pass_155" {
  function_name = "example-vpc-lambda-155"
  runtime       = "python3.9"
  handler       = "index.handler"
  role          = "arn:aws:iam::123456789012:role/lambda-execution-role"

  code = {
    zip_file = "def handler(event, context): return 'Hello from VPC Lambda'"
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

resource "awscc_lambda_function" "fail_155" {
  function_name = "example-no-vpc-lambda-155"
  runtime       = "python3.9"
  handler       = "index.handler"
  role          = "arn:aws:iam::123456789012:role/lambda-execution-role"

  code = {
    zip_file = "def handler(event, context): return 'Hello from Lambda'"
  }
}

resource "awscc_lambda_function" "fail2_155" {
  function_name = "example-incomplete-vpc-lambda-155"
  runtime       = "python3.9"
  handler       = "index.handler"
  role          = "arn:aws:iam::123456789012:role/lambda-execution-role"

  code = {
    zip_file = "def handler(event, context): return 'Hello from Lambda'"
  }

  vpc_config = {
    subnet_ids = [
      "subnet-12345678"
    ]
  }
}
