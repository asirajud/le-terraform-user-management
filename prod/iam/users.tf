# IAM Users

resource "aws_iam_user" "bitbucket_user" {
  name = "bitbucket-user-pipelines-deployment"
  path = "/"

  tags = {
    Environment = "prod"
    Purpose     = "bitbucket-pipelines"
    ManagedBy   = "terraform"
  }
}

resource "aws_iam_user" "bitbucket_user_dev" {
  name = "bitbucket-user-pipelines-deployment-dev"
  path = "/"

  tags = {
    Environment = "dev"
    Purpose     = "bitbucket-pipelines"
    ManagedBy   = "terraform"
  }
}

resource "aws_iam_user" "cvouga_user" {
  name = "cvouga@asu.edu.asu-le-api-prod"
  path = "/"

  tags = {
    Environment = "prod"
    Purpose     = "asu-le-api"
    ManagedBy   = "terraform"
  }
}

# Policy Attachments for Bitbucket User (Prod)
resource "aws_iam_user_policy_attachment" "bitbucket_secrets" {
  user       = aws_iam_user.bitbucket_user.name
  policy_arn = aws_iam_policy.secrets_manager_policy.arn
}

resource "aws_iam_user_policy_attachment" "bitbucket_ec2" {
  user       = aws_iam_user.bitbucket_user.name
  policy_arn = aws_iam_policy.ec2_route_table_policy.arn
}

resource "aws_iam_user_policy_attachment" "bitbucket_cloudfront" {
  user       = aws_iam_user.bitbucket_user.name
  policy_arn = data.aws_iam_policy.cloudfront_full_access.arn
}

# Policy Attachments for Cvouga User
resource "aws_iam_user_policy_attachment" "cvouga_readonly" {
  user       = aws_iam_user.cvouga_user.name
  policy_arn = aws_iam_policy.generic_readonly_policy.arn
}

resource "aws_iam_user_policy_attachment" "cvouga_change_password" {
  user       = aws_iam_user.cvouga_user.name
  policy_arn = data.aws_iam_policy.iam_user_change_password.arn
}