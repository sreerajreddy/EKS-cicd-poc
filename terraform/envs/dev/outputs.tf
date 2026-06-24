output "vpc_id" {
  value = module.vpc.vpc_id
}

output "cluster_name" {
  value = module.eks.cluster_name
}

output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "cluster_oidc_provider_arn" {
  value = module.eks.oidc_provider_arn
}

output "node_security_group_id" {
  value = module.eks.node_security_group_id
}

output "ecr_repositories" {
  value = module.ecr.repository_urls
}

output "efs_file_system_id" {
  value = module.efs.file_system_id
}

output "github_actions_role_arn" {
  value = module.iam.github_actions_role_arn
}
