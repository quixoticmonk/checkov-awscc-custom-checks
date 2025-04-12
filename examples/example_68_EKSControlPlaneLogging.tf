resource "awscc_eks_cluster" "pass" {
  name    = "secure-eks-cluster"
  role_arn = "arn:aws:iam::123456789012:role/eks-cluster-role"
  
  kubernetes_network_config = {
    service_ipv4_cidr = "172.20.0.0/16"
  }
  
  logging = {
    cluster_logging = [
      {
        enabled_types = [
          {
            type = "api"
          },
          {
            type = "audit"
          },
          {
            type = "authenticator"
          },
          {
            type = "controllerManager"
          },
          {
            type = "scheduler"
          }
        ]
      }
    ]
  }
  
  resources_vpc_config = {
    subnet_ids = ["subnet-12345678", "subnet-87654321"]
  }
}

resource "awscc_eks_cluster" "fail" {
  name    = "insecure-eks-cluster"
  role_arn = "arn:aws:iam::123456789012:role/eks-cluster-role"
  
  kubernetes_network_config = {
    service_ipv4_cidr = "172.20.0.0/16"
  }
  
  logging = {
    cluster_logging = [
      {
        enabled_types = [
          {
            type = "api"
          },
          {
            type = "audit"
          }
          # Missing authenticator, controllerManager, and scheduler logs
        ]
      }
    ]
  }
  
  resources_vpc_config = {
    subnet_ids = ["subnet-12345678", "subnet-87654321"]
  }
}

resource "awscc_eks_cluster" "fail2" {
  name    = "no-logging-eks-cluster"
  role_arn = "arn:aws:iam::123456789012:role/eks-cluster-role"
  
  kubernetes_network_config = {
    service_ipv4_cidr = "172.20.0.0/16"
  }
  
  # No logging configuration
  
  resources_vpc_config = {
    subnet_ids = ["subnet-12345678", "subnet-87654321"]
  }
}
