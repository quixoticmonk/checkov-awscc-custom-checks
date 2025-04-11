# Checkov Custom Checks for AWS Cloud Control API (AWSCC)

This repository contains custom Checkov checks for AWS Cloud Control API (AWSCC) resources. These checks help ensure that your infrastructure as code follows security best practices and compliance requirements.

## Available Checks

| Check ID | Resource | Description |
|----------|----------|-------------|
| CKV_AWSCC_01 | awscc_ec2_volume | Ensure EBS volumes are encrypted |
| CKV_AWSCC_02 | awscc_kms_key | Ensure KMS keys have rotation enabled |
| CKV_AWSCC_03 | awscc_s3_bucket | Ensure S3 bucket has versioning enabled |
| CKV_AWSCC_04 | awscc_sns_topic | Ensure SNS topics are encrypted |
| CKV_AWSCC_05 | awscc_sqs_queue | Ensure SQS queues are encrypted |
| CKV_AWSCC_06 | awscc_elasticache_replication_group | Ensure ElastiCache replication groups are encrypted at rest |
| CKV_AWSCC_07 | awscc_eks_cluster | Ensure EKS clusters have public access disabled |
| CKV_AWSCC_08 | awscc_efs_file_system | Ensure EFS file systems are encrypted |
| CKV_AWSCC_09 | awscc_ecr_repository | Ensure ECR repositories have image scanning enabled |
| CKV_AWSCC_10 | awscc_redshift_cluster | Ensure Redshift clusters are encrypted |
| CKV_AWSCC_11 | awscc_logs_log_group | Ensure CloudWatch Log Groups have retention periods set |
| CKV_AWSCC_12 | awscc_cloudtrail_trail | Ensure CloudTrail trails are multi-region |
| CKV_AWSCC_13 | awscc_apigateway_stage | Ensure API Gateway has X-Ray tracing enabled |
| CKV_AWSCC_14 | awscc_apigateway_stage | Ensure API Gateway has access logging enabled |
| CKV_AWSCC_15 | awscc_cloudtrail_trail | Ensure CloudTrail log validation is enabled |
| CKV_AWSCC_16 | awscc_ec2_subnet | Ensure subnets do not automatically assign public IP addresses |
| CKV_AWSCC_17 | awscc_rds_db_instance | Ensure RDS instances have backups enabled |
| CKV_AWSCC_18 | awscc_ecr_repository | Ensure ECR repositories are encrypted |
| CKV_AWSCC_19 | awscc_rds_db_cluster | Ensure RDS clusters are encrypted |
| CKV_AWSCC_20 | awscc_secretsmanager_secret | Ensure Secrets Manager secrets are encrypted |
| CKV_AWSCC_21 | awscc_logs_log_group | Ensure CloudWatch Log Groups are encrypted with KMS |
| CKV_AWSCC_22 | awscc_rds_db_instance | Ensure RDS instances have deletion protection enabled |
| CKV_AWSCC_23 | awscc_backup_backup_vault | Ensure Backup Vaults are encrypted |
| CKV_AWSCC_24 | awscc_lambda_environment_encryption | Ensure Lambda environment variables are encrypted |
| CKV_AWSCC_25 | awscc_lambda_function | Ensure Lambda functions have X-Ray tracing enabled |
| CKV_AWSCC_26 | awscc_lambda_function | Ensure Lambda functions have DLQ configured |
| CKV_AWSCC_27 | awscc_guardduty_detector | Ensure GuardDuty detector is enabled |
| CKV_AWSCC_28 | awscc_kms_key | Ensure KMS keys are enabled |
| CKV_AWSCC_29 | awscc_s3_bucket | Ensure S3 buckets block public ACLs |
| CKV_AWSCC_30 | awscc_bedrock_agent | Ensure Bedrock agents are encrypted |
| CKV_AWSCC_31 | awscc_bedrock_agent | Ensure Bedrock agents have guardrails enabled |

## Usage

To run these custom checks against your Terraform code:

```bash
checkov -d /path/to/terraform/code --external-checks-dir /path/to/custom_checks
```

## Examples

Each check has an example directory with passing and failing test cases. You can find these in the `examples` directory.

## GitHub Actions Workflow

This repository includes a GitHub Actions workflow that runs Checkov against the example files using the custom checks. The workflow is configured to ignore failures for test cases that are expected to fail.
