# pass - secrets encryption enabled with KMS key
resource "awscc_eks_cluster" "pass" {
  name     = "example-cluster"
  role_arn = "arn:aws:iam::123456789012:role/eks-cluster-role"
  vpc_config = {
    subnet_ids = ["subnet-0123456789abcdef0", "subnet-0123456789abcdef1"]
  }
  encryption_config = [
    {
      resources = ["secrets"]
      provider = {
        key_arn = "arn:aws:kms:us-east-1:123456789012:key/abcd1234-a123-456a-a12b-a123b4cd56ef"
      }
    }
  ]
}

# fail - no encryption config specified
resource "awscc_eks_cluster" "fail_no_encryption" {
  name     = "example-cluster-no-encryption"
  role_arn = "arn:aws:iam::123456789012:role/eks-cluster-role"
  vpc_config = {
    subnet_ids = ["subnet-0123456789abcdef0", "subnet-0123456789abcdef1"]
  }
}

# fail - encryption config without secrets resource
resource "awscc_eks_cluster" "fail_no_secrets" {
  name     = "example-cluster-no-secrets"
  role_arn = "arn:aws:iam::123456789012:role/eks-cluster-role"
  vpc_config = {
    subnet_ids = ["subnet-0123456789abcdef0", "subnet-0123456789abcdef1"]
  }
  encryption_config = [
    {
      resources = ["configmaps"]
      provider = {
        key_arn = "arn:aws:kms:us-east-1:123456789012:key/abcd1234-a123-456a-a12b-a123b4cd56ef"
      }
    }
  ]
}

# fail - encryption config without KMS key
resource "awscc_eks_cluster" "fail_no_key" {
  name     = "example-cluster-no-key"
  role_arn = "arn:aws:iam::123456789012:role/eks-cluster-role"
  vpc_config = {
    subnet_ids = ["subnet-0123456789abcdef0", "subnet-0123456789abcdef1"]
  }
  encryption_config = [
    {
      resources = ["secrets"]
      provider = {}
    }
  ]
}
