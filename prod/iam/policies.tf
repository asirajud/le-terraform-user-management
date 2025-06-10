# Custom IAM Policies

resource "aws_iam_policy" "secrets_manager_policy" {
  name = "CustomCreateAndReadAllSecretsInThisAccount"
  path = "/"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "VisualEditor0"
        Effect = "Allow"
        Action = [
          "secretsmanager:GetResourcePolicy",
          "secretsmanager:UntagResource",
          "secretsmanager:GetSecretValue",
          "secretsmanager:DescribeSecret",
          "secretsmanager:PutResourcePolicy",
          "secretsmanager:PutSecretValue",
          "secretsmanager:CreateSecret",
          "secretsmanager:ListSecretVersionIds",
          "secretsmanager:TagResource"
        ]
        Resource = "arn:aws:secretsmanager:us-west-2:126376345002:secret:*"
      },
      {
        Sid    = "VisualEditor1"
        Effect = "Allow"
        Action = [
          "secretsmanager:GetRandomPassword",
          "secretsmanager:UntagResource",
          "secretsmanager:PutResourcePolicy",
          "secretsmanager:PutSecretValue",
          "secretsmanager:ListSecrets",
          "secretsmanager:BatchGetSecretValue",
          "secretsmanager:TagResource"
        ]
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_policy" "ec2_route_table_policy" {
  name = "BitbucketEC2RouteTablePolicy"
  path = "/"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "ec2:CreateRouteTable",
          "ec2:CreateRoute",
          "ec2:DeleteRouteTable",
          "ec2:DeleteRoute",
          "ec2:AssociateRouteTable",
          "ec2:DisassociateRouteTable",
          "ec2:DescribeRouteTables",
          "ec2:DescribeVpcs",
          "ec2:DescribeSubnets",
          "ec2:DescribeInternetGateways",
          "ec2:DescribeNatGateways",
          "ec2:CreateTags",
          "ec2:DeleteTags",
          "ec2:DescribeTags"
        ]
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_policy" "generic_readonly_policy" {
  name = "GenericReadOnlyPolicy"
  path = "/"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "ec2:Describe*",
          "cloudformation:Describe*",
          "cloudformation:Get*",
          "cloudformation:List*",
          "s3:Get*",
          "s3:List*",
          "iam:Get*",
          "iam:List*",
          "logs:Describe*",
          "logs:Get*",
          "logs:List*",
          "rds:Describe*",
          "lambda:Get*",
          "lambda:List*",
          "secretsmanager:Describe*",
          "secretsmanager:Get*",
          "secretsmanager:List*",
          "route53:Get*",
          "route53:List*",
          "cloudfront:Get*",
          "cloudfront:List*",
          "elasticloadbalancing:Describe*"
        ]
        Resource = "*"
      }
    ]
  })
}

# Reference to AWS managed policies
data "aws_iam_policy" "cloudfront_full_access" {
  arn = "arn:aws:iam::aws:policy/CloudFrontFullAccess"
}

data "aws_iam_policy" "iam_user_change_password" {
  arn = "arn:aws:iam::aws:policy/IAMUserChangePassword"
}