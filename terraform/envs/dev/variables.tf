variable "aws_region" {
  type        = string
  description = "AWS region"
  default     = "ap-south-1"
}

variable "project_name" {
  type        = string
  description = "Project name"
  default     = "eks-cicd-poc"
}

variable "environment" {
  type        = string
  description = "Environment name"
  default     = "dev"
}

variable "vpc_cidr" {
  type        = string
  default     = "10.10.0.0/16"
}

variable "azs" {
  type = list(string)
  default = [
    "ap-south-1a",
    "ap-south-1b"
  ]
}

variable "private_subnets" {
  type = list(string)
  default = [
    "10.10.1.0/24",
    "10.10.2.0/24"
  ]
}

variable "public_subnets" {
  type = list(string)
  default = [
    "10.10.101.0/24",
    "10.10.102.0/24"
  ]
}

variable "cluster_name" {
  type        = string
  default     = "eks-cicd-poc-dev"
}

variable "cluster_version" {
  type        = string
  default     = "1.31"
}

variable "node_instance_types" {
  type    = list(string)
  default = ["t3.medium"]
}

variable "node_desired_size" {
  type    = number
  default = 2
}

variable "node_min_size" {
  type    = number
  default = 2
}

variable "node_max_size" {
  type    = number
  default = 3
}

variable "github_repo" {
  type        = string
  description = "GitHub repo in org/repo format for OIDC role trust"
  default     = "https://github.com/sreerajreddy/EKS-cicd-poc.git"
}
