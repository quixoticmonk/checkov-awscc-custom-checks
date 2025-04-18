# Checkov Custom Checks for AWS Cloud Control(AWSCC)

This repository contains custom Checkov checks for AWS Cloud Control(AWSCC) resources. These checks help ensure that your infrastructure as code follows security best practices and compliance requirements.

> [!NOTE]  
> 15-20 of the checks were initially written manually and the rest were auto generated using Q chat on a terminal requiring examples to test agains. Do review the GitHub actions summary to view if any of the policy checks have any issues on testing.


## Available Checks

The checks below fall under some of the below categories.

1. Encryption Controls - Covers encryption requirements for various AWS services
2. Logging and Monitoring Controls - Addresses logging, monitoring, and observability requirements
3. Network Security Controls - Focuses on network isolation and public access restrictions
4. Data Protection and Backup Controls - Covers data protection, backup, and recovery requirements
5. Identity and Access Management Controls - Addresses authentication and authorization requirements
6. Container and Compute Security Controls - Focuses on security configurations for compute services

| Check ID | Resource | Description | Security Hub Control |
|----------|----------|-------------|---------------------|
| CKV_AWSCC_0 | provider level | Ensure no hard coded AWS access key and secret key exists in provider |  |
| CKV_AWSCC_01 | awscc_ec2_volume | Ensure EBS volumes are encrypted | [EC2.3](https://docs.aws.amazon.com/securityhub/latest/userguide/ec2-controls.html#ec2-3) |
| CKV_AWSCC_02 | awscc_kms_key | Ensure KMS keys have rotation enabled | [KMS.4](https://docs.aws.amazon.com/securityhub/latest/userguide/kms-controls.html#kms-4) |
| CKV_AWSCC_03 | awscc_s3_bucket | Ensure S3 bucket has versioning enabled | [S3.4](https://docs.aws.amazon.com/securityhub/latest/userguide/s3-controls.html#s3-4) |
| CKV_AWSCC_04 | awscc_sns_topic | Ensure SNS topics are encrypted | [SNS.1](https://docs.aws.amazon.com/securityhub/latest/userguide/sns-controls.html#sns-1) |
| CKV_AWSCC_05 | awscc_sqs_queue | Ensure SQS queues are encrypted | [SQS.1](https://docs.aws.amazon.com/securityhub/latest/userguide/sqs-controls.html#sqs-1) |
| CKV_AWSCC_06 | awscc_elasticache_replication_group | Ensure ElastiCache replication groups are encrypted at rest | [ElastiCache.3](https://docs.aws.amazon.com/securityhub/latest/userguide/elasticache-controls.html#elasticache-3) |
| CKV_AWSCC_07 | awscc_eks_cluster | Ensure EKS clusters have public access disabled | [EKS.2](https://docs.aws.amazon.com/securityhub/latest/userguide/eks-controls.html#eks-2) |
| CKV_AWSCC_08 | awscc_efs_file_system | Ensure EFS file systems are encrypted | [EFS.1](https://docs.aws.amazon.com/securityhub/latest/userguide/efs-controls.html#efs-1) |
| CKV_AWSCC_09 | awscc_ecr_repository | Ensure ECR repositories have image scanning enabled | [ECR.1](https://docs.aws.amazon.com/securityhub/latest/userguide/ecr-controls.html#ecr-1) |
| CKV_AWSCC_10 | awscc_redshift_cluster | Ensure Redshift clusters are encrypted | [Redshift.1](https://docs.aws.amazon.com/securityhub/latest/userguide/redshift-controls.html#redshift-1) |
| CKV_AWSCC_11 | awscc_logs_log_group | Ensure CloudWatch Log Groups have retention periods set | [CloudWatch.16](https://docs.aws.amazon.com/securityhub/latest/userguide/cloudwatch-controls.html#cloudwatch-16) |
| CKV_AWSCC_12 | awscc_cloudtrail_trail | Ensure CloudTrail trails are multi-region | [CloudTrail.1](https://docs.aws.amazon.com/securityhub/latest/userguide/cloudtrail-controls.html#cloudtrail-1) |
| CKV_AWSCC_13 | awscc_apigateway_stage | Ensure API Gateway has X-Ray tracing enabled | [APIGateway.8](https://docs.aws.amazon.com/securityhub/latest/userguide/apigateway-controls.html#apigateway-8) |
| CKV_AWSCC_14 | awscc_apigateway_stage | Ensure API Gateway has access logging enabled | [APIGateway.9](https://docs.aws.amazon.com/securityhub/latest/userguide/apigateway-controls.html#apigateway-9) |
| CKV_AWSCC_15 | awscc_cloudtrail_trail | Ensure CloudTrail log validation is enabled | [CloudTrail.4](https://docs.aws.amazon.com/securityhub/latest/userguide/cloudtrail-controls.html#cloudtrail-4) |
| CKV_AWSCC_16 | awscc_ec2_subnet | Ensure subnets do not automatically assign public IP addresses | [EC2.15](https://docs.aws.amazon.com/securityhub/latest/userguide/ec2-controls.html#ec2-15) |
| CKV_AWSCC_17 | awscc_rds_db_instance | Ensure RDS instances have backups enabled | [RDS.11](https://docs.aws.amazon.com/securityhub/latest/userguide/rds-controls.html#rds-11) |
| CKV_AWSCC_18 | awscc_ecr_repository | Ensure ECR repositories are encrypted | [ECR.2](https://docs.aws.amazon.com/securityhub/latest/userguide/ecr-controls.html#ecr-2) |
| CKV_AWSCC_19 | awscc_rds_db_cluster | Ensure RDS clusters are encrypted | [RDS.3](https://docs.aws.amazon.com/securityhub/latest/userguide/rds-controls.html#rds-3) |
| CKV_AWSCC_20 | awscc_secretsmanager_secret | Ensure Secrets Manager secrets are encrypted | [SecretsManager.2](https://docs.aws.amazon.com/securityhub/latest/userguide/secretsmanager-controls.html#secretsmanager-2) |
| CKV_AWSCC_21 | awscc_logs_log_group | Ensure CloudWatch Log Groups are encrypted with KMS | [CloudWatch.3](https://docs.aws.amazon.com/securityhub/latest/userguide/cloudwatch-controls.html#cloudwatch-3) |
| CKV_AWSCC_22 | awscc_rds_db_instance | Ensure RDS instances have deletion protection enabled | [RDS.6](https://docs.aws.amazon.com/securityhub/latest/userguide/rds-controls.html#rds-6) |
| CKV_AWSCC_23 | awscc_backup_backup_vault | Ensure Backup Vaults are encrypted | [Backup.1](https://docs.aws.amazon.com/securityhub/latest/userguide/backup-controls.html#backup-1) |
| CKV_AWSCC_24 | awscc_lambda_environment_encryption | Ensure Lambda environment variables are encrypted | [Lambda.3](https://docs.aws.amazon.com/securityhub/latest/userguide/lambda-controls.html#lambda-3) |
| CKV_AWSCC_25 | awscc_lambda_function | Ensure Lambda functions have X-Ray tracing enabled | [Lambda.5](https://docs.aws.amazon.com/securityhub/latest/userguide/lambda-controls.html#lambda-5) |
| CKV_AWSCC_26 | awscc_lambda_function | Ensure Lambda functions have DLQ configured | [Lambda.2](https://docs.aws.amazon.com/securityhub/latest/userguide/lambda-controls.html#lambda-2) |
| CKV_AWSCC_27 | awscc_guardduty_detector | Ensure GuardDuty detector is enabled | [GuardDuty.1](https://docs.aws.amazon.com/securityhub/latest/userguide/guardduty-controls.html#guardduty-1) |
| CKV_AWSCC_28 | awscc_kms_key | Ensure KMS keys are enabled | [KMS.3](https://docs.aws.amazon.com/securityhub/latest/userguide/kms-controls.html#kms-3) |
| CKV_AWSCC_29 | awscc_s3_bucket | Ensure S3 buckets block public ACLs | [S3.1](https://docs.aws.amazon.com/securityhub/latest/userguide/s3-controls.html#s3-1) |
| CKV_AWSCC_30 | awscc_bedrock_agent | Ensure Bedrock agents are encrypted |  |
| CKV_AWSCC_31 | awscc_bedrock_agent | Ensure Bedrock agents have guardrails enabled |  |
| CKV_AWSCC_32 | awscc_lambda_function | Ensure AWS Lambda function is configured to validate code-signing | [Lambda.4](https://docs.aws.amazon.com/securityhub/latest/userguide/lambda-controls.html#lambda-4) |
| CKV_AWSCC_33 | awscc_lambda_function | Ensure Lambda Runtime is not deprecated | [Lambda.1](https://docs.aws.amazon.com/securityhub/latest/userguide/lambda-controls.html#lambda-1) |
| CKV_AWSCC_34 | awscc_opensearch_domain | Ensure Elasticsearch Domain Logging is enabled | [ES.2](https://docs.aws.amazon.com/securityhub/latest/userguide/elasticsearch-controls.html#es-2) |
| CKV_AWSCC_35 | awscc_lambda_permission | Ensure that AWS Lambda function is not publicly accessible | [Lambda.6](https://docs.aws.amazon.com/securityhub/latest/userguide/lambda-controls.html#lambda-6) |
| CKV_AWSCC_36 | awscc_eks_cluster | Ensure EKS clusters run on a supported Kubernetes version | [EKS.1](https://docs.aws.amazon.com/securityhub/latest/userguide/eks-controls.html#eks-1) |
| CKV_AWSCC_37 | awscc_redshift_cluster | Ensure Redshift clusters have automatic snapshots enabled | [Redshift.4](https://docs.aws.amazon.com/securityhub/latest/userguide/redshift-controls.html#redshift-4) |
| CKV_AWSCC_38 | awscc_redshift_cluster | Ensure that Redshift cluster is encrypted by KMS | [Redshift.7](https://docs.aws.amazon.com/securityhub/latest/userguide/redshift-controls.html#redshift-7) |
| CKV_AWSCC_39 | awscc_redshift_cluster | Ensure that Redshift cluster allowing version upgrade by default | [Redshift.6](https://docs.aws.amazon.com/securityhub/latest/userguide/redshift-controls.html#redshift-6) |
| CKV_AWSCC_40 | awscc_redshift_cluster | Ensure Redshift clusters do not use the default database name | [Redshift.8](https://docs.aws.amazon.com/securityhub/latest/userguide/redshift-controls.html#redshift-8) |
| CKV_AWSCC_41 | awscc_redshift_cluster | Ensure Redshift clusters use enhanced VPC routing | [Redshift.3](https://docs.aws.amazon.com/securityhub/latest/userguide/redshift-controls.html#redshift-3) |
| CKV_AWSCC_42 | awscc_redshift_cluster | Ensure Redshift is not deployed outside of a VPC | [Redshift.2](https://docs.aws.amazon.com/securityhub/latest/userguide/redshift-controls.html#redshift-2) |
| CKV_AWSCC_43 | awscc_redshiftserverless_namespace | Ensure that Redshift Serverless namespace is encrypted by KMS using a customer managed key (CMK) |  |
| CKV_AWSCC_44 | awscc_redshift_cluster | Redshift cluster should not be publicly accessible | [Redshift.5](https://docs.aws.amazon.com/securityhub/latest/userguide/redshift-controls.html#redshift-5) |
| CKV_AWSCC_45 | awscc_neptune_db_cluster | Ensure that Neptune DB cluster has automated backups enabled with adequate retention |  |
| CKV_AWSCC_46 | awscc_neptune_db_cluster | Ensure Neptune is encrypted by KMS using a customer managed Key (CMK) |  |
| CKV_AWSCC_47 | awscc_neptune_db_instance | Ensure Neptune Cluster instance is not publicly available |  |
| CKV_AWSCC_48 | awscc_neptune_db_cluster | Ensure Neptune logging is enabled |  |
| CKV_AWSCC_49 | awscc_neptune_db_cluster | Ensure Neptune storage is securely encrypted |  |
| CKV_AWSCC_50 | awscc_neptune_db_cluster | Neptune DB clusters should be configured to copy tags to snapshots |  |
| CKV_AWSCC_51 | awscc_neptune_db_cluster | Neptune DB clusters should have IAM database authentication enabled |  |
| CKV_AWSCC_52 | awscc_msk_cluster | Ensure MSK Cluster encryption in rest and transit is enabled | [Kafka.1](https://docs.aws.amazon.com/securityhub/latest/userguide/msk-controls.html#kafka-1) |
| CKV_AWSCC_53 | awscc_msk_cluster | Ensure MSK Cluster logging is enabled | [Kafka.2](https://docs.aws.amazon.com/securityhub/latest/userguide/msk-controls.html#kafka-2) |
| CKV_AWSCC_54 | awscc_msk_cluster | Ensure MSK nodes are private |  |
| CKV_AWSCC_55 | awscc_mwaa_environment | Ensure MWAA environment has scheduler logs enabled |  |
| CKV_AWSCC_56 | awscc_mwaa_environment | Ensure MWAA environment has webserver logs enabled |  |
| CKV_AWSCC_57 | awscc_mwaa_environment | Ensure MWAA environment has worker logs enabled |  |
| CKV_AWSCC_58 | awscc_memorydb_cluster | Ensure MemoryDB data is encrypted in transit |  |
| CKV_AWSCC_59 | awscc_memorydb_cluster | Ensure MemoryDB is encrypted at rest using KMS CMKs |  |
| CKV_AWSCC_60 | awscc_kinesis_stream | Ensure Kinesis Stream is encrypted by KMS using a customer managed Key (CMK) | [Kinesis.1](https://docs.aws.amazon.com/securityhub/latest/userguide/kinesis-controls.html#kinesis-1) |
| CKV_AWSCC_61 | awscc_kinesis_stream | Ensure Kinesis Stream is securely encrypted | [Kinesis.1](https://docs.aws.amazon.com/securityhub/latest/userguide/kinesis-controls.html#kinesis-1) |
| CKV_AWSCC_62 | awscc_kinesis_video_stream | Ensure Kinesis Video Stream is encrypted by KMS using a customer managed Key (CMK) |  |
| CKV_AWSCC_63 | awscc_kinesisfirehose_delivery_stream | Ensure that Kinesis Firehose Delivery Streams are encrypted with CMK |  |
| CKV_AWSCC_64 | awscc_kinesisfirehose_delivery_stream | Ensure Kinesis Firehose delivery stream is encrypted |  |
| CKV_AWSCC_65 | awscc_efs_file_system | Ensure EFS file system is encrypted by KMS using a customer managed Key (CMK) | [EFS.2](https://docs.aws.amazon.com/securityhub/latest/userguide/efs-controls.html#efs-2) |
| CKV_AWSCC_66 | awscc_efs_access_point | EFS access points should enforce a root directory | [EFS.3](https://docs.aws.amazon.com/securityhub/latest/userguide/efs-controls.html#efs-3) |
| CKV_AWSCC_67 | awscc_efs_access_point | EFS access points should enforce a user identity | [EFS.4](https://docs.aws.amazon.com/securityhub/latest/userguide/efs-controls.html#efs-4) |
| CKV_AWSCC_68 | awscc_eks_cluster | Ensure Amazon EKS control plane logging is enabled for all log types | [EKS.3](https://docs.aws.amazon.com/securityhub/latest/userguide/eks-controls.html#eks-3) |
| CKV_AWSCC_69 | awscc_ecr_repository | Ensure ECR Image Tags are immutable | [ECR.3](https://docs.aws.amazon.com/securityhub/latest/userguide/ecr-controls.html#ecr-3) |
| CKV_AWSCC_72 | awscc_ecs_cluster | Ensure container insights are enabled on ECS cluster | [ECS.1](https://docs.aws.amazon.com/securityhub/latest/userguide/ecs-controls.html#ecs-1) |
| CKV_AWSCC_73 | awscc_ecs_cluster | Ensure ECS Cluster enables logging of ECS Exec | [ECS.2](https://docs.aws.amazon.com/securityhub/latest/userguide/ecs-controls.html#ecs-2) |
| CKV_AWSCC_74 | awscc_ecs_cluster | Ensure ECS Cluster logging is enabled and client to container communication uses CMK |  |
| CKV_AWSCC_75 | awscc_ecs_task_definition | Ensure ECS task definitions should not share the host's process namespace | [ECS.10](https://docs.aws.amazon.com/securityhub/latest/userguide/ecs-controls.html#ecs-10) |
| CKV_AWSCC_76 | awscc_ecs_task_definition | Ensure ECS containers should run as non-privileged | [ECS.8](https://docs.aws.amazon.com/securityhub/latest/userguide/ecs-controls.html#ecs-8) |
| CKV_AWSCC_77 | awscc_ecs_task_definition | Ensure ECS containers are limited to read-only access to root filesystems | [ECS.9](https://docs.aws.amazon.com/securityhub/latest/userguide/ecs-controls.html#ecs-9) |
| CKV_AWSCC_78 | awscc_ecs_service | Ensure ECS Fargate services run on the latest Fargate platform version | [ECS.12](https://docs.aws.amazon.com/securityhub/latest/userguide/ecs-controls.html#ecs-12) |
| CKV_AWSCC_79 | awscc_ecs_service | Ensure ECS services do not have public IP addresses assigned to them automatically | [ECS.13](https://docs.aws.amazon.com/securityhub/latest/userguide/ecs-controls.html#ecs-13) |
| CKV_AWSCC_80 | awscc_ecs_task_definition | Ensure Encryption in transit is enabled for EFS volumes in ECS Task definitions | [ECS.4](https://docs.aws.amazon.com/securityhub/latest/userguide/ecs-controls.html#ecs-4) |
| CKV_AWSCC_81 | awscc_ecs_task_definition | Ensure that the Execution Role ARN and the Task Role ARN are different in ECS Task definitions | [ECS.5](https://docs.aws.amazon.com/securityhub/latest/userguide/ecs-controls.html#ecs-5) |
| CKV_AWSCC_82 | awscc_rds_db_instance | Ensure RDS uses a modern CaCert | [RDS.14](https://docs.aws.amazon.com/securityhub/latest/userguide/rds-controls.html#rds-14) |
| CKV_AWSCC_83 | awscc_rds_db_cluster | Ensure that RDS Cluster audit logging is enabled for MySQL engine | [RDS.9](https://docs.aws.amazon.com/securityhub/latest/userguide/rds-controls.html#rds-9) |
| CKV_AWSCC_84 | awscc_rds_db_cluster | Ensure that RDS Aurora Clusters have backtracking enabled |  |
| CKV_AWSCC_85 | awscc_rds_db_cluster | Ensure RDS cluster configured to copy tags to snapshots | [RDS.17](https://docs.aws.amazon.com/securityhub/latest/userguide/rds-controls.html#rds-17) |
| CKV_AWSCC_86 | awscc_rds_db_cluster | Ensure RDS Clusters are encrypted using KMS CMKs | [RDS.3](https://docs.aws.amazon.com/securityhub/latest/userguide/rds-controls.html#rds-3) |
| CKV_AWSCC_87 | awscc_rds_db_cluster | Ensure RDS cluster has IAM authentication enabled | [RDS.16](https://docs.aws.amazon.com/securityhub/latest/userguide/rds-controls.html#rds-16) |
| CKV_AWSCC_88 | awscc_rds_db_cluster | Ensure that RDS Cluster log capture is enabled | [RDS.8](https://docs.aws.amazon.com/securityhub/latest/userguide/rds-controls.html#rds-8) |
| CKV_AWSCC_89 | awscc_rds_db_instance | Ensure all data stored in the RDS is securely encrypted at rest | [RDS.3](https://docs.aws.amazon.com/securityhub/latest/userguide/rds-controls.html#rds-3) |
| CKV_AWSCC_90 | awscc_rds_db_instance | Ensure that enhanced monitoring is enabled for Amazon RDS instances | [RDS.5](https://docs.aws.amazon.com/securityhub/latest/userguide/rds-controls.html#rds-5) |
| CKV_AWSCC_91 | awscc_rds_db_instance | Ensure RDS database has IAM authentication enabled | [RDS.16](https://docs.aws.amazon.com/securityhub/latest/userguide/rds-controls.html#rds-16) |
| CKV_AWSCC_92 | awscc_rds_db_instance | Ensure that AWS database instances have deletion protection enabled | [RDS.6](https://docs.aws.amazon.com/securityhub/latest/userguide/rds-controls.html#rds-6) |
| CKV_AWSCC_93 | awscc_rds_db_instance | Ensure RDS Performance Insights are encrypted using KMS CMKs | [RDS.18](https://docs.aws.amazon.com/securityhub/latest/userguide/rds-controls.html#rds-18) |
| CKV_AWSCC_94 | awscc_rds_db_instance | Ensure that RDS instances have performance insights enabled | [RDS.4](https://docs.aws.amazon.com/securityhub/latest/userguide/rds-controls.html#rds-4) |
| CKV_AWSCC_95 | awscc_rds_db_instance | Ensure that RDS instances have Multi-AZ enabled | [RDS.10](https://docs.aws.amazon.com/securityhub/latest/userguide/rds-controls.html#rds-10) |
| CKV_AWSCC_96 | awscc_rds_db_instance | Ensure that RDS PostgreSQL instances use a non vulnerable version with the log_fdw extension | [RDS.13](https://docs.aws.amazon.com/securityhub/latest/userguide/rds-controls.html#rds-13) |
| CKV_AWSCC_97 | awscc_rds_db_instance | Ensure all data stored in RDS is not publicly accessible | [RDS.1](https://docs.aws.amazon.com/securityhub/latest/userguide/rds-controls.html#rds-1) |
| CKV_AWSCC_98 | awscc_stepfunctions_state_machine | Ensure State Machine has X-Ray tracing enabled | [StepFunctions.1](https://docs.aws.amazon.com/securityhub/latest/userguide/stepfunctions-controls.html#stepfunctions-1) |
| CKV_AWSCC_99 | awscc_timestream_database | Ensure that Timestream database is encrypted with KMS CMK |  |
| CKV_AWSCC_100 | awscc_transfer_server | Ensure Transfer Server allows only secure protocols |  |
| CKV_AWSCC_101 | awscc_transfer_server | Ensure Transfer Server is not exposed publicly |  |
| CKV_AWSCC_102 | awscc_transfer_server | Ensure AWS Transfer Server uses latest Security Policy |  |
| CKV_AWSCC_103 | awscc_ec2_vpc_endpoint_service | Ensure that VPC Endpoint Service is configured for Manual Acceptance |  |
| CKV_AWSCC_113 | awscc_autoscaling_auto_scaling_group | Ensure Auto Scaling groups have ELB health check enabled | [AutoScaling.1](https://docs.aws.amazon.com/securityhub/latest/userguide/autoscaling-controls.html#autoscaling-1) |
| CKV_AWSCC_114 | awscc_autoscaling_auto_scaling_group | Ensure Auto Scaling groups use IMDSv2 | [AutoScaling.3](https://docs.aws.amazon.com/securityhub/latest/userguide/autoscaling-controls.html#autoscaling-3) |
| CKV_AWSCC_115 | awscc_autoscaling_auto_scaling_group | Ensure Auto Scaling groups span multiple Availability Zones | [AutoScaling.2](https://docs.aws.amazon.com/securityhub/latest/userguide/autoscaling-controls.html#autoscaling-2) |
| CKV_AWSCC_116 | awscc_autoscaling_auto_scaling_group | Ensure Auto Scaling groups propagate tags to EC2 instances | [AutoScaling.5](https://docs.aws.amazon.com/securityhub/latest/userguide/autoscaling-controls.html#autoscaling-5) |
| CKV_AWSCC_118 | awscc_batch_job_definition | Batch job does not define a privileged container | [Batch.1](https://docs.aws.amazon.com/securityhub/latest/userguide/batch-controls.html#batch-1) |
| CKV_AWSCC_120 | awscc_cloudwatch_alarm | Ensure that CloudWatch alarm actions are enabled | [CloudWatch.1](https://docs.aws.amazon.com/securityhub/latest/userguide/cloudwatch-controls.html#cloudwatch-1) |
| CKV_AWSCC_121 | awscc_logs_log_group | Ensure that CloudWatch Log Group specifies retention days | [CloudWatch.16](https://docs.aws.amazon.com/securityhub/latest/userguide/cloudwatch-controls.html#cloudwatch-16) |
| CKV_AWSCC_122 | awscc_logs_log_group | Ensure CloudWatch log groups retains logs for at least 1 year | [CloudWatch.16](https://docs.aws.amazon.com/securityhub/latest/userguide/cloudwatch-controls.html#cloudwatch-16) |
| CKV_AWSCC_123 | awscc_cloudtrail_trail | Ensure CloudTrail logging is enabled | [CloudTrail.2](https://docs.aws.amazon.com/securityhub/latest/userguide/cloudtrail-controls.html#cloudtrail-2) |
| CKV_AWSCC_124 | awscc_cloudtrail_event_data_store | Ensure CloudTrail Event Data Store uses CMK |  |
| CKV_AWSCC_125 | awscc_codeartifact_domain | Ensure CodeArtifact Domain is encrypted by KMS using a customer managed Key (CMK) |  |
| CKV_AWSCC_126 | awscc_cognito_identity_pool | Ensure AWS Cognito identity pool does not allow unauthenticated guest access | [Cognito.2](https://docs.aws.amazon.com/securityhub/latest/userguide/cognito-controls.html#cognito-2) |
| CKV_AWSCC_127 | awscc_comprehend_document_classifier | Ensure that Comprehend Document Classifier's model is encrypted by KMS using a customer managed Key (CMK) |  |
| CKV_AWSCC_128 | awscc_comprehend_document_classifier | Ensure that Comprehend Document Classifier's volume is encrypted by KMS using a customer managed Key (CMK) |  |
| CKV_AWSCC_129 | awscc_config_configuration_aggregator | Ensure AWS Config is enabled in all regions | [Config.1](https://docs.aws.amazon.com/securityhub/latest/userguide/config-controls.html#config-1) |
| CKV_AWSCC_130 | awscc_connect_instance_storage_config | Ensure Connect Instance Kinesis Video Stream Storage Config uses CMK |  |
| CKV_AWSCC_131 | awscc_connect_instance_storage_config | Ensure Connect Instance S3 Storage Config uses CMK |  |
| CKV_AWSCC_132 | awscc_datasync_location_object_storage | Ensure DataSync Location Object Storage doesn't expose secrets |  |
| CKV_AWSCC_133 | awscc_ec2_instance | Ensure no hard-coded secrets exist in EC2 user data | [EC2.23](https://docs.aws.amazon.com/securityhub/latest/userguide/ec2-controls.html#ec2-23) |
| CKV_AWSCC_134 | awscc_ec2_instance | Ensure that detailed monitoring is enabled for EC2 instances | [EC2.6](https://docs.aws.amazon.com/securityhub/latest/userguide/ec2-controls.html#ec2-6) |
| CKV_AWSCC_135 | awscc_ec2_instance | Ensure that EC2 is EBS optimized | [EC2.8](https://docs.aws.amazon.com/securityhub/latest/userguide/ec2-controls.html#ec2-8) |
| CKV_AWSCC_136 | awscc_ec2_instance | EC2 instance should not have public IP | [EC2.19](https://docs.aws.amazon.com/securityhub/latest/userguide/ec2-controls.html#ec2-19) |
| CKV_AWSCC_137 | awscc_eks_cluster | Ensure EKS Cluster has Secrets Encryption Enabled | [EKS.7](https://docs.aws.amazon.com/securityhub/latest/userguide/eks-controls.html#eks-7) |
| CKV_AWSCC_138 | awscc_sagemaker_data_quality_job_definition | Ensure Amazon Sagemaker Data Quality Job uses KMS to encrypt model artifacts |  |
| CKV_AWSCC_139 | awscc_sagemaker_data_quality_job_definition | Ensure Amazon Sagemaker Data Quality Job uses KMS to encrypt data on attached storage volume |  |
| CKV_AWSCC_140 | awscc_sagemaker_data_quality_job_definition | Ensure Amazon Sagemaker Data Quality Job encrypts all communications between instances used for monitoring jobs |  |
| CKV_AWSCC_141 | awscc_guardduty_detector | Ensure GuardDuty is enabled to specific org/region |  |
| CKV_AWSCC_142 | awscc_ec2_security_group | Ensure security groups have descriptions | [EC2.21](https://docs.aws.amazon.com/securityhub/latest/userguide/ec2-controls.html#ec2-21) |
| CKV_AWSCC_143 | awscc_ec2_security_group_ingress, awscc_ec2_security_group_egress | Ensure security group rules have descriptions | [EC2.21](https://docs.aws.amazon.com/securityhub/latest/userguide/ec2-controls.html#ec2-21) |
| CKV_AWSCC_144 | awscc_ec2_security_group_ingress | Ensure no security groups allow ingress from 0.0.0.0/0 or ::/0 to port 22 | [EC2.13](https://docs.aws.amazon.com/securityhub/latest/userguide/ec2-controls.html#ec2-13) |
| CKV_AWSCC_145 | awscc_ec2_security_group_ingress | Ensure no security groups allow ingress from 0.0.0.0/0 or ::/0 to port 3389 | [EC2.14](https://docs.aws.amazon.com/securityhub/latest/userguide/ec2-controls.html#ec2-14) |
| CKV_AWSCC_146 | awscc_iam_role_policy, awscc_iam_group_policy, awscc_iam_user_policy | Ensure IAM policies do not allow admin privileges | [IAM.1](https://docs.aws.amazon.com/securityhub/latest/userguide/iam-controls.html#iam-1) |
| CKV_AWSCC_147 | awscc_iam_role_policy, awscc_iam_group_policy, awscc_iam_user_policy | Ensure IAM policies do not allow full '*' administrative privileges | [IAM.1](https://docs.aws.amazon.com/securityhub/latest/userguide/iam-controls.html#iam-1) |



## Usage

To run these custom checks against your Terraform code:

```bash
checkov -d /path/to/terraform/code --external-checks-dir /path/to/custom_checks
```

## Examples

Each check has an example directory with passing and failing test cases. You can find these in the `examples` directory.

## GitHub Actions Workflow

This repository includes a GitHub Actions workflow that runs Checkov against the example files using the custom checks. The workflow is configured to ignore failures for test cases that are expected to fail.
