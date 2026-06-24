module "vpc" {
  source = "git::https://github.com/your-org/tf-modules.git//vpc?ref=v1.2.0"
  cidr   = "10.0.0.0/16"
  azs    = ["ap-south-1a", "ap-south-1b"]
}

module "eks" {
  source          = "git::https://github.com/your-org/tf-modules.git//eks?ref=v1.2.0"
  cluster_name    = "poc-cluster"
  cluster_version = "1.29"
  vpc_id          = module.vpc.vpc_id
  subnet_ids      = module.vpc.private_subnet_ids
  node_groups = {
    default = {
      instance_types = ["t3.medium"]
      min_size       = 1
      max_size       = 3
      desired_size   = 2
    }
  }
}

module "efs" {
  source     = "git::https://github.com/your-org/tf-modules.git//efs?ref=v1.2.0"
  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnet_ids
}

module "ecr" {
  source         = "git::https://github.com/your-org/tf-modules.git//ecr?ref=v1.2.0"
  repository_name = "poc-app"
  image_mutability = "MUTABLE"
}
