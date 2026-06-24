output "github_actions_role_arn" {
  value = aws_iam_role.github_actions.arn
}

output "efs_csi_role_arn" {
  value = aws_iam_role.efs_csi.arn
}
