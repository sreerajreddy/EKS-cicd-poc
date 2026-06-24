output "cluster_name" {
  value = module.eks.cluster_name
}

output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "cluster_oidc_provider_arn" {
  value = module.eks.cluster_oidc_provider_arn
}

output "cluster_oidc_issuer_url" {
  value = module.eks.cluster_oidc_issuer_url
}

output "node_security_group_id" {
  value = module.eks.node_security_group_id
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "efs_file_system_id" {
  value = module.efs.file_system_id
}

output "ecr_repositories" {
  value = module.ecr.repository_urls
}

output "github_actions_role_arn" {
  value = module.iam.github_actions_role_arn
}

output "efs_csi_role_arn" {
  value = module.iam.efs_csi_role_arn
}
