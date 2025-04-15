# PASS: IAM role policy with specific permissions
resource "awscc_iam_role_policy" "pass_role_policy" {
  role_name = "example-role"
  policy_name = "specific-permissions"
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

# FAIL: IAM role policy with admin permissions
resource "awscc_iam_role_policy" "fail_role_policy" {
  role_name = "example-admin-role"
  policy_name = "admin-permissions"
  policy_document = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = "*"
        Resource = "*"
      }
    ]
  })
}

# PASS: IAM group policy with specific permissions
resource "awscc_iam_group_policy" "pass_group_policy" {
  group_name = "example-group"
  policy_name = "specific-permissions"
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

# FAIL: IAM group policy with admin permissions
resource "awscc_iam_group_policy" "fail_group_policy" {
  group_name = "example-admin-group"
  policy_name = "admin-permissions"
  policy_document = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = "*:*"
        Resource = "*"
      }
    ]
  })
}

# PASS: IAM user policy with specific permissions
resource "awscc_iam_user_policy" "pass_user_policy" {
  user_name = "example-user"
  policy_name = "specific-permissions"
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

# FAIL: IAM user policy with admin permissions
resource "awscc_iam_user_policy" "fail_user_policy" {
  user_name = "example-admin-user"
  policy_name = "admin-permissions"
  policy_document = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = "*"
        Resource = "*"
      }
    ]
  })
}
