#!/bin/bash

# Terraform Import Commands for Existing IAM Resources
# Run these commands from the terraform/prod/iam directory after running 'terraform init'

echo "Starting Terraform imports for existing IAM resources..."

# Import IAM Users
echo "Importing IAM Users..."
terraform import aws_iam_user.bitbucket_user bitbucket-user-pipelines-deployment
terraform import aws_iam_user.bitbucket_user_dev bitbucket-user-pipelines-deployment-dev
terraform import aws_iam_user.cvouga_user "cvouga@asu.edu.asu-le-api-prod"

# Import Custom IAM Policies
echo "Importing Custom IAM Policies..."
terraform import aws_iam_policy.secrets_manager_policy arn:aws:iam::126376345002:policy/CustomCreateAndReadAllSecretsInThisAccount
terraform import aws_iam_policy.ec2_route_table_policy arn:aws:iam::126376345002:policy/BitbucketEC2RouteTablePolicy
terraform import aws_iam_policy.generic_readonly_policy arn:aws:iam::126376345002:policy/GenericReadOnlyPolicy

# Import Policy Attachments for Bitbucket User (Prod)
echo "Importing Policy Attachments..."
terraform import aws_iam_user_policy_attachment.bitbucket_secrets bitbucket-user-pipelines-deployment/arn:aws:iam::126376345002:policy/CustomCreateAndReadAllSecretsInThisAccount
terraform import aws_iam_user_policy_attachment.bitbucket_ec2 bitbucket-user-pipelines-deployment/arn:aws:iam::126376345002:policy/BitbucketEC2RouteTablePolicy
terraform import aws_iam_user_policy_attachment.bitbucket_cloudfront bitbucket-user-pipelines-deployment/arn:aws:iam::aws:policy/CloudFrontFullAccess

# Import Policy Attachments for Cvouga User
terraform import aws_iam_user_policy_attachment.cvouga_readonly "cvouga@asu.edu.asu-le-api-prod"/arn:aws:iam::126376345002:policy/GenericReadOnlyPolicy
terraform import aws_iam_user_policy_attachment.cvouga_change_password "cvouga@asu.edu.asu-le-api-prod"/arn:aws:iam::aws:policy/IAMUserChangePassword

echo "Import process completed. Run 'terraform plan' to verify the configuration matches the existing resources."