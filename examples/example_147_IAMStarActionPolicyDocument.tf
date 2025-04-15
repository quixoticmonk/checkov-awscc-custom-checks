# PASS: IAM role policy with specific actions
resource "awscc_iam_role_policy" "pass_role_policy" {
  role_name = "example-role"
  policy_name = "specific-actions"
  policy_document = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:GetObject",
          "s3:ListBucket"
        ]
        Resource = [
          "arn:aws:s3:::example-bucket",
          "arn:aws:s3:::example-bucket/*"
        ]
      }
    ]
  })
}

# FAIL: IAM role policy with wildcard action
resource "awscc_iam_role_policy" "fail_role_policy_star" {
  role_name = "example-role-wildcard"
  policy_name = "wildcard-actions"
  policy_document = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = "*"
        Resource = "arn:aws:s3:::example-bucket/*"
      }
    ]
  })
}

# FAIL: IAM role policy with service-specific wildcard action
resource "awscc_iam_role_policy" "fail_role_policy_service_star" {
  role_name = "example-role-service-wildcard"
  policy_name = "service-wildcard-actions"
  policy_document = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = "s3:*"
        Resource = "arn:aws:s3:::example-bucket/*"
      }
    ]
  })
}

# PASS: IAM group policy with specific actions
resource "awscc_iam_group_policy" "pass_group_policy" {
  group_name = "example-group"
  policy_name = "specific-actions"
  policy_document = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "ec2:DescribeInstances",
          "ec2:StartInstances",
          "ec2:StopInstances"
        ]
        Resource = "arn:aws:ec2:*:*:instance/*"
      }
    ]
  })
}

# FAIL: IAM group policy with wildcard action
resource "awscc_iam_group_policy" "fail_group_policy_star" {
  group_name = "example-group-wildcard"
  policy_name = "wildcard-actions"
  policy_document = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = "*"
        Resource = "arn:aws:ec2:*:*:instance/*"
      }
    ]
  })
}

# FAIL: IAM group policy with service-specific wildcard action
resource "awscc_iam_group_policy" "fail_group_policy_service_star" {
  group_name = "example-group-service-wildcard"
  policy_name = "service-wildcard-actions"
  policy_document = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = "ec2:*"
        Resource = "arn:aws:ec2:*:*:instance/*"
      }
    ]
  })
}

# PASS: IAM user policy with specific actions
resource "awscc_iam_user_policy" "pass_user_policy" {
  user_name = "example-user"
  policy_name = "specific-actions"
  policy_document = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "dynamodb:GetItem",
          "dynamodb:PutItem"
        ]
        Resource = "arn:aws:dynamodb:*:*:table/example-table"
      }
    ]
  })
}

# FAIL: IAM user policy with wildcard action
resource "awscc_iam_user_policy" "fail_user_policy_star" {
  user_name = "example-user-wildcard"
  policy_name = "wildcard-actions"
  policy_document = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = "*"
        Resource = "arn:aws:dynamodb:*:*:table/example-table"
      }
    ]
  })
}

# FAIL: IAM user policy with service-specific wildcard action
resource "awscc_iam_user_policy" "fail_user_policy_service_star" {
  user_name = "example-user-service-wildcard"
  policy_name = "service-wildcard-actions"
  policy_document = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = "dynamodb:*"
        Resource = "arn:aws:dynamodb:*:*:table/example-table"
      }
    ]
  })
}
