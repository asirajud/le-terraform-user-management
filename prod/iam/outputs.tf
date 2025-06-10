# Outputs

output "user_arns" {
  description = "ARNs of all IAM users"
  value = {
    bitbucket_user     = aws_iam_user.bitbucket_user.arn
    bitbucket_user_dev = aws_iam_user.bitbucket_user_dev.arn
    cvouga_user        = aws_iam_user.cvouga_user.arn
  }
}

output "policy_arns" {
  description = "ARNs of all custom IAM policies"
  value = {
    secrets_manager_policy  = aws_iam_policy.secrets_manager_policy.arn
    ec2_route_table_policy  = aws_iam_policy.ec2_route_table_policy.arn
    generic_readonly_policy = aws_iam_policy.generic_readonly_policy.arn
  }
}