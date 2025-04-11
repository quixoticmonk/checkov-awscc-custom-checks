resource "awscc_lambda_permission" "pass" {
  action        = "lambda:InvokeFunction"
  function_name = "example-lambda-function"
  principal     = "events.amazonaws.com"
  source_arn    = "arn:aws:events:us-west-2:123456789012:rule/example-rule"
}

resource "awscc_lambda_permission" "pass2" {
  action        = "lambda:InvokeFunction"
  function_name = "example-lambda-function"
  principal     = "s3.amazonaws.com"
  source_account = "123456789012"
}

resource "awscc_lambda_permission" "fail" {
  action        = "lambda:InvokeFunction"
  function_name = "example-lambda-function"
  principal     = "*"  # Public access - anyone can invoke the function
}

resource "awscc_lambda_permission" "fail2" {
  action        = "lambda:InvokeFunction"
  function_name = "example-lambda-function"
  principal     = "*"
  source_arn    = "arn:aws:s3:::example-bucket/*"  # Still public despite source_arn
}
