resource "awscc_eks_cluster" "pass" {
  name     = "example-cluster"
  role_arn = "arn:aws:iam::123456789012:role/eks-cluster-role"
  version  = "1.30"  # Supported version as of 2025
  
  vpc_config {
    subnet_ids = ["subnet-abcdef12", "subnet-34567890"]
  }
}

resource "awscc_eks_cluster" "pass2" {
  name     = "example-cluster-latest"
  role_arn = "arn:aws:iam::123456789012:role/eks-cluster-role"
  version  = "1.32"  # Latest supported version as of 2025
  
  vpc_config {
    subnet_ids = ["subnet-abcdef12", "subnet-34567890"]
  }
}

resource "awscc_eks_cluster" "fail" {
  name     = "example-cluster-outdated"
  role_arn = "arn:aws:iam::123456789012:role/eks-cluster-role"
  version  = "1.25"  # Outdated version as of 2025
  
  vpc_config {
    subnet_ids = ["subnet-abcdef12", "subnet-34567890"]
  }
}

resource "awscc_eks_cluster" "fail2" {
  name     = "example-cluster-very-outdated"
  role_arn = "arn:aws:iam::123456789012:role/eks-cluster-role"
  version  = "1.23"  # Very outdated version as of 2025
  
  vpc_config {
    subnet_ids = ["subnet-abcdef12", "subnet-34567890"]
  }
}
