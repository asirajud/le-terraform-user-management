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
          "ec2:ReplaceRouteTableAssociation",
          "ec2:DescribeRouteTables",
          "ec2:DescribeVpcs",
          "ec2:DescribeSubnets",
          "ec2:DescribeInternetGateways",
          "ec2:DescribeNatGateways",
          "ec2:CreateNatGateway",
          "ec2:DeleteNatGateway",
          "ec2:CreateTags",
          "ec2:DeleteTags",
          "ec2:DescribeTags",
          "ec2:AllocateAddress",
          "ec2:AssociateAddress",
          "ec2:DisassociateAddress",
          "ec2:ReleaseAddress",
          "ec2:DescribeAddresses"
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

# Auto-discovered custom policy: AWSLoadBalancerControllerIAMPolicy-aether-eks-prod
resource "aws_iam_policy" "AWSLoadBalancerControllerIAMPolicy_aether_eks_prod" {
  name = "AWSLoadBalancerControllerIAMPolicy-aether-eks-prod"
  path = "/"
  
  policy = jsonencode({
    "Statement": [
        {
            "Action": [
                "iam:CreateServiceLinkedRole"
            ],
            "Condition": {
                "StringEquals": {
                    "iam:AWSServiceName": "elasticloadbalancing.amazonaws.com"
                }
            },
            "Effect": "Allow",
            "Resource": "*"
        },
        {
            "Action": [
                "ec2:DescribeAccountAttributes",
                "ec2:DescribeAddresses",
                "ec2:DescribeAvailabilityZones",
                "ec2:DescribeInternetGateways",
                "ec2:DescribeVpcs",
                "ec2:DescribeVpcPeeringConnections",
                "ec2:DescribeSubnets",
                "ec2:DescribeSecurityGroups",
                "ec2:DescribeInstances",
                "ec2:DescribeNetworkInterfaces",
                "ec2:DescribeTags",
                "ec2:GetCoipPoolUsage",
                "ec2:DescribeCoipPools",
                "ec2:GetSecurityGroupsForVpc",
                "ec2:DescribeIpamPools",
                "ec2:DescribeRouteTables",
                "elasticloadbalancing:DescribeLoadBalancers",
                "elasticloadbalancing:DescribeLoadBalancerAttributes",
                "elasticloadbalancing:DescribeListeners",
                "elasticloadbalancing:DescribeListenerCertificates",
                "elasticloadbalancing:DescribeSSLPolicies",
                "elasticloadbalancing:DescribeRules",
                "elasticloadbalancing:DescribeTargetGroups",
                "elasticloadbalancing:DescribeTargetGroupAttributes",
                "elasticloadbalancing:DescribeTargetHealth",
                "elasticloadbalancing:DescribeTags",
                "elasticloadbalancing:DescribeTrustStores",
                "elasticloadbalancing:DescribeListenerAttributes",
                "elasticloadbalancing:DescribeCapacityReservation"
            ],
            "Effect": "Allow",
            "Resource": "*"
        },
        {
            "Action": [
                "cognito-idp:DescribeUserPoolClient",
                "acm:ListCertificates",
                "acm:DescribeCertificate",
                "iam:ListServerCertificates",
                "iam:GetServerCertificate",
                "waf-regional:GetWebACL",
                "waf-regional:GetWebACLForResource",
                "waf-regional:AssociateWebACL",
                "waf-regional:DisassociateWebACL",
                "wafv2:GetWebACL",
                "wafv2:GetWebACLForResource",
                "wafv2:AssociateWebACL",
                "wafv2:DisassociateWebACL",
                "shield:GetSubscriptionState",
                "shield:DescribeProtection",
                "shield:CreateProtection",
                "shield:DeleteProtection"
            ],
            "Effect": "Allow",
            "Resource": "*"
        },
        {
            "Action": [
                "ec2:AuthorizeSecurityGroupIngress",
                "ec2:RevokeSecurityGroupIngress"
            ],
            "Effect": "Allow",
            "Resource": "*"
        },
        {
            "Action": [
                "ec2:CreateSecurityGroup"
            ],
            "Effect": "Allow",
            "Resource": "*"
        },
        {
            "Action": [
                "ec2:CreateTags"
            ],
            "Condition": {
                "Null": {
                    "aws:RequestTag/elbv2.k8s.aws/cluster": "false"
                },
                "StringEquals": {
                    "ec2:CreateAction": "CreateSecurityGroup"
                }
            },
            "Effect": "Allow",
            "Resource": "arn:aws:ec2:*:*:security-group/*"
        },
        {
            "Action": [
                "ec2:CreateTags",
                "ec2:DeleteTags"
            ],
            "Condition": {
                "Null": {
                    "aws:RequestTag/elbv2.k8s.aws/cluster": "true",
                    "aws:ResourceTag/elbv2.k8s.aws/cluster": "false"
                }
            },
            "Effect": "Allow",
            "Resource": "arn:aws:ec2:*:*:security-group/*"
        },
        {
            "Action": [
                "ec2:AuthorizeSecurityGroupIngress",
                "ec2:RevokeSecurityGroupIngress",
                "ec2:DeleteSecurityGroup"
            ],
            "Condition": {
                "Null": {
                    "aws:ResourceTag/elbv2.k8s.aws/cluster": "false"
                }
            },
            "Effect": "Allow",
            "Resource": "*"
        },
        {
            "Action": [
                "elasticloadbalancing:CreateLoadBalancer",
                "elasticloadbalancing:CreateTargetGroup"
            ],
            "Condition": {
                "Null": {
                    "aws:RequestTag/elbv2.k8s.aws/cluster": "false"
                }
            },
            "Effect": "Allow",
            "Resource": "*"
        },
        {
            "Action": [
                "elasticloadbalancing:CreateListener",
                "elasticloadbalancing:DeleteListener",
                "elasticloadbalancing:CreateRule",
                "elasticloadbalancing:DeleteRule"
            ],
            "Effect": "Allow",
            "Resource": "*"
        },
        {
            "Action": [
                "elasticloadbalancing:AddTags",
                "elasticloadbalancing:RemoveTags"
            ],
            "Condition": {
                "Null": {
                    "aws:RequestTag/elbv2.k8s.aws/cluster": "true",
                    "aws:ResourceTag/elbv2.k8s.aws/cluster": "false"
                }
            },
            "Effect": "Allow",
            "Resource": [
                "arn:aws:elasticloadbalancing:*:*:targetgroup/*/*",
                "arn:aws:elasticloadbalancing:*:*:loadbalancer/net/*/*",
                "arn:aws:elasticloadbalancing:*:*:loadbalancer/app/*/*"
            ]
        },
        {
            "Action": [
                "elasticloadbalancing:AddTags",
                "elasticloadbalancing:RemoveTags"
            ],
            "Effect": "Allow",
            "Resource": [
                "arn:aws:elasticloadbalancing:*:*:listener/net/*/*/*",
                "arn:aws:elasticloadbalancing:*:*:listener/app/*/*/*",
                "arn:aws:elasticloadbalancing:*:*:listener-rule/net/*/*/*",
                "arn:aws:elasticloadbalancing:*:*:listener-rule/app/*/*/*"
            ]
        },
        {
            "Action": [
                "elasticloadbalancing:ModifyLoadBalancerAttributes",
                "elasticloadbalancing:SetIpAddressType",
                "elasticloadbalancing:SetSecurityGroups",
                "elasticloadbalancing:SetSubnets",
                "elasticloadbalancing:DeleteLoadBalancer",
                "elasticloadbalancing:ModifyTargetGroup",
                "elasticloadbalancing:ModifyTargetGroupAttributes",
                "elasticloadbalancing:DeleteTargetGroup",
                "elasticloadbalancing:ModifyListenerAttributes",
                "elasticloadbalancing:ModifyCapacityReservation",
                "elasticloadbalancing:ModifyIpPools"
            ],
            "Condition": {
                "Null": {
                    "aws:ResourceTag/elbv2.k8s.aws/cluster": "false"
                }
            },
            "Effect": "Allow",
            "Resource": "*"
        },
        {
            "Action": [
                "elasticloadbalancing:AddTags"
            ],
            "Condition": {
                "Null": {
                    "aws:RequestTag/elbv2.k8s.aws/cluster": "false"
                },
                "StringEquals": {
                    "elasticloadbalancing:CreateAction": [
                        "CreateTargetGroup",
                        "CreateLoadBalancer"
                    ]
                }
            },
            "Effect": "Allow",
            "Resource": [
                "arn:aws:elasticloadbalancing:*:*:targetgroup/*/*",
                "arn:aws:elasticloadbalancing:*:*:loadbalancer/net/*/*",
                "arn:aws:elasticloadbalancing:*:*:loadbalancer/app/*/*"
            ]
        },
        {
            "Action": [
                "elasticloadbalancing:RegisterTargets",
                "elasticloadbalancing:DeregisterTargets"
            ],
            "Effect": "Allow",
            "Resource": "arn:aws:elasticloadbalancing:*:*:targetgroup/*/*"
        },
        {
            "Action": [
                "elasticloadbalancing:SetWebAcl",
                "elasticloadbalancing:ModifyListener",
                "elasticloadbalancing:AddListenerCertificates",
                "elasticloadbalancing:RemoveListenerCertificates",
                "elasticloadbalancing:ModifyRule",
                "elasticloadbalancing:SetRulePriorities"
            ],
            "Effect": "Allow",
            "Resource": "*"
        }
    ],
    "Version": "2012-10-17"
})
}

# Auto-discovered custom policy: SqsPipeSourceTemplate-2570f8b2
resource "aws_iam_policy" "SqsPipeSourceTemplate_2570f8b2" {
  name = "SqsPipeSourceTemplate-2570f8b2"
  path = "/"
  
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "sqs:ReceiveMessage",
                "sqs:DeleteMessage",
                "sqs:GetQueueAttributes"
            ],
            "Resource": [
                "arn:aws:sqs:us-west-2:126376345002:ai-grader-NavigatedTo-CanvasCaliperEvent"
            ]
        }
    ]
})
}

# Auto-discovered custom policy: Cognito-1723493842800
resource "aws_iam_policy" "Cognito_1723493842800" {
  name = "Cognito-1723493842800"
  path = "/"
  
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "sns:publish"
            ],
            "Resource": [
                "*"
            ]
        }
    ]
})
}

# Auto-discovered custom policy: prod-events-lrs-statements-policy
resource "aws_iam_policy" "prod_events_lrs_statements_policy" {
  name = "prod-events-lrs-statements-policy"
  path = "/"
  
  policy = jsonencode({
    "Statement": [
        {
            "Action": [
                "dynamodb:ListStreams",
                "dynamodb:GetShardIterator",
                "dynamodb:GetRecords",
                "dynamodb:DescribeStream"
            ],
            "Effect": "Allow",
            "Resource": "arn:aws:dynamodb:us-west-2:126376345002:table/prod-le-bluebird-statements/stream/2024-02-14T01:20:53.108"
        },
        {
            "Action": [
                "dynamodb:UpdateItem",
                "dynamodb:Scan",
                "dynamodb:Query",
                "dynamodb:PutItem",
                "dynamodb:GetItem",
                "dynamodb:DescribeTable",
                "dynamodb:DeleteItem"
            ],
            "Effect": "Allow",
            "Resource": [
                "arn:aws:dynamodb:us-west-2:126376345002:table/prod-le-bluebird-statements/index/*",
                "arn:aws:dynamodb:us-west-2:126376345002:table/prod-le-bluebird-statements",
                "arn:aws:dynamodb:us-west-2:126376345002:table/prod-le-bluebird-grades",
                "arn:aws:dynamodb:us-west-2:126376345002:table/prod-le-bluebird-course-completion",
                "arn:aws:dynamodb:us-west-2:126376345002:table/prod-le-bluebird-articulate-coures-mapping"
            ]
        }
    ],
    "Version": "2012-10-17"
})
}

# Auto-discovered custom policy: AWSLambdaBasicExecutionRole-191b62b4-0802-4102-ad29-51f40f1edf3d
resource "aws_iam_policy" "AWSLambdaBasicExecutionRole_191b62b4_0802_4102_ad29_51f40f1edf3d" {
  name = "AWSLambdaBasicExecutionRole-191b62b4-0802-4102-ad29-51f40f1edf3d"
  path = "/"
  
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "logs:CreateLogGroup",
            "Resource": "arn:aws:logs:us-west-2:126376345002:*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "logs:CreateLogStream",
                "logs:PutLogEvents"
            ],
            "Resource": [
                "arn:aws:logs:us-west-2:126376345002:log-group:/aws/lambda/le-pelh-qa-typesense-reindexer-scheduler-failure-backup:*"
            ]
        }
    ]
})
}

# Auto-discovered custom policy: AmplifySSRLoggingPolicy-d6e89cfd-c8a9-4e70-86df-598274839b25
resource "aws_iam_policy" "AmplifySSRLoggingPolicy_d6e89cfd_c8a9_4e70_86df_598274839b25" {
  name = "AmplifySSRLoggingPolicy-d6e89cfd-c8a9-4e70-86df-598274839b25"
  path = "/"
  
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PushLogs",
            "Effect": "Allow",
            "Action": [
                "logs:CreateLogStream",
                "logs:PutLogEvents"
            ],
            "Resource": "arn:aws:logs:us-west-2:126376345002:log-group:/aws/amplify/*:log-stream:*"
        },
        {
            "Sid": "CreateLogGroup",
            "Effect": "Allow",
            "Action": "logs:CreateLogGroup",
            "Resource": "arn:aws:logs:us-west-2:126376345002:log-group:/aws/amplify/*"
        },
        {
            "Sid": "DescribeLogGroups",
            "Effect": "Allow",
            "Action": "logs:DescribeLogGroups",
            "Resource": "arn:aws:logs:us-west-2:126376345002:log-group:*"
        }
    ]
})
}

# Auto-discovered custom policy: SnowOrganizationAccountAccessRole
resource "aws_iam_policy" "SnowOrganizationAccountAccessRole" {
  name = "SnowOrganizationAccountAccessRole"
  path = "/"
  
  policy = jsonencode({
    "Statement": [
        {
            "Action": [
                "organizations:ListTagsForResource",
                "organizations:ListRoots",
                "organizations:ListOrganizationalUnitsForParent",
                "organizations:ListAccountsForParent",
                "organizations:ListAccounts",
                "organizations:DescribeOrganizationalUnit",
                "organizations:DescribeOrganization"
            ],
            "Effect": "Allow",
            "Resource": "*",
            "Sid": "ServiceNowUserReadOnlyAccessOrg"
        },
        {
            "Action": [
                "config:SelectResourceConfig",
                "config:ListDiscoveredResources",
                "config:BatchGetResourceConfig"
            ],
            "Effect": "Allow",
            "Resource": "*",
            "Sid": "ServiceNowUserReadOnlyAccessConfig"
        },
        {
            "Action": [
                "config:SelectAggregateResourceConfig",
                "config:DescribeConfigurationAggregators",
                "config:BatchGetAggregateResourceConfig"
            ],
            "Effect": "Allow",
            "Resource": "*",
            "Sid": "ServiceNowUserReadOnlyAccessConfigAgg"
        },
        {
            "Action": [
                "ec2:DescribeRegions",
                "ec2:DescribeInstances",
                "ec2:DescribeInstanceTypes",
                "ec2:DescribeImages"
            ],
            "Effect": "Allow",
            "Resource": "*",
            "Sid": "ServiceNowUserReadOnlyAccessEC2"
        },
        {
            "Action": [
                "ssm:ListInventoryEntries",
                "ssm:GetInventory",
                "ssm:DescribeInstanceInformation"
            ],
            "Effect": "Allow",
            "Resource": "*",
            "Sid": "ServiceNowUserReadOnlyAccessSSM"
        },
        {
            "Action": "tag:GetResources",
            "Effect": "Allow",
            "Resource": "*",
            "Sid": "ServiceNowUserReadOnlyAccessTag"
        },
        {
            "Action": [
                "iam:DeleteAccessKey",
                "iam:CreateAccessKey"
            ],
            "Effect": "Allow",
            "Resource": "arn:aws:iam::515117622683:user/service/servicenow/SnowServiceGraphConnector",
            "Sid": "ServiceNowUserReadOnlyAccessIAM"
        }
    ],
    "Version": "2012-10-17"
})
}

# Auto-discovered custom policy: dev-publish-events-policy
resource "aws_iam_policy" "dev_publish_events_policy" {
  name = "dev-publish-events-policy"
  path = "/"
  
  policy = jsonencode({
    "Statement": [
        {
            "Action": [
                "dynamodb:ListStreams",
                "dynamodb:GetShardIterator",
                "dynamodb:GetRecords",
                "dynamodb:DescribeStream"
            ],
            "Effect": "Allow",
            "Resource": [
                "arn:aws:dynamodb:us-west-2:126376345002:table/dev-le-bluebird-grades/stream/2024-01-08T07:45:19.798",
                "arn:aws:dynamodb:us-west-2:126376345002:table/dev-le-bluebird-course-completion/stream/2024-01-08T07:45:19.809"
            ]
        },
        {
            "Action": [
                "dynamodb:UpdateItem",
                "dynamodb:Scan",
                "dynamodb:Query",
                "dynamodb:PutItem",
                "dynamodb:GetItem",
                "dynamodb:DescribeTable",
                "dynamodb:DeleteItem"
            ],
            "Effect": "Allow",
            "Resource": [
                "arn:aws:dynamodb:us-west-2:126376345002:table/dev-le-bluebird-statements/index/*",
                "arn:aws:dynamodb:us-west-2:126376345002:table/dev-le-bluebird-statements",
                "arn:aws:dynamodb:us-west-2:126376345002:table/dev-le-bluebird-grades",
                "arn:aws:dynamodb:us-west-2:126376345002:table/dev-le-bluebird-course-completion",
                "arn:aws:dynamodb:us-west-2:126376345002:table/dev-le-bluebird-articulate-coures-mapping",
                "arn:aws:dynamodb:us-west-2:126376345002:table/dev-le-bluebird-activities-states"
            ]
        },
        {
            "Action": "sns:Publish",
            "Effect": "Allow",
            "Resource": "arn:aws:sns:us-west-2:126376345002:dev-le-bluebird-events"
        }
    ],
    "Version": "2012-10-17"
})
}

# Auto-discovered custom policy: AWSLambdaBasicExecutionRole-4bdd13d3-60d5-4754-92e1-93c5ac8b2e0e
resource "aws_iam_policy" "AWSLambdaBasicExecutionRole_4bdd13d3_60d5_4754_92e1_93c5ac8b2e0e" {
  name = "AWSLambdaBasicExecutionRole-4bdd13d3-60d5-4754-92e1-93c5ac8b2e0e"
  path = "/"
  
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "logs:CreateLogGroup",
            "Resource": "arn:aws:logs:us-west-2:126376345002:*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "logs:CreateLogStream",
                "logs:PutLogEvents"
            ],
            "Resource": [
                "arn:aws:logs:us-west-2:126376345002:log-group:/aws/lambda/prod-app-errors-5xx-careercatalyst:*"
            ]
        }
    ]
})
}

# Auto-discovered custom policy: amplify-d1p24pvuitvmhb-amplifytest-branch-9a60fb9e10-data7552DF31-1G7QNNODGXI2X-amplifyDataAuthRolePolicy01567A5654-IZ3U6n0DAPAB
resource "aws_iam_policy" "amplify_d1p24pvuitvmhb_amplifytest_branch_9a60fb9e10_data7552DF31_1G7QNNODGXI2X_amplifyDataAuthRolePolicy01567A5654_IZ3U6n0DAPAB" {
  name = "amplify-d1p24pvuitvmhb-amplifytest-branch-9a60fb9e10-data7552DF31-1G7QNNODGXI2X-amplifyDataAuthRolePolicy01567A5654-IZ3U6n0DAPAB"
  path = "/"
  
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "appsync:GraphQL",
            "Resource": [
                "arn:aws:appsync:us-west-2:126376345002:apis/tejofvuhgjdpviwqgx3f4a2mqy/types/Todo/*",
                "arn:aws:appsync:us-west-2:126376345002:apis/tejofvuhgjdpviwqgx3f4a2mqy/types/Query/fields/getTodo",
                "arn:aws:appsync:us-west-2:126376345002:apis/tejofvuhgjdpviwqgx3f4a2mqy/types/Query/fields/listTodos",
                "arn:aws:appsync:us-west-2:126376345002:apis/tejofvuhgjdpviwqgx3f4a2mqy/types/Mutation/fields/createTodo",
                "arn:aws:appsync:us-west-2:126376345002:apis/tejofvuhgjdpviwqgx3f4a2mqy/types/Mutation/fields/updateTodo",
                "arn:aws:appsync:us-west-2:126376345002:apis/tejofvuhgjdpviwqgx3f4a2mqy/types/Mutation/fields/deleteTodo",
                "arn:aws:appsync:us-west-2:126376345002:apis/tejofvuhgjdpviwqgx3f4a2mqy/types/Subscription/fields/onCreateTodo",
                "arn:aws:appsync:us-west-2:126376345002:apis/tejofvuhgjdpviwqgx3f4a2mqy/types/Subscription/fields/onUpdateTodo",
                "arn:aws:appsync:us-west-2:126376345002:apis/tejofvuhgjdpviwqgx3f4a2mqy/types/Subscription/fields/onDeleteTodo"
            ],
            "Effect": "Allow"
        }
    ]
})
}

# Auto-discovered custom policy: ResourceGroupsTagSyncRole-81cad057-aba0-4207-ac14-c2e16c8eb893
resource "aws_iam_policy" "ResourceGroupsTagSyncRole_81cad057_aba0_4207_ac14_c2e16c8eb893" {
  name = "ResourceGroupsTagSyncRole-81cad057-aba0-4207-ac14-c2e16c8eb893"
  path = "/"
  
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "resource-groups:UngroupResources",
                "resource-groups:GroupResources"
            ],
            "Resource": "*"
        }
    ]
})
}

# Auto-discovered custom policy: AWSLambdaBasicExecutionRole-fa3e84c0-9594-4098-8bc6-3027cc9b1397
resource "aws_iam_policy" "AWSLambdaBasicExecutionRole_fa3e84c0_9594_4098_8bc6_3027cc9b1397" {
  name = "AWSLambdaBasicExecutionRole-fa3e84c0-9594-4098-8bc6-3027cc9b1397"
  path = "/"
  
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "logs:CreateLogGroup",
            "Resource": "arn:aws:logs:us-east-2:126376345002:*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "logs:CreateLogStream",
                "logs:PutLogEvents"
            ],
            "Resource": [
                "arn:aws:logs:us-east-2:126376345002:log-group:/aws/lambda/le-test-function:*"
            ]
        }
    ]
})
}

# Auto-discovered custom policy: dev-cloudwatch-logging-policy
resource "aws_iam_policy" "dev_cloudwatch_logging_policy" {
  name = "dev-cloudwatch-logging-policy"
  path = "/"
  
  policy = jsonencode({
    "Statement": [
        {
            "Action": "logs:CreateLogGroup",
            "Effect": "Allow",
            "Resource": "arn:aws:logs:us-west-2:126376345002:*"
        },
        {
            "Action": [
                "logs:PutLogEvents",
                "logs:CreateLogStream"
            ],
            "Effect": "Allow",
            "Resource": "arn:aws:logs:us-west-2:126376345002:log-group:*:log-stream:*"
        }
    ],
    "Version": "2012-10-17"
})
}

# Auto-discovered custom policy: AWSLambdaBasicExecutionRole-39f3a81c-5c0d-468f-ad3a-02141badd9f5
resource "aws_iam_policy" "AWSLambdaBasicExecutionRole_39f3a81c_5c0d_468f_ad3a_02141badd9f5" {
  name = "AWSLambdaBasicExecutionRole-39f3a81c-5c0d-468f-ad3a-02141badd9f5"
  path = "/"
  
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "logs:CreateLogGroup",
            "Resource": "arn:aws:logs:us-east-2:126376345002:*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "logs:CreateLogStream",
                "logs:PutLogEvents"
            ],
            "Resource": [
                "arn:aws:logs:us-east-2:126376345002:log-group:/aws/lambda/le-lambda-edge-add-trailing-slash:*"
            ]
        }
    ]
})
}

# Auto-discovered custom policy: AWSCodePipelineFullAccess
resource "aws_iam_policy" "AWSCodePipelineFullAccess" {
  name = "AWSCodePipelineFullAccess"
  path = "/"
  
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "codepipeline:*",
                "s3:*",
                "cloudwatch:*",
                "codedeploy:*",
                "iam:PassRole"
            ],
            "Resource": "*"
        }
    ]
})
}

# Auto-discovered custom policy: AWSLambdaBasicExecutionRole-7e4fa9e6-b1a7-4ecb-84bf-61ef8b83487e
resource "aws_iam_policy" "AWSLambdaBasicExecutionRole_7e4fa9e6_b1a7_4ecb_84bf_61ef8b83487e" {
  name = "AWSLambdaBasicExecutionRole-7e4fa9e6-b1a7-4ecb-84bf-61ef8b83487e"
  path = "/"
  
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "logs:CreateLogGroup",
            "Resource": "arn:aws:logs:us-west-2:126376345002:*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "logs:CreateLogStream",
                "logs:PutLogEvents"
            ],
            "Resource": [
                "arn:aws:logs:us-west-2:126376345002:log-group:/aws/lambda/le-lambda-edge-trailing-slash:*"
            ]
        }
    ]
})
}

# Auto-discovered custom policy: dev-le-bluebird-lrs-inline
resource "aws_iam_policy" "dev_le_bluebird_lrs_inline" {
  name = "dev-le-bluebird-lrs-inline"
  path = "/"
  
  policy = jsonencode({
    "Statement": [
        {
            "Action": [
                "dynamodb:UpdateItem",
                "dynamodb:Scan",
                "dynamodb:Query",
                "dynamodb:PutItem",
                "dynamodb:GetItem",
                "dynamodb:DescribeTable",
                "dynamodb:DeleteItem"
            ],
            "Effect": "Allow",
            "Resource": [
                "arn:aws:dynamodb:us-west-2:126376345002:table/dev-le-bluebird-statements",
                "arn:aws:dynamodb:us-west-2:126376345002:table/dev-le-bluebird-activities-states"
            ],
            "Sid": "dynamodb"
        }
    ],
    "Version": "2012-10-17"
})
}

# Auto-discovered custom policy: staging-events-lrs-statements-policy
resource "aws_iam_policy" "staging_events_lrs_statements_policy" {
  name = "staging-events-lrs-statements-policy"
  path = "/"
  
  policy = jsonencode({
    "Statement": [
        {
            "Action": [
                "dynamodb:ListStreams",
                "dynamodb:GetShardIterator",
                "dynamodb:GetRecords",
                "dynamodb:DescribeStream"
            ],
            "Effect": "Allow",
            "Resource": "arn:aws:dynamodb:us-west-2:126376345002:table/staging-le-bluebird-statements/stream/2024-02-13T21:53:05.543"
        },
        {
            "Action": [
                "dynamodb:UpdateItem",
                "dynamodb:Scan",
                "dynamodb:Query",
                "dynamodb:PutItem",
                "dynamodb:GetItem",
                "dynamodb:DescribeTable",
                "dynamodb:DeleteItem"
            ],
            "Effect": "Allow",
            "Resource": [
                "arn:aws:dynamodb:us-west-2:126376345002:table/staging-le-bluebird-statements/index/*",
                "arn:aws:dynamodb:us-west-2:126376345002:table/staging-le-bluebird-statements",
                "arn:aws:dynamodb:us-west-2:126376345002:table/staging-le-bluebird-grades",
                "arn:aws:dynamodb:us-west-2:126376345002:table/staging-le-bluebird-course-completion",
                "arn:aws:dynamodb:us-west-2:126376345002:table/staging-le-bluebird-articulate-coures-mapping"
            ]
        }
    ],
    "Version": "2012-10-17"
})
}

# Auto-discovered custom policy: AWS-Chatbot-NotificationsOnly-Policy-2fd2e797-3bcb-4b7c-b7e8-0e3510182754
resource "aws_iam_policy" "AWS_Chatbot_NotificationsOnly_Policy_2fd2e797_3bcb_4b7c_b7e8_0e3510182754" {
  name = "AWS-Chatbot-NotificationsOnly-Policy-2fd2e797-3bcb-4b7c-b7e8-0e3510182754"
  path = "/"
  
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": [
                "cloudwatch:Describe*",
                "cloudwatch:Get*",
                "cloudwatch:List*"
            ],
            "Effect": "Allow",
            "Resource": "*"
        }
    ]
})
}

# Auto-discovered custom policy: VpcFlowLogsToSplunk-CloudWatch
resource "aws_iam_policy" "VpcFlowLogsToSplunk_CloudWatch" {
  name = "VpcFlowLogsToSplunk-CloudWatch"
  path = "/"
  
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "",
            "Effect": "Allow",
            "Action": "firehose:*",
            "Resource": "arn:aws:firehose:*:126376345002:deliverystream/VpcFlowLogsToSplunk-*"
        },
        {
            "Sid": "",
            "Effect": "Allow",
            "Action": "iam:PassRole",
            "Resource": "arn:aws:iam::126376345002:role/VpcFlowLogsToSplunk-CloudWatch"
        }
    ]
})
}

# Auto-discovered custom policy: AWSLambdaBasicExecutionRole-a4761653-4735-42c4-bd4d-71fd0e0d9a34
resource "aws_iam_policy" "AWSLambdaBasicExecutionRole_a4761653_4735_42c4_bd4d_71fd0e0d9a34" {
  name = "AWSLambdaBasicExecutionRole-a4761653-4735-42c4-bd4d-71fd0e0d9a34"
  path = "/"
  
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "logs:CreateLogGroup",
            "Resource": "arn:aws:logs:us-west-2:126376345002:*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "logs:CreateLogStream",
                "logs:PutLogEvents"
            ],
            "Resource": [
                "arn:aws:logs:us-west-2:126376345002:log-group:/aws/lambda/test-cognito-welcome-message:*"
            ]
        }
    ]
})
}

# Auto-discovered custom policy: qa-le-bluebird-api-policy
resource "aws_iam_policy" "qa_le_bluebird_api_policy" {
  name = "qa-le-bluebird-api-policy"
  path = "/"
  
  policy = jsonencode({
    "Statement": [
        {
            "Action": [
                "dynamodb:UpdateItem",
                "dynamodb:Scan",
                "dynamodb:Query",
                "dynamodb:PutItem",
                "dynamodb:GetItem",
                "dynamodb:DescribeTable",
                "dynamodb:DeleteItem"
            ],
            "Effect": "Allow",
            "Resource": [
                "arn:aws:dynamodb:us-west-2:126376345002:table/qa-le-bluebird-statements/index/*",
                "arn:aws:dynamodb:us-west-2:126376345002:table/qa-le-bluebird-statements",
                "arn:aws:dynamodb:us-west-2:126376345002:table/qa-le-bluebird-course-completion"
            ]
        },
        {
            "Action": [
                "secretsmanager:PutSecretValue",
                "secretsmanager:GetSecretValue"
            ],
            "Effect": "Allow",
            "Resource": "arn:aws:secretsmanager:us-west-2:126376345002:secret:*"
        },
        {
            "Action": [
                "s3:UploadPart",
                "s3:PutObject",
                "s3:ListBucket",
                "s3:GetObject",
                "s3:DeleteObject",
                "s3:CreateMultipartUpload",
                "s3:CompleteMultipartUpload",
                "s3:AbortMultipartUpload"
            ],
            "Effect": "Allow",
            "Resource": [
                "arn:aws:s3:::qa-le-bluebird-assets/*",
                "arn:aws:s3:::qa-le-bluebird-assets"
            ]
        }
    ],
    "Version": "2012-10-17"
})
}

# Auto-discovered custom policy: dev-lrs-xapi-policy
resource "aws_iam_policy" "dev_lrs_xapi_policy" {
  name = "dev-lrs-xapi-policy"
  path = "/"
  
  policy = jsonencode({
    "Statement": [
        {
            "Action": [
                "dynamodb:UpdateItem",
                "dynamodb:Scan",
                "dynamodb:Query",
                "dynamodb:PutItem",
                "dynamodb:GetItem",
                "dynamodb:DescribeTable",
                "dynamodb:DeleteItem"
            ],
            "Effect": "Allow",
            "Resource": [
                "arn:aws:dynamodb:us-west-2:126376345002:table/dev-le-bluebird-statements",
                "arn:aws:dynamodb:us-west-2:126376345002:table/dev-le-bluebird-activities-states"
            ]
        },
        {
            "Action": [
                "secretsmanager:PutSecretValue",
                "secretsmanager:GetSecretValue"
            ],
            "Effect": "Allow",
            "Resource": "arn:aws:secretsmanager:us-west-2:126376345002:secret:*"
        }
    ],
    "Version": "2012-10-17"
})
}

# Auto-discovered custom policy: dev-events-lrs-statements-policy
resource "aws_iam_policy" "dev_events_lrs_statements_policy" {
  name = "dev-events-lrs-statements-policy"
  path = "/"
  
  policy = jsonencode({
    "Statement": [
        {
            "Action": [
                "dynamodb:ListStreams",
                "dynamodb:GetShardIterator",
                "dynamodb:GetRecords",
                "dynamodb:DescribeStream"
            ],
            "Effect": "Allow",
            "Resource": "arn:aws:dynamodb:us-west-2:126376345002:table/dev-le-bluebird-statements/stream/2023-11-28T19:28:04.450"
        },
        {
            "Action": [
                "dynamodb:UpdateItem",
                "dynamodb:Scan",
                "dynamodb:Query",
                "dynamodb:PutItem",
                "dynamodb:GetItem",
                "dynamodb:DescribeTable",
                "dynamodb:DeleteItem"
            ],
            "Effect": "Allow",
            "Resource": [
                "arn:aws:dynamodb:us-west-2:126376345002:table/dev-le-bluebird-statements/index/*",
                "arn:aws:dynamodb:us-west-2:126376345002:table/dev-le-bluebird-statements",
                "arn:aws:dynamodb:us-west-2:126376345002:table/dev-le-bluebird-grades",
                "arn:aws:dynamodb:us-west-2:126376345002:table/dev-le-bluebird-course-completion",
                "arn:aws:dynamodb:us-west-2:126376345002:table/dev-le-bluebird-articulate-coures-mapping"
            ]
        }
    ],
    "Version": "2012-10-17"
})
}

# Auto-discovered custom policy: staging-cloudwatch-logging-policy
resource "aws_iam_policy" "staging_cloudwatch_logging_policy" {
  name = "staging-cloudwatch-logging-policy"
  path = "/"
  
  policy = jsonencode({
    "Statement": [
        {
            "Action": "logs:CreateLogGroup",
            "Effect": "Allow",
            "Resource": "arn:aws:logs:us-west-2:126376345002:*"
        },
        {
            "Action": [
                "logs:PutLogEvents",
                "logs:CreateLogStream"
            ],
            "Effect": "Allow",
            "Resource": "arn:aws:logs:us-west-2:126376345002:log-group:*:log-stream:*"
        }
    ],
    "Version": "2012-10-17"
})
}

# Auto-discovered custom policy: prod-lrs-xapi-policy
resource "aws_iam_policy" "prod_lrs_xapi_policy" {
  name = "prod-lrs-xapi-policy"
  path = "/"
  
  policy = jsonencode({
    "Statement": [
        {
            "Action": [
                "dynamodb:UpdateItem",
                "dynamodb:Scan",
                "dynamodb:Query",
                "dynamodb:PutItem",
                "dynamodb:GetItem",
                "dynamodb:DescribeTable",
                "dynamodb:DeleteItem"
            ],
            "Effect": "Allow",
            "Resource": [
                "arn:aws:dynamodb:us-west-2:126376345002:table/prod-le-bluebird-statements",
                "arn:aws:dynamodb:us-west-2:126376345002:table/prod-le-bluebird-activities-states"
            ]
        },
        {
            "Action": [
                "secretsmanager:PutSecretValue",
                "secretsmanager:GetSecretValue"
            ],
            "Effect": "Allow",
            "Resource": "arn:aws:secretsmanager:us-west-2:126376345002:secret:*"
        }
    ],
    "Version": "2012-10-17"
})
}

# Auto-discovered custom policy: CodeBuildBasePolicy-asu_grading_backend-us-west-1
resource "aws_iam_policy" "CodeBuildBasePolicy_asu_grading_backend_us_west_1" {
  name = "CodeBuildBasePolicy-asu_grading_backend-us-west-1"
  path = "/"
  
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": [
                "ecr:BatchCheckLayerAvailability",
                "ecr:CompleteLayerUpload",
                "ecr:GetAuthorizationToken",
                "ecr:InitiateLayerUpload",
                "ecr:PutImage",
                "ecr:UploadLayerPart"
            ],
            "Resource": "*",
            "Effect": "Allow"
        },
        {
            "Effect": "Allow",
            "Resource": [
                "arn:aws:logs:us-west-1:126376345002:log-group:/aws/codebuild/asu_grading_backend",
                "arn:aws:logs:us-west-1:126376345002:log-group:/aws/codebuild/asu_grading_backend:*"
            ],
            "Action": [
                "logs:CreateLogGroup",
                "logs:CreateLogStream",
                "logs:PutLogEvents"
            ]
        },
        {
            "Effect": "Allow",
            "Resource": [
                "*"
            ],
            "Action": [
                "s3:PutObject",
                "s3:GetObject",
                "s3:GetObjectVersion",
                "s3:GetBucketAcl",
                "s3:GetBucketLocation"
            ]
        },
        {
            "Effect": "Allow",
            "Resource": [
                "*"
            ],
            "Action": [
                "codecommit:GitPull"
            ]
        },
        {
            "Effect": "Allow",
            "Action": [
                "codebuild:CreateReportGroup",
                "codebuild:CreateReport",
                "codebuild:UpdateReport",
                "codebuild:BatchPutTestCases",
                "codebuild:BatchPutCodeCoverages"
            ],
            "Resource": [
                "arn:aws:codebuild:us-west-1:126376345002:report-group/asu_grading_backend-*"
            ]
        }
    ]
})
}

# Auto-discovered custom policy: AWSLambdaMicroserviceExecutionRole-6bc5a013-63e7-406e-b772-550444ce396e
resource "aws_iam_policy" "AWSLambdaMicroserviceExecutionRole_6bc5a013_63e7_406e_b772_550444ce396e" {
  name = "AWSLambdaMicroserviceExecutionRole-6bc5a013-63e7-406e-b772-550444ce396e"
  path = "/"
  
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "dynamodb:DeleteItem",
                "dynamodb:GetItem",
                "dynamodb:PutItem",
                "dynamodb:Scan",
                "dynamodb:UpdateItem"
            ],
            "Resource": "arn:aws:dynamodb:eu-west-2:126376345002:table/*"
        }
    ]
})
}

# Auto-discovered custom policy: AmplifySSRLoggingPolicy-e54ede65-2c17-4941-8ad1-c90c8d27b308
resource "aws_iam_policy" "AmplifySSRLoggingPolicy_e54ede65_2c17_4941_8ad1_c90c8d27b308" {
  name = "AmplifySSRLoggingPolicy-e54ede65-2c17-4941-8ad1-c90c8d27b308"
  path = "/"
  
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PushLogs",
            "Effect": "Allow",
            "Action": [
                "logs:CreateLogStream",
                "logs:PutLogEvents"
            ],
            "Resource": "arn:aws:logs:us-west-2:126376345002:log-group:/aws/amplify/*:log-stream:*"
        },
        {
            "Sid": "CreateLogGroup",
            "Effect": "Allow",
            "Action": "logs:CreateLogGroup",
            "Resource": "arn:aws:logs:us-west-2:126376345002:log-group:/aws/amplify/*"
        },
        {
            "Sid": "DescribeLogGroups",
            "Effect": "Allow",
            "Action": "logs:DescribeLogGroups",
            "Resource": "arn:aws:logs:us-west-2:126376345002:log-group:*"
        }
    ]
})
}

# Auto-discovered custom policy: SqsPipeTargetTemplate-ae975314
resource "aws_iam_policy" "SqsPipeTargetTemplate_ae975314" {
  name = "SqsPipeTargetTemplate-ae975314"
  path = "/"
  
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "sqs:SendMessage"
            ],
            "Resource": [
                "arn:aws:sqs:us-west-2:126376345002:ai-grader-NavigatedTo-CanvasCaliperEvent"
            ]
        }
    ]
})
}

# Auto-discovered custom policy: AWSLambdaBasicExecutionRole-9b939237-39cf-453a-a5f8-42946afddb3e
resource "aws_iam_policy" "AWSLambdaBasicExecutionRole_9b939237_39cf_453a_a5f8_42946afddb3e" {
  name = "AWSLambdaBasicExecutionRole-9b939237-39cf-453a-a5f8-42946afddb3e"
  path = "/"
  
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "logs:CreateLogGroup",
            "Resource": "arn:aws:logs:eu-west-2:126376345002:*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "logs:CreateLogStream",
                "logs:PutLogEvents"
            ],
            "Resource": [
                "arn:aws:logs:eu-west-2:126376345002:log-group:/aws/lambda/LMS_Read_Single_Entry:*"
            ]
        }
    ]
})
}

# Auto-discovered custom policy: AmplifySSRLoggingPolicy-4096b79f-3a6c-4c65-9cb2-1fc59057a951
resource "aws_iam_policy" "AmplifySSRLoggingPolicy_4096b79f_3a6c_4c65_9cb2_1fc59057a951" {
  name = "AmplifySSRLoggingPolicy-4096b79f-3a6c-4c65-9cb2-1fc59057a951"
  path = "/"
  
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PushLogs",
            "Effect": "Allow",
            "Action": [
                "logs:CreateLogStream",
                "logs:PutLogEvents"
            ],
            "Resource": "arn:aws:logs:us-west-2:126376345002:log-group:/aws/amplify/*:log-stream:*"
        },
        {
            "Sid": "CreateLogGroup",
            "Effect": "Allow",
            "Action": "logs:CreateLogGroup",
            "Resource": "arn:aws:logs:us-west-2:126376345002:log-group:/aws/amplify/*"
        },
        {
            "Sid": "DescribeLogGroups",
            "Effect": "Allow",
            "Action": "logs:DescribeLogGroups",
            "Resource": "arn:aws:logs:us-west-2:126376345002:log-group:*"
        }
    ]
})
}

# Auto-discovered custom policy: staging-events-course-mapping-policy
resource "aws_iam_policy" "staging_events_course_mapping_policy" {
  name = "staging-events-course-mapping-policy"
  path = "/"
  
  policy = jsonencode({
    "Statement": [
        {
            "Action": [
                "dynamodb:UpdateItem",
                "dynamodb:Scan",
                "dynamodb:Query",
                "dynamodb:PutItem",
                "dynamodb:GetItem",
                "dynamodb:DescribeTable",
                "dynamodb:DeleteItem"
            ],
            "Effect": "Allow",
            "Resource": "arn:aws:dynamodb:us-west-2:126376345002:table/staging-le-bluebird-articulate-coures-mapping"
        },
        {
            "Action": "s3:GetObject",
            "Effect": "Allow",
            "Resource": "arn:aws:s3:::staging-le-bluebird-assets"
        }
    ],
    "Version": "2012-10-17"
})
}

# Auto-discovered custom policy: AWSLambdaBasicExecutionRole-2a6a801d-b923-406c-a7b6-089a30191195
resource "aws_iam_policy" "AWSLambdaBasicExecutionRole_2a6a801d_b923_406c_a7b6_089a30191195" {
  name = "AWSLambdaBasicExecutionRole-2a6a801d-b923-406c-a7b6-089a30191195"
  path = "/"
  
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "logs:CreateLogGroup",
            "Resource": "arn:aws:logs:us-west-2:126376345002:*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "logs:CreateLogStream",
                "logs:PutLogEvents"
            ],
            "Resource": [
                "arn:aws:logs:us-west-2:126376345002:log-group:/aws/lambda/AIGrader-Submission_Creator:*"
            ]
        }
    ]
})
}

# Auto-discovered custom policy: AWSLambdaBasicExecutionRole-75b2e693-0898-4c91-a34d-22b3fdae84b0
resource "aws_iam_policy" "AWSLambdaBasicExecutionRole_75b2e693_0898_4c91_a34d_22b3fdae84b0" {
  name = "AWSLambdaBasicExecutionRole-75b2e693-0898-4c91-a34d-22b3fdae84b0"
  path = "/"
  
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "logs:CreateLogGroup",
            "Resource": "arn:aws:logs:us-west-2:126376345002:*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "logs:CreateLogStream",
                "logs:PutLogEvents"
            ],
            "Resource": [
                "arn:aws:logs:us-west-2:126376345002:log-group:/aws/lambda/100millionlearners-forwarding:*"
            ]
        }
    ]
})
}

# Auto-discovered custom policy: staging-publish-events-policy
resource "aws_iam_policy" "staging_publish_events_policy" {
  name = "staging-publish-events-policy"
  path = "/"
  
  policy = jsonencode({
    "Statement": [
        {
            "Action": [
                "dynamodb:ListStreams",
                "dynamodb:GetShardIterator",
                "dynamodb:GetRecords",
                "dynamodb:DescribeStream"
            ],
            "Effect": "Allow",
            "Resource": [
                "arn:aws:dynamodb:us-west-2:126376345002:table/staging-le-bluebird-grades/stream/2024-02-13T21:53:06.336",
                "arn:aws:dynamodb:us-west-2:126376345002:table/staging-le-bluebird-course-completion/stream/2024-02-13T21:53:05.515"
            ]
        },
        {
            "Action": [
                "dynamodb:UpdateItem",
                "dynamodb:Scan",
                "dynamodb:Query",
                "dynamodb:PutItem",
                "dynamodb:GetItem",
                "dynamodb:DescribeTable",
                "dynamodb:DeleteItem"
            ],
            "Effect": "Allow",
            "Resource": [
                "arn:aws:dynamodb:us-west-2:126376345002:table/staging-le-bluebird-statements/index/*",
                "arn:aws:dynamodb:us-west-2:126376345002:table/staging-le-bluebird-statements",
                "arn:aws:dynamodb:us-west-2:126376345002:table/staging-le-bluebird-grades",
                "arn:aws:dynamodb:us-west-2:126376345002:table/staging-le-bluebird-course-completion",
                "arn:aws:dynamodb:us-west-2:126376345002:table/staging-le-bluebird-articulate-coures-mapping",
                "arn:aws:dynamodb:us-west-2:126376345002:table/staging-le-bluebird-activities-states"
            ]
        },
        {
            "Action": "sns:Publish",
            "Effect": "Allow",
            "Resource": "arn:aws:sns:us-west-2:126376345002:staging-le-bluebird-events"
        }
    ],
    "Version": "2012-10-17"
})
}

# Auto-discovered custom policy: CustomInlinePolicy
resource "aws_iam_policy" "CustomInlinePolicy" {
  name = "CustomInlinePolicy"
  path = "/"
  
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "cloudformation:ListExports",
                "secretsmanager:DescribeSecret",
                "secretsmanager:PutSecretValue",
                "cloudformation:ListStackInstances",
                "cloudformation:DescribeChangeSetHooks",
                "lambda:GetFunctionConfiguration",
                "cloudformation:DescribeStackResource",
                "sns:CheckIfPhoneNumberIsOptedOut",
                "cloudformation:ListTypeRegistrations",
                "cloudformation:ListStackSetOperationResults",
                "secretsmanager:GetRandomPassword",
                "sns:ListEndpointsByPlatformApplication",
                "lambda:ListProvisionedConcurrencyConfigs",
                "cloudformation:DescribeStackEvents",
                "lambda:GetProvisionedConcurrencyConfig",
                "cloudformation:BatchDescribeTypeConfigurations",
                "lambda:ListLayerVersions",
                "lambda:ListLayers",
                "lambda:ListCodeSigningConfigs",
                "lambda:GetAlias",
                "cloudformation:DescribeChangeSet",
                "apigateway:GET",
                "cloudformation:ListStackResources",
                "sns:ListTagsForResource",
                "sns:ListSubscriptionsByTopic",
                "lambda:ListFunctions",
                "lambda:GetEventSourceMapping",
                "cloudformation:DescribeStackInstance",
                "lambda:ListAliases",
                "cloudformation:DescribeStackResources",
                "lambda:GetFunctionUrlConfig",
                "sns:GetPlatformApplicationAttributes",
                "sns:GetSubscriptionAttributes",
                "lambda:GetFunctionCodeSigningConfig",
                "cloudformation:DescribeStacks",
                "lambda:ListFunctionEventInvokeConfigs",
                "sns:GetEndpointAttributes",
                "cloudformation:DescribeStackResourceDrifts",
                "cloudformation:GetStackPolicy",
                "lambda:ListFunctionsByCodeSigningConfig",
                "lambda:GetFunctionConcurrency",
                "cloudformation:GetTemplate",
                "lambda:ListEventSourceMappings",
                "secretsmanager:ListSecrets",
                "cloudformation:ValidateTemplate",
                "sns:GetSMSAttributes",
                "cloudformation:ListTypeVersions",
                "cloudformation:DetectStackSetDrift",
                "cloudformation:DescribeStackDriftDetectionStatus",
                "cloudformation:DetectStackDrift",
                "lambda:ListVersionsByFunction",
                "lambda:GetLayerVersion",
                "cloudformation:ListStackSetOperations",
                "secretsmanager:CreateSecret",
                "cloudformation:ListTypes",
                "sns:ListTopics",
                "lambda:GetAccountSettings",
                "s3:ListBucket",
                "lambda:CreateEventSourceMapping",
                "lambda:GetLayerVersionPolicy",
                "secretsmanager:ListSecretVersionIds",
                "cloudformation:DetectStackResourceDrift",
                "cloudformation:EstimateTemplateCost",
                "secretsmanager:GetSecretValue",
                "lambda:ListTags",
                "cloudformation:DescribeStackSetOperation",
                "cloudformation:DescribeAccountLimits",
                "lambda:CreateCodeSigningConfig",
                "cloudformation:ListStacks",
                "cloudformation:DescribeType",
                "cloudformation:ListImports",
                "sns:GetTopicAttributes",
                "sns:ListSMSSandboxPhoneNumbers",
                "s3:ListAccessPoints",
                "lambda:GetFunction",
                "lambda:ListFunctionUrlConfigs",
                "sns:ListSubscriptions",
                "cloudformation:DescribePublisher",
                "cloudformation:DescribeTypeRegistration",
                "cloudformation:GetTemplateSummary",
                "sns:ListOriginationNumbers",
                "secretsmanager:GetResourcePolicy",
                "cloudformation:DescribeStackSet",
                "cloudformation:ListStackSets",
                "s3:ListAllMyBuckets",
                "sns:GetSMSSandboxAccountStatus",
                "lambda:GetFunctionEventInvokeConfig",
                "lambda:GetCodeSigningConfig",
                "lambda:GetPolicy",
                "cloudformation:ListChangeSets",
                "sns:ListPlatformApplications"
            ],
            "Resource": "*"
        },
        {
            "Sid": "VisualEditor1",
            "Effect": "Allow",
            "Action": [
                "lambda:CreateFunction",
                "lambda:PublishLayerVersion",
                "lambda:DeleteProvisionedConcurrencyConfig",
                "lambda:InvokeAsync",
                "lambda:PutFunctionConcurrency",
                "lambda:DeleteCodeSigningConfig",
                "sns:Publish",
                "lambda:DeleteLayerVersion",
                "lambda:PutFunctionEventInvokeConfig",
                "lambda:DeleteFunctionEventInvokeConfig",
                "lambda:DeleteFunction",
                "lambda:PutFunctionCodeSigningConfig",
                "lambda:UpdateFunctionUrlConfig",
                "lambda:CreateFunctionUrlConfig",
                "lambda:UpdateFunctionEventInvokeConfig",
                "lambda:DeleteFunctionCodeSigningConfig",
                "lambda:UpdateEventSourceMapping",
                "lambda:InvokeFunctionUrl",
                "lambda:UpdateFunctionCodeSigningConfig",
                "lambda:InvokeFunction",
                "lambda:UpdateFunctionConfiguration",
                "lambda:UpdateAlias",
                "lambda:UpdateCodeSigningConfig",
                "lambda:UpdateFunctionCode",
                "lambda:AddPermission",
                "lambda:PutProvisionedConcurrencyConfig",
                "lambda:DeleteAlias",
                "lambda:PublishVersion",
                "lambda:DeleteFunctionConcurrency",
                "lambda:DeleteEventSourceMapping",
                "lambda:DeleteFunctionUrlConfig",
                "lambda:CreateAlias"
            ],
            "Resource": [
                "arn:aws:lambda:us-west-2:126376345002:function:dev-*",
                "arn:aws:lambda:us-west-2:126376345002:function:le-*-dev-*",
                "arn:aws:sns:us-west-2:126376345002:*-le-studyhall-*"
            ]
        }
    ]
})
}

# Auto-discovered custom policy: AWSLambdaBasicExecutionRole-bb8603d8-1257-43db-866a-ae4ea59472c6
resource "aws_iam_policy" "AWSLambdaBasicExecutionRole_bb8603d8_1257_43db_866a_ae4ea59472c6" {
  name = "AWSLambdaBasicExecutionRole-bb8603d8-1257-43db-866a-ae4ea59472c6"
  path = "/"
  
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "logs:CreateLogGroup",
            "Resource": "arn:aws:logs:us-west-2:126376345002:*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "logs:CreateLogStream",
                "logs:PutLogEvents"
            ],
            "Resource": [
                "arn:aws:logs:us-west-2:126376345002:log-group:/aws/lambda/global-update-retention-policies-to-150-days:*"
            ]
        }
    ]
})
}

# Auto-discovered custom policy: CodeBuildBasePolicy-codebuild-aigrader-reconcilation-build-role-us-west-1
resource "aws_iam_policy" "CodeBuildBasePolicy_codebuild_aigrader_reconcilation_build_role_us_west_1" {
  name = "CodeBuildBasePolicy-codebuild-aigrader-reconcilation-build-role-us-west-1"
  path = "/"
  
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Resource": [
                "arn:aws:logs:us-west-1:126376345002:log-group:/aws/codebuild/AIGrader-Reconcilation",
                "arn:aws:logs:us-west-1:126376345002:log-group:/aws/codebuild/AIGrader-Reconcilation:*"
            ],
            "Action": [
                "logs:CreateLogGroup",
                "logs:CreateLogStream",
                "logs:PutLogEvents"
            ]
        },
        {
            "Effect": "Allow",
            "Resource": [
                "arn:aws:s3:::codepipeline-us-west-1-*"
            ],
            "Action": [
                "s3:PutObject",
                "s3:GetObject",
                "s3:GetObjectVersion",
                "s3:GetBucketAcl",
                "s3:GetBucketLocation"
            ]
        },
        {
            "Effect": "Allow",
            "Action": [
                "codebuild:CreateReportGroup",
                "codebuild:CreateReport",
                "codebuild:UpdateReport",
                "codebuild:BatchPutTestCases",
                "codebuild:BatchPutCodeCoverages"
            ],
            "Resource": [
                "arn:aws:codebuild:us-west-1:126376345002:report-group/AIGrader-Reconcilation-*"
            ]
        }
    ]
})
}

# Auto-discovered custom policy: AWS-Chatbot-NotificationsOnly-Policy-0396a36b-f751-46fb-b016-7df93e0b6ad2
resource "aws_iam_policy" "AWS_Chatbot_NotificationsOnly_Policy_0396a36b_f751_46fb_b016_7df93e0b6ad2" {
  name = "AWS-Chatbot-NotificationsOnly-Policy-0396a36b-f751-46fb-b016-7df93e0b6ad2"
  path = "/"
  
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": [
                "cloudwatch:Describe*",
                "cloudwatch:Get*",
                "cloudwatch:List*"
            ],
            "Effect": "Allow",
            "Resource": "*"
        }
    ]
})
}

# Auto-discovered custom policy: AmplifySSRLoggingPolicy-28164dc1-a184-4d02-a0df-72219862304e
resource "aws_iam_policy" "AmplifySSRLoggingPolicy_28164dc1_a184_4d02_a0df_72219862304e" {
  name = "AmplifySSRLoggingPolicy-28164dc1-a184-4d02-a0df-72219862304e"
  path = "/"
  
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PushLogs",
            "Effect": "Allow",
            "Action": [
                "logs:CreateLogStream",
                "logs:PutLogEvents"
            ],
            "Resource": "arn:aws:logs:us-west-2:126376345002:log-group:/aws/amplify/*:log-stream:*"
        },
        {
            "Sid": "CreateLogGroup",
            "Effect": "Allow",
            "Action": "logs:CreateLogGroup",
            "Resource": "arn:aws:logs:us-west-2:126376345002:log-group:/aws/amplify/*"
        },
        {
            "Sid": "DescribeLogGroups",
            "Effect": "Allow",
            "Action": "logs:DescribeLogGroups",
            "Resource": "arn:aws:logs:us-west-2:126376345002:log-group:*"
        }
    ]
})
}

# Auto-discovered custom policy: Amazon-EventBridge-Scheduler-Execution-Policy-ee2aa12b-9183-4f66-84c4-e0bf1a12eed0
resource "aws_iam_policy" "Amazon_EventBridge_Scheduler_Execution_Policy_ee2aa12b_9183_4f66_84c4_e0bf1a12eed0" {
  name = "Amazon-EventBridge-Scheduler-Execution-Policy-ee2aa12b-9183-4f66-84c4-e0bf1a12eed0"
  path = "/"
  
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "lambda:InvokeFunction"
            ],
            "Resource": [
                "arn:aws:lambda:us-west-2:126376345002:function:pelh-typesense-reindexer-scheduler:*",
                "arn:aws:lambda:us-west-2:126376345002:function:pelh-typesense-reindexer-scheduler"
            ]
        }
    ]
})
}

# Auto-discovered custom policy: VpcFlowLogsToSplunk-Lambda
resource "aws_iam_policy" "VpcFlowLogsToSplunk_Lambda" {
  name = "VpcFlowLogsToSplunk-Lambda"
  path = "/"
  
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "",
            "Effect": "Allow",
            "Action": "firehose:PutRecordBatch",
            "Resource": "arn:aws:firehose:*:126376345002:deliverystream/VpcFlowLogsToSplunk-*"
        },
        {
            "Sid": "",
            "Effect": "Allow",
            "Action": "logs:PutLogEvents",
            "Resource": "arn:aws:logs:*:126376345002:log-group:/aws/lambda/VpcFlowLogsToSplunk-*:*"
        },
        {
            "Sid": "",
            "Effect": "Allow",
            "Action": "logs:CreateLogStream",
            "Resource": "arn:aws:logs:*:126376345002:log-group:/aws/lambda/VpcFlowLogsToSplunk-*:log-stream:*"
        }
    ]
})
}

# Auto-discovered custom policy: dev-le-bluebird-lrs-logs
resource "aws_iam_policy" "dev_le_bluebird_lrs_logs" {
  name = "dev-le-bluebird-lrs-logs"
  path = "/"
  
  policy = jsonencode({
    "Statement": [
        {
            "Action": [
                "logs:PutLogEvents",
                "logs:CreateLogStream",
                "logs:CreateLogGroup"
            ],
            "Effect": "Allow",
            "Resource": [
                "arn:aws:logs:us-west-2:126376345002:log-group:/aws/lambda/dev-le-bluebird-lrs:*:*",
                "arn:aws:logs:us-west-2:126376345002:log-group:/aws/lambda/dev-le-bluebird-lrs:*"
            ]
        }
    ],
    "Version": "2012-10-17"
})
}

# Auto-discovered custom policy: CloudWatchSyntheticsPolicy-ulc-student-app-87d-d8b929022331
resource "aws_iam_policy" "CloudWatchSyntheticsPolicy_ulc_student_app_87d_d8b929022331" {
  name = "CloudWatchSyntheticsPolicy-ulc-student-app-87d-d8b929022331"
  path = "/"
  
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:PutObject",
                "s3:GetObject"
            ],
            "Resource": [
                "arn:aws:s3:::cw-syn-results-126376345002-us-west-2/canary/us-west-2/ulc-student-app-87d-d8b929022331/*",
                "arn:aws:s3:::cw-syn-results-126376345002-us-west-2/canary/us-west-2/le-careercatalyst-7ps-c49-d8b1be64174e/*"
            ]
        },
        {
            "Effect": "Allow",
            "Action": [
                "s3:GetBucketLocation"
            ],
            "Resource": [
                "arn:aws:s3:::cw-syn-results-126376345002-us-west-2"
            ]
        },
        {
            "Effect": "Allow",
            "Action": [
                "logs:CreateLogStream",
                "logs:PutLogEvents",
                "logs:CreateLogGroup"
            ],
            "Resource": [
                "arn:aws:logs:us-west-2:126376345002:log-group:/aws/lambda/cwsyn-ulc-student-app-*",
                "arn:aws:logs:us-west-2:126376345002:log-group:/aws/lambda/cwsyn-le-careercatalyst-7ps-*"
            ]
        },
        {
            "Effect": "Allow",
            "Action": [
                "s3:ListAllMyBuckets",
                "xray:PutTraceSegments"
            ],
            "Resource": [
                "*"
            ]
        },
        {
            "Effect": "Allow",
            "Resource": "*",
            "Action": "cloudwatch:PutMetricData",
            "Condition": {
                "StringEquals": {
                    "cloudwatch:namespace": "CloudWatchSynthetics"
                }
            }
        }
    ]
})
}

# Auto-discovered custom policy: prod-publish-events-policy
resource "aws_iam_policy" "prod_publish_events_policy" {
  name = "prod-publish-events-policy"
  path = "/"
  
  policy = jsonencode({
    "Statement": [
        {
            "Action": [
                "dynamodb:ListStreams",
                "dynamodb:GetShardIterator",
                "dynamodb:GetRecords",
                "dynamodb:DescribeStream"
            ],
            "Effect": "Allow",
            "Resource": [
                "arn:aws:dynamodb:us-west-2:126376345002:table/prod-le-bluebird-grades/stream/2024-02-14T01:20:53.239",
                "arn:aws:dynamodb:us-west-2:126376345002:table/prod-le-bluebird-course-completion/stream/2024-02-14T01:20:53.110"
            ]
        },
        {
            "Action": [
                "dynamodb:UpdateItem",
                "dynamodb:Scan",
                "dynamodb:Query",
                "dynamodb:PutItem",
                "dynamodb:GetItem",
                "dynamodb:DescribeTable",
                "dynamodb:DeleteItem"
            ],
            "Effect": "Allow",
            "Resource": [
                "arn:aws:dynamodb:us-west-2:126376345002:table/prod-le-bluebird-statements/index/*",
                "arn:aws:dynamodb:us-west-2:126376345002:table/prod-le-bluebird-statements",
                "arn:aws:dynamodb:us-west-2:126376345002:table/prod-le-bluebird-grades",
                "arn:aws:dynamodb:us-west-2:126376345002:table/prod-le-bluebird-course-completion",
                "arn:aws:dynamodb:us-west-2:126376345002:table/prod-le-bluebird-articulate-coures-mapping",
                "arn:aws:dynamodb:us-west-2:126376345002:table/prod-le-bluebird-activities-states"
            ]
        },
        {
            "Action": "sns:Publish",
            "Effect": "Allow",
            "Resource": "arn:aws:sns:us-west-2:126376345002:prod-le-bluebird-events"
        }
    ],
    "Version": "2012-10-17"
})
}

# Auto-discovered custom policy: AWSLoadBalancerControllerIAMPolicy-aether-eks-staging
resource "aws_iam_policy" "AWSLoadBalancerControllerIAMPolicy_aether_eks_staging" {
  name = "AWSLoadBalancerControllerIAMPolicy-aether-eks-staging"
  path = "/"
  
  policy = jsonencode({
    "Statement": [
        {
            "Action": [
                "iam:CreateServiceLinkedRole"
            ],
            "Condition": {
                "StringEquals": {
                    "iam:AWSServiceName": "elasticloadbalancing.amazonaws.com"
                }
            },
            "Effect": "Allow",
            "Resource": "*"
        },
        {
            "Action": [
                "ec2:DescribeAccountAttributes",
                "ec2:DescribeAddresses",
                "ec2:DescribeAvailabilityZones",
                "ec2:DescribeInternetGateways",
                "ec2:DescribeVpcs",
                "ec2:DescribeVpcPeeringConnections",
                "ec2:DescribeSubnets",
                "ec2:DescribeSecurityGroups",
                "ec2:DescribeInstances",
                "ec2:DescribeNetworkInterfaces",
                "ec2:DescribeTags",
                "ec2:GetCoipPoolUsage",
                "ec2:DescribeCoipPools",
                "ec2:GetSecurityGroupsForVpc",
                "ec2:DescribeIpamPools",
                "ec2:DescribeRouteTables",
                "elasticloadbalancing:DescribeLoadBalancers",
                "elasticloadbalancing:DescribeLoadBalancerAttributes",
                "elasticloadbalancing:DescribeListeners",
                "elasticloadbalancing:DescribeListenerCertificates",
                "elasticloadbalancing:DescribeSSLPolicies",
                "elasticloadbalancing:DescribeRules",
                "elasticloadbalancing:DescribeTargetGroups",
                "elasticloadbalancing:DescribeTargetGroupAttributes",
                "elasticloadbalancing:DescribeTargetHealth",
                "elasticloadbalancing:DescribeTags",
                "elasticloadbalancing:DescribeTrustStores",
                "elasticloadbalancing:DescribeListenerAttributes",
                "elasticloadbalancing:DescribeCapacityReservation"
            ],
            "Effect": "Allow",
            "Resource": "*"
        },
        {
            "Action": [
                "cognito-idp:DescribeUserPoolClient",
                "acm:ListCertificates",
                "acm:DescribeCertificate",
                "iam:ListServerCertificates",
                "iam:GetServerCertificate",
                "waf-regional:GetWebACL",
                "waf-regional:GetWebACLForResource",
                "waf-regional:AssociateWebACL",
                "waf-regional:DisassociateWebACL",
                "wafv2:GetWebACL",
                "wafv2:GetWebACLForResource",
                "wafv2:AssociateWebACL",
                "wafv2:DisassociateWebACL",
                "shield:GetSubscriptionState",
                "shield:DescribeProtection",
                "shield:CreateProtection",
                "shield:DeleteProtection"
            ],
            "Effect": "Allow",
            "Resource": "*"
        },
        {
            "Action": [
                "ec2:AuthorizeSecurityGroupIngress",
                "ec2:RevokeSecurityGroupIngress"
            ],
            "Effect": "Allow",
            "Resource": "*"
        },
        {
            "Action": [
                "ec2:CreateSecurityGroup"
            ],
            "Effect": "Allow",
            "Resource": "*"
        },
        {
            "Action": [
                "ec2:CreateTags"
            ],
            "Condition": {
                "Null": {
                    "aws:RequestTag/elbv2.k8s.aws/cluster": "false"
                },
                "StringEquals": {
                    "ec2:CreateAction": "CreateSecurityGroup"
                }
            },
            "Effect": "Allow",
            "Resource": "arn:aws:ec2:*:*:security-group/*"
        },
        {
            "Action": [
                "ec2:CreateTags",
                "ec2:DeleteTags"
            ],
            "Condition": {
                "Null": {
                    "aws:RequestTag/elbv2.k8s.aws/cluster": "true",
                    "aws:ResourceTag/elbv2.k8s.aws/cluster": "false"
                }
            },
            "Effect": "Allow",
            "Resource": "arn:aws:ec2:*:*:security-group/*"
        },
        {
            "Action": [
                "ec2:AuthorizeSecurityGroupIngress",
                "ec2:RevokeSecurityGroupIngress",
                "ec2:DeleteSecurityGroup"
            ],
            "Condition": {
                "Null": {
                    "aws:ResourceTag/elbv2.k8s.aws/cluster": "false"
                }
            },
            "Effect": "Allow",
            "Resource": "*"
        },
        {
            "Action": [
                "elasticloadbalancing:CreateLoadBalancer",
                "elasticloadbalancing:CreateTargetGroup"
            ],
            "Condition": {
                "Null": {
                    "aws:RequestTag/elbv2.k8s.aws/cluster": "false"
                }
            },
            "Effect": "Allow",
            "Resource": "*"
        },
        {
            "Action": [
                "elasticloadbalancing:CreateListener",
                "elasticloadbalancing:DeleteListener",
                "elasticloadbalancing:CreateRule",
                "elasticloadbalancing:DeleteRule"
            ],
            "Effect": "Allow",
            "Resource": "*"
        },
        {
            "Action": [
                "elasticloadbalancing:AddTags",
                "elasticloadbalancing:RemoveTags"
            ],
            "Condition": {
                "Null": {
                    "aws:RequestTag/elbv2.k8s.aws/cluster": "true",
                    "aws:ResourceTag/elbv2.k8s.aws/cluster": "false"
                }
            },
            "Effect": "Allow",
            "Resource": [
                "arn:aws:elasticloadbalancing:*:*:targetgroup/*/*",
                "arn:aws:elasticloadbalancing:*:*:loadbalancer/net/*/*",
                "arn:aws:elasticloadbalancing:*:*:loadbalancer/app/*/*"
            ]
        },
        {
            "Action": [
                "elasticloadbalancing:AddTags",
                "elasticloadbalancing:RemoveTags"
            ],
            "Effect": "Allow",
            "Resource": [
                "arn:aws:elasticloadbalancing:*:*:listener/net/*/*/*",
                "arn:aws:elasticloadbalancing:*:*:listener/app/*/*/*",
                "arn:aws:elasticloadbalancing:*:*:listener-rule/net/*/*/*",
                "arn:aws:elasticloadbalancing:*:*:listener-rule/app/*/*/*"
            ]
        },
        {
            "Action": [
                "elasticloadbalancing:ModifyLoadBalancerAttributes",
                "elasticloadbalancing:SetIpAddressType",
                "elasticloadbalancing:SetSecurityGroups",
                "elasticloadbalancing:SetSubnets",
                "elasticloadbalancing:DeleteLoadBalancer",
                "elasticloadbalancing:ModifyTargetGroup",
                "elasticloadbalancing:ModifyTargetGroupAttributes",
                "elasticloadbalancing:DeleteTargetGroup",
                "elasticloadbalancing:ModifyListenerAttributes",
                "elasticloadbalancing:ModifyCapacityReservation",
                "elasticloadbalancing:ModifyIpPools"
            ],
            "Condition": {
                "Null": {
                    "aws:ResourceTag/elbv2.k8s.aws/cluster": "false"
                }
            },
            "Effect": "Allow",
            "Resource": "*"
        },
        {
            "Action": [
                "elasticloadbalancing:AddTags"
            ],
            "Condition": {
                "Null": {
                    "aws:RequestTag/elbv2.k8s.aws/cluster": "false"
                },
                "StringEquals": {
                    "elasticloadbalancing:CreateAction": [
                        "CreateTargetGroup",
                        "CreateLoadBalancer"
                    ]
                }
            },
            "Effect": "Allow",
            "Resource": [
                "arn:aws:elasticloadbalancing:*:*:targetgroup/*/*",
                "arn:aws:elasticloadbalancing:*:*:loadbalancer/net/*/*",
                "arn:aws:elasticloadbalancing:*:*:loadbalancer/app/*/*"
            ]
        },
        {
            "Action": [
                "elasticloadbalancing:RegisterTargets",
                "elasticloadbalancing:DeregisterTargets"
            ],
            "Effect": "Allow",
            "Resource": "arn:aws:elasticloadbalancing:*:*:targetgroup/*/*"
        },
        {
            "Action": [
                "elasticloadbalancing:SetWebAcl",
                "elasticloadbalancing:ModifyListener",
                "elasticloadbalancing:AddListenerCertificates",
                "elasticloadbalancing:RemoveListenerCertificates",
                "elasticloadbalancing:ModifyRule",
                "elasticloadbalancing:SetRulePriorities"
            ],
            "Effect": "Allow",
            "Resource": "*"
        }
    ],
    "Version": "2012-10-17"
})
}

# Auto-discovered custom policy: AWSDC-Vended-DenySecrets
resource "aws_iam_policy" "AWSDC_Vended_DenySecrets" {
  name = "AWSDC-Vended-DenySecrets"
  path = "/"
  
  policy = jsonencode({
    "Statement": [
        {
            "Action": [
                "ssm:PutParameter",
                "ssm:GetParametersByPath",
                "ssm:GetParameters",
                "ssm:GetParameterHistory",
                "ssm:GetParameter",
                "ssm:DescribeParameters",
                "ssm:DeleteParameters",
                "ssm:DeleteParameter",
                "secretsmanager:*"
            ],
            "Effect": "Deny",
            "Resource": "*",
            "Sid": "DenySecrets"
        }
    ],
    "Version": "2012-10-17"
})
}

# Auto-discovered custom policy: prod-cloudwatch-logging-policy
resource "aws_iam_policy" "prod_cloudwatch_logging_policy" {
  name = "prod-cloudwatch-logging-policy"
  path = "/"
  
  policy = jsonencode({
    "Statement": [
        {
            "Action": "logs:CreateLogGroup",
            "Effect": "Allow",
            "Resource": "arn:aws:logs:us-west-2:126376345002:*"
        },
        {
            "Action": [
                "logs:PutLogEvents",
                "logs:CreateLogStream"
            ],
            "Effect": "Allow",
            "Resource": "arn:aws:logs:us-west-2:126376345002:log-group:*:log-stream:*"
        }
    ],
    "Version": "2012-10-17"
})
}

# Auto-discovered custom policy: AWSLambdaBasicExecutionRole-bdfa5b03-a0a3-4148-94a5-d3a12d1e4bac
resource "aws_iam_policy" "AWSLambdaBasicExecutionRole_bdfa5b03_a0a3_4148_94a5_d3a12d1e4bac" {
  name = "AWSLambdaBasicExecutionRole-bdfa5b03-a0a3-4148-94a5-d3a12d1e4bac"
  path = "/"
  
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "logs:CreateLogGroup",
            "Resource": "arn:aws:logs:us-east-1:126376345002:*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "logs:CreateLogStream",
                "logs:PutLogEvents"
            ],
            "Resource": [
                "arn:aws:logs:us-east-1:126376345002:log-group:/aws/lambda/le-lambda-edge-trailing-slash:*"
            ]
        }
    ]
})
}

# Auto-discovered custom policy: prod-le-bluebird-api-policy
resource "aws_iam_policy" "prod_le_bluebird_api_policy" {
  name = "prod-le-bluebird-api-policy"
  path = "/"
  
  policy = jsonencode({
    "Statement": [
        {
            "Action": [
                "dynamodb:UpdateItem",
                "dynamodb:Scan",
                "dynamodb:Query",
                "dynamodb:PutItem",
                "dynamodb:GetItem",
                "dynamodb:DescribeTable",
                "dynamodb:DeleteItem"
            ],
            "Effect": "Allow",
            "Resource": [
                "arn:aws:dynamodb:us-west-2:126376345002:table/prod-le-bluebird-statements/index/*",
                "arn:aws:dynamodb:us-west-2:126376345002:table/prod-le-bluebird-statements",
                "arn:aws:dynamodb:us-west-2:126376345002:table/prod-le-bluebird-course-completion"
            ]
        },
        {
            "Action": [
                "secretsmanager:PutSecretValue",
                "secretsmanager:GetSecretValue"
            ],
            "Effect": "Allow",
            "Resource": "arn:aws:secretsmanager:us-west-2:126376345002:secret:*"
        },
        {
            "Action": [
                "s3:UploadPart",
                "s3:PutObject",
                "s3:ListBucket",
                "s3:GetObject",
                "s3:DeleteObject",
                "s3:CreateMultipartUpload",
                "s3:CompleteMultipartUpload",
                "s3:AbortMultipartUpload"
            ],
            "Effect": "Allow",
            "Resource": [
                "arn:aws:s3:::prod-le-bluebird-assets/*",
                "arn:aws:s3:::prod-le-bluebird-assets"
            ]
        }
    ],
    "Version": "2012-10-17"
})
}

# Auto-discovered custom policy: LE-Developement-CC-100ML-Admin-Users
resource "aws_iam_policy" "LE_Developement_CC_100ML_Admin_Users" {
  name = "LE-Developement-CC-100ML-Admin-Users"
  path = "/"
  
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "dynamodb:DescribeContributorInsights",
                "dynamodb:RestoreTableToPointInTime",
                "dynamodb:UpdateGlobalTable",
                "dynamodb:UpdateTableReplicaAutoScaling",
                "dynamodb:DescribeTable",
                "dynamodb:PartiQLInsert",
                "dynamodb:GetItem",
                "dynamodb:DescribeContinuousBackups",
                "dynamodb:DescribeExport",
                "dynamodb:ListImports",
                "dynamodb:EnableKinesisStreamingDestination",
                "dynamodb:BatchGetItem",
                "dynamodb:DisableKinesisStreamingDestination",
                "dynamodb:UpdateTimeToLive",
                "dynamodb:BatchWriteItem",
                "dynamodb:PutItem",
                "dynamodb:PartiQLUpdate",
                "dynamodb:Scan",
                "dynamodb:StartAwsBackupJob",
                "dynamodb:UpdateItem",
                "dynamodb:UpdateGlobalTableSettings",
                "dynamodb:CreateTable",
                "dynamodb:RestoreTableFromAwsBackup",
                "dynamodb:GetShardIterator",
                "dynamodb:DescribeReservedCapacity",
                "dynamodb:ExportTableToPointInTime",
                "dynamodb:DescribeEndpoints",
                "dynamodb:DescribeBackup",
                "dynamodb:UpdateTable",
                "dynamodb:GetRecords",
                "dynamodb:DescribeTableReplicaAutoScaling",
                "dynamodb:DescribeImport",
                "dynamodb:ListTables",
                "dynamodb:DeleteItem",
                "dynamodb:PurchaseReservedCapacityOfferings",
                "dynamodb:CreateTableReplica",
                "dynamodb:ListTagsOfResource",
                "dynamodb:UpdateContributorInsights",
                "dynamodb:CreateBackup",
                "dynamodb:UpdateContinuousBackups",
                "dynamodb:DescribeReservedCapacityOfferings",
                "dynamodb:TagResource",
                "dynamodb:PartiQLSelect",
                "dynamodb:UpdateGlobalTableVersion",
                "dynamodb:CreateGlobalTable",
                "dynamodb:DescribeKinesisStreamingDestination",
                "dynamodb:DescribeLimits",
                "dynamodb:ImportTable",
                "dynamodb:ListExports",
                "dynamodb:UntagResource",
                "dynamodb:ConditionCheckItem",
                "dynamodb:ListBackups",
                "dynamodb:Query",
                "dynamodb:DescribeStream",
                "dynamodb:DeleteTableReplica",
                "dynamodb:DescribeTimeToLive",
                "dynamodb:ListStreams",
                "dynamodb:ListContributorInsights",
                "dynamodb:DescribeGlobalTableSettings",
                "dynamodb:ListGlobalTables",
                "dynamodb:DescribeGlobalTable",
                "dynamodb:RestoreTableFromBackup",
                "dynamodb:DeleteBackup",
                "dynamodb:PartiQLDelete"
            ],
            "Resource": "*"
        }
    ]
})
}

# Auto-discovered custom policy: staging-lrs-xapi-policy
resource "aws_iam_policy" "staging_lrs_xapi_policy" {
  name = "staging-lrs-xapi-policy"
  path = "/"
  
  policy = jsonencode({
    "Statement": [
        {
            "Action": [
                "dynamodb:UpdateItem",
                "dynamodb:Scan",
                "dynamodb:Query",
                "dynamodb:PutItem",
                "dynamodb:GetItem",
                "dynamodb:DescribeTable",
                "dynamodb:DeleteItem"
            ],
            "Effect": "Allow",
            "Resource": [
                "arn:aws:dynamodb:us-west-2:126376345002:table/staging-le-bluebird-statements",
                "arn:aws:dynamodb:us-west-2:126376345002:table/staging-le-bluebird-activities-states"
            ]
        },
        {
            "Action": [
                "secretsmanager:PutSecretValue",
                "secretsmanager:GetSecretValue"
            ],
            "Effect": "Allow",
            "Resource": "arn:aws:secretsmanager:us-west-2:126376345002:secret:*"
        }
    ],
    "Version": "2012-10-17"
})
}

# Auto-discovered custom policy: amplify-nuxtapp-brianlogan-sandbox-8ceb0cf857-data7552DF31-19AAY1OSNYLML-amplifyDataAuthRolePolicy01567A5654-FYNamnPNnrtW
resource "aws_iam_policy" "amplify_nuxtapp_brianlogan_sandbox_8ceb0cf857_data7552DF31_19AAY1OSNYLML_amplifyDataAuthRolePolicy01567A5654_FYNamnPNnrtW" {
  name = "amplify-nuxtapp-brianlogan-sandbox-8ceb0cf857-data7552DF31-19AAY1OSNYLML-amplifyDataAuthRolePolicy01567A5654-FYNamnPNnrtW"
  path = "/"
  
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "appsync:GraphQL",
            "Resource": [
                "arn:aws:appsync:us-west-2:126376345002:apis/cq7yecbg7zc3lpzvia3k4h6nmq/types/Todo/*",
                "arn:aws:appsync:us-west-2:126376345002:apis/cq7yecbg7zc3lpzvia3k4h6nmq/types/Query/fields/getTodo",
                "arn:aws:appsync:us-west-2:126376345002:apis/cq7yecbg7zc3lpzvia3k4h6nmq/types/Query/fields/listTodos",
                "arn:aws:appsync:us-west-2:126376345002:apis/cq7yecbg7zc3lpzvia3k4h6nmq/types/Mutation/fields/createTodo",
                "arn:aws:appsync:us-west-2:126376345002:apis/cq7yecbg7zc3lpzvia3k4h6nmq/types/Mutation/fields/updateTodo",
                "arn:aws:appsync:us-west-2:126376345002:apis/cq7yecbg7zc3lpzvia3k4h6nmq/types/Mutation/fields/deleteTodo",
                "arn:aws:appsync:us-west-2:126376345002:apis/cq7yecbg7zc3lpzvia3k4h6nmq/types/Subscription/fields/onCreateTodo",
                "arn:aws:appsync:us-west-2:126376345002:apis/cq7yecbg7zc3lpzvia3k4h6nmq/types/Subscription/fields/onUpdateTodo",
                "arn:aws:appsync:us-west-2:126376345002:apis/cq7yecbg7zc3lpzvia3k4h6nmq/types/Subscription/fields/onDeleteTodo"
            ],
            "Effect": "Allow"
        }
    ]
})
}

# Auto-discovered custom policy: amplify-nuxtapp-brianlogan-sandbox-8ceb0cf857-data7552DF31-19AAY1OSNYLML-amplifyDataUnauthRolePolicy01355B9DCF-AfuiUo1jBDnt
resource "aws_iam_policy" "amplify_nuxtapp_brianlogan_sandbox_8ceb0cf857_data7552DF31_19AAY1OSNYLML_amplifyDataUnauthRolePolicy01355B9DCF_AfuiUo1jBDnt" {
  name = "amplify-nuxtapp-brianlogan-sandbox-8ceb0cf857-data7552DF31-19AAY1OSNYLML-amplifyDataUnauthRolePolicy01355B9DCF-AfuiUo1jBDnt"
  path = "/"
  
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "appsync:GraphQL",
            "Resource": [
                "arn:aws:appsync:us-west-2:126376345002:apis/cq7yecbg7zc3lpzvia3k4h6nmq/types/Todo/*",
                "arn:aws:appsync:us-west-2:126376345002:apis/cq7yecbg7zc3lpzvia3k4h6nmq/types/Query/fields/getTodo",
                "arn:aws:appsync:us-west-2:126376345002:apis/cq7yecbg7zc3lpzvia3k4h6nmq/types/Query/fields/listTodos",
                "arn:aws:appsync:us-west-2:126376345002:apis/cq7yecbg7zc3lpzvia3k4h6nmq/types/Mutation/fields/createTodo",
                "arn:aws:appsync:us-west-2:126376345002:apis/cq7yecbg7zc3lpzvia3k4h6nmq/types/Mutation/fields/updateTodo",
                "arn:aws:appsync:us-west-2:126376345002:apis/cq7yecbg7zc3lpzvia3k4h6nmq/types/Mutation/fields/deleteTodo",
                "arn:aws:appsync:us-west-2:126376345002:apis/cq7yecbg7zc3lpzvia3k4h6nmq/types/Subscription/fields/onCreateTodo",
                "arn:aws:appsync:us-west-2:126376345002:apis/cq7yecbg7zc3lpzvia3k4h6nmq/types/Subscription/fields/onUpdateTodo",
                "arn:aws:appsync:us-west-2:126376345002:apis/cq7yecbg7zc3lpzvia3k4h6nmq/types/Subscription/fields/onDeleteTodo"
            ],
            "Effect": "Allow"
        }
    ]
})
}

# Auto-discovered custom policy: CloudwatchLogsOpenSearchDirectQueryAccess-1737186994629
resource "aws_iam_policy" "CloudwatchLogsOpenSearchDirectQueryAccess_1737186994629" {
  name = "CloudwatchLogsOpenSearchDirectQueryAccess-1737186994629"
  path = "/"
  
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "CloudWatchLogsAccess",
            "Effect": "Allow",
            "Action": [
                "logs:StartQuery",
                "logs:GetLogGroupFields",
                "logs:GetQueryResults"
            ],
            "Resource": [
                "arn:aws:logs:us-west-2:*:log-group:*"
            ]
        },
        {
            "Sid": "CloudWatchLogsDescribeLogGroupsAccess",
            "Effect": "Allow",
            "Action": [
                "logs:DescribeLogGroups"
            ],
            "Resource": "*"
        },
        {
            "Sid": "AmazonOpenSearchCollectionAccess",
            "Effect": "Allow",
            "Action": [
                "aoss:APIAccessAll"
            ],
            "Resource": "*",
            "Condition": {
                "StringLike": {
                    "aoss:collection": "cloudwatch-logs-*"
                }
            }
        }
    ]
})
}

# Auto-discovered custom policy: AWSLambdaBasicExecutionRole-a7c9cd6c-8818-46ed-8976-a49c3499abae
resource "aws_iam_policy" "AWSLambdaBasicExecutionRole_a7c9cd6c_8818_46ed_8976_a49c3499abae" {
  name = "AWSLambdaBasicExecutionRole-a7c9cd6c-8818-46ed-8976-a49c3499abae"
  path = "/"
  
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "logs:CreateLogGroup",
            "Resource": "arn:aws:logs:us-west-2:126376345002:*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "logs:CreateLogStream",
                "logs:PutLogEvents"
            ],
            "Resource": [
                "arn:aws:logs:us-west-2:126376345002:log-group:/aws/lambda/le-pelh-remove-linkedIn-access-token-from-dynamoDB:*"
            ]
        }
    ]
})
}

# Auto-discovered custom policy: Aether_S3_Admin
resource "aws_iam_policy" "Aether_S3_Admin" {
  name = "Aether_S3_Admin"
  path = "/"
  
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor1",
            "Effect": "Allow",
            "Action": "s3:*",
            "Resource": "arn:aws:s3:::aether.assets"
        }
    ]
})
}

# Auto-discovered custom policy: qa-events-lrs-statements-policy
resource "aws_iam_policy" "qa_events_lrs_statements_policy" {
  name = "qa-events-lrs-statements-policy"
  path = "/"
  
  policy = jsonencode({
    "Statement": [
        {
            "Action": [
                "dynamodb:ListStreams",
                "dynamodb:GetShardIterator",
                "dynamodb:GetRecords",
                "dynamodb:DescribeStream"
            ],
            "Effect": "Allow",
            "Resource": "arn:aws:dynamodb:us-west-2:126376345002:table/qa-le-bluebird-statements/stream/2023-12-07T11:54:51.017"
        },
        {
            "Action": [
                "dynamodb:UpdateItem",
                "dynamodb:Scan",
                "dynamodb:Query",
                "dynamodb:PutItem",
                "dynamodb:GetItem",
                "dynamodb:DescribeTable",
                "dynamodb:DeleteItem"
            ],
            "Effect": "Allow",
            "Resource": [
                "arn:aws:dynamodb:us-west-2:126376345002:table/qa-le-bluebird-statements/index/*",
                "arn:aws:dynamodb:us-west-2:126376345002:table/qa-le-bluebird-statements",
                "arn:aws:dynamodb:us-west-2:126376345002:table/qa-le-bluebird-grades",
                "arn:aws:dynamodb:us-west-2:126376345002:table/qa-le-bluebird-course-completion",
                "arn:aws:dynamodb:us-west-2:126376345002:table/qa-le-bluebird-articulate-coures-mapping"
            ]
        }
    ],
    "Version": "2012-10-17"
})
}

# Auto-discovered custom policy: AWSLambdaBasicExecutionRole-426d1d1e-59a1-4c1f-9d14-54d3587b0893
resource "aws_iam_policy" "AWSLambdaBasicExecutionRole_426d1d1e_59a1_4c1f_9d14_54d3587b0893" {
  name = "AWSLambdaBasicExecutionRole-426d1d1e-59a1-4c1f-9d14-54d3587b0893"
  path = "/"
  
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "logs:CreateLogGroup",
            "Resource": "arn:aws:logs:us-west-2:126376345002:*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "logs:CreateLogStream",
                "logs:PutLogEvents"
            ],
            "Resource": [
                "arn:aws:logs:us-west-2:126376345002:log-group:/aws/lambda/TestSNStoEdplusprod:*"
            ]
        }
    ]
})
}

# Auto-discovered custom policy: staging-le-bluebird-api-policy
resource "aws_iam_policy" "staging_le_bluebird_api_policy" {
  name = "staging-le-bluebird-api-policy"
  path = "/"
  
  policy = jsonencode({
    "Statement": [
        {
            "Action": [
                "dynamodb:UpdateItem",
                "dynamodb:Scan",
                "dynamodb:Query",
                "dynamodb:PutItem",
                "dynamodb:GetItem",
                "dynamodb:DescribeTable",
                "dynamodb:DeleteItem"
            ],
            "Effect": "Allow",
            "Resource": [
                "arn:aws:dynamodb:us-west-2:126376345002:table/staging-le-bluebird-statements/index/*",
                "arn:aws:dynamodb:us-west-2:126376345002:table/staging-le-bluebird-statements",
                "arn:aws:dynamodb:us-west-2:126376345002:table/staging-le-bluebird-course-completion"
            ]
        },
        {
            "Action": [
                "secretsmanager:PutSecretValue",
                "secretsmanager:GetSecretValue"
            ],
            "Effect": "Allow",
            "Resource": "arn:aws:secretsmanager:us-west-2:126376345002:secret:*"
        },
        {
            "Action": [
                "s3:UploadPart",
                "s3:PutObject",
                "s3:ListBucket",
                "s3:GetObject",
                "s3:DeleteObject",
                "s3:CreateMultipartUpload",
                "s3:CompleteMultipartUpload",
                "s3:AbortMultipartUpload"
            ],
            "Effect": "Allow",
            "Resource": [
                "arn:aws:s3:::staging-le-bluebird-assets/*",
                "arn:aws:s3:::staging-le-bluebird-assets"
            ]
        }
    ],
    "Version": "2012-10-17"
})
}

# Auto-discovered custom policy: AWSLambdaBasicExecutionRole-e5f0e9d0-3fb3-44b9-8e07-d61350a603d0
resource "aws_iam_policy" "AWSLambdaBasicExecutionRole_e5f0e9d0_3fb3_44b9_8e07_d61350a603d0" {
  name = "AWSLambdaBasicExecutionRole-e5f0e9d0-3fb3-44b9-8e07-d61350a603d0"
  path = "/"
  
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "logs:CreateLogGroup",
            "Resource": "arn:aws:logs:us-east-2:126376345002:*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "logs:CreateLogStream",
                "logs:PutLogEvents"
            ],
            "Resource": [
                "arn:aws:logs:us-east-2:126376345002:log-group:/aws/lambda/pelh-rewrite-default-index-request:*"
            ]
        }
    ]
})
}

# Auto-discovered custom policy: AmplifySSRLoggingPolicy-06abda26-82aa-4c89-bde2-df2baf84420f
resource "aws_iam_policy" "AmplifySSRLoggingPolicy_06abda26_82aa_4c89_bde2_df2baf84420f" {
  name = "AmplifySSRLoggingPolicy-06abda26-82aa-4c89-bde2-df2baf84420f"
  path = "/"
  
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PushLogs",
            "Effect": "Allow",
            "Action": [
                "logs:CreateLogStream",
                "logs:PutLogEvents"
            ],
            "Resource": "arn:aws:logs:us-west-2:126376345002:log-group:/aws/amplify/*:log-stream:*"
        },
        {
            "Sid": "CreateLogGroup",
            "Effect": "Allow",
            "Action": "logs:CreateLogGroup",
            "Resource": "arn:aws:logs:us-west-2:126376345002:log-group:/aws/amplify/*"
        },
        {
            "Sid": "DescribeLogGroups",
            "Effect": "Allow",
            "Action": "logs:DescribeLogGroups",
            "Resource": "arn:aws:logs:us-west-2:126376345002:log-group:*"
        }
    ]
})
}

# Auto-discovered custom policy: prod-events-course-mapping-policy
resource "aws_iam_policy" "prod_events_course_mapping_policy" {
  name = "prod-events-course-mapping-policy"
  path = "/"
  
  policy = jsonencode({
    "Statement": [
        {
            "Action": [
                "dynamodb:UpdateItem",
                "dynamodb:Scan",
                "dynamodb:Query",
                "dynamodb:PutItem",
                "dynamodb:GetItem",
                "dynamodb:DescribeTable",
                "dynamodb:DeleteItem"
            ],
            "Effect": "Allow",
            "Resource": "arn:aws:dynamodb:us-west-2:126376345002:table/prod-le-bluebird-articulate-coures-mapping"
        },
        {
            "Action": "s3:GetObject",
            "Effect": "Allow",
            "Resource": "arn:aws:s3:::prod-le-bluebird-assets"
        }
    ],
    "Version": "2012-10-17"
})
}

# Auto-discovered custom policy: dev-le-bluebird-api-policy
resource "aws_iam_policy" "dev_le_bluebird_api_policy" {
  name = "dev-le-bluebird-api-policy"
  path = "/"
  
  policy = jsonencode({
    "Statement": [
        {
            "Action": [
                "dynamodb:UpdateItem",
                "dynamodb:Scan",
                "dynamodb:Query",
                "dynamodb:PutItem",
                "dynamodb:GetItem",
                "dynamodb:DescribeTable",
                "dynamodb:DeleteItem"
            ],
            "Effect": "Allow",
            "Resource": [
                "arn:aws:dynamodb:us-west-2:126376345002:table/dev-le-bluebird-statements/index/*",
                "arn:aws:dynamodb:us-west-2:126376345002:table/dev-le-bluebird-statements",
                "arn:aws:dynamodb:us-west-2:126376345002:table/dev-le-bluebird-course-completion"
            ]
        },
        {
            "Action": [
                "secretsmanager:PutSecretValue",
                "secretsmanager:GetSecretValue"
            ],
            "Effect": "Allow",
            "Resource": "arn:aws:secretsmanager:us-west-2:126376345002:secret:*"
        },
        {
            "Action": [
                "s3:UploadPart",
                "s3:PutObject",
                "s3:ListBucket",
                "s3:GetObject",
                "s3:DeleteObject",
                "s3:CreateMultipartUpload",
                "s3:CompleteMultipartUpload",
                "s3:AbortMultipartUpload"
            ],
            "Effect": "Allow",
            "Resource": [
                "arn:aws:s3:::dev-le-bluebird-assets/*",
                "arn:aws:s3:::dev-le-bluebird-assets"
            ]
        }
    ],
    "Version": "2012-10-17"
})
}

# Auto-discovered custom policy: AWSLambdaBasicExecutionRole-1b06ff5b-0c17-48da-b979-99584d7d9b32
resource "aws_iam_policy" "AWSLambdaBasicExecutionRole_1b06ff5b_0c17_48da_b979_99584d7d9b32" {
  name = "AWSLambdaBasicExecutionRole-1b06ff5b-0c17-48da-b979-99584d7d9b32"
  path = "/"
  
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "logs:CreateLogGroup",
            "Resource": "arn:aws:logs:us-west-2:126376345002:*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "logs:CreateLogStream",
                "logs:PutLogEvents"
            ],
            "Resource": [
                "arn:aws:logs:us-west-2:126376345002:log-group:/aws/lambda/consume-bulk-upload:*"
            ]
        }
    ]
})
}

# Auto-discovered custom policy: CustomWriteToNonprodSQS
resource "aws_iam_policy" "CustomWriteToNonprodSQS" {
  name = "CustomWriteToNonprodSQS"
  path = "/"
  
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "sqs:DeleteMessage",
                "sqs:GetQueueUrl",
                "sqs:ListDeadLetterSourceQueues",
                "sqs:DeleteMessageBatch",
                "sqs:SendMessageBatch",
                "sqs:SendMessage",
                "sqs:GetQueueAttributes",
                "sqs:SetQueueAttributes"
            ],
            "Resource": [
                "arn:aws:sqs:us-west-2:126376345002:canvas-live-events-nonprod-asuce-beta-learning-enterprise",
                "arn:aws:sqs:us-west-2:126376345002:canvas-live-events-nonprod-asuce-beta-learning-enterprise-test-only"
            ]
        },
        {
            "Sid": "VisualEditor1",
            "Effect": "Allow",
            "Action": "sqs:ListQueues",
            "Resource": "*"
        }
    ]
})
}

# Auto-discovered custom policy: CodeBuildBasePolicy-afl2-aether-uw2-deploy-build-project-us-west-2
resource "aws_iam_policy" "CodeBuildBasePolicy_afl2_aether_uw2_deploy_build_project_us_west_2" {
  name = "CodeBuildBasePolicy-afl2-aether-uw2-deploy-build-project-us-west-2"
  path = "/"
  
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Resource": [
                "arn:aws:logs:us-west-2:126376345002:log-group:/aws/codebuild/afl2-aether-uw2-deploy-build-project",
                "arn:aws:logs:us-west-2:126376345002:log-group:/aws/codebuild/afl2-aether-uw2-deploy-build-project:*"
            ],
            "Action": [
                "logs:CreateLogGroup",
                "logs:CreateLogStream",
                "logs:PutLogEvents"
            ]
        },
        {
            "Effect": "Allow",
            "Resource": [
                "arn:aws:s3:::codepipeline-us-west-2-*"
            ],
            "Action": [
                "s3:PutObject",
                "s3:GetObject",
                "s3:GetObjectVersion",
                "s3:GetBucketAcl",
                "s3:GetBucketLocation"
            ]
        },
        {
            "Effect": "Allow",
            "Action": [
                "codebuild:CreateReportGroup",
                "codebuild:CreateReport",
                "codebuild:UpdateReport",
                "codebuild:BatchPutTestCases",
                "codebuild:BatchPutCodeCoverages"
            ],
            "Resource": [
                "arn:aws:codebuild:us-west-2:126376345002:report-group/afl2-aether-uw2-deploy-build-project-*"
            ]
        }
    ]
})
}

# Auto-discovered custom policy: ResourceGroupsTagSyncRole-5b583b12-b3ca-43ba-abc5-675baf948728
resource "aws_iam_policy" "ResourceGroupsTagSyncRole_5b583b12_b3ca_43ba_abc5_675baf948728" {
  name = "ResourceGroupsTagSyncRole-5b583b12-b3ca-43ba-abc5-675baf948728"
  path = "/"
  
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "resource-groups:UngroupResources",
                "resource-groups:GroupResources"
            ],
            "Resource": "*"
        }
    ]
})
}

# Auto-discovered custom policy: AWSLambdaBasicExecutionRole-37538e2b-b058-432f-873f-2203c0b3726a
resource "aws_iam_policy" "AWSLambdaBasicExecutionRole_37538e2b_b058_432f_873f_2203c0b3726a" {
  name = "AWSLambdaBasicExecutionRole-37538e2b-b058-432f-873f-2203c0b3726a"
  path = "/"
  
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "logs:CreateLogGroup",
            "Resource": "arn:aws:logs:us-east-1:126376345002:*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "logs:CreateLogStream",
                "logs:PutLogEvents"
            ],
            "Resource": [
                "arn:aws:logs:us-east-1:126376345002:log-group:/aws/lambda/le-ulc-cloud-function-remove-courses-path:*"
            ]
        }
    ]
})
}

# Auto-discovered custom policy: qa-cloudwatch-logging-policy
resource "aws_iam_policy" "qa_cloudwatch_logging_policy" {
  name = "qa-cloudwatch-logging-policy"
  path = "/"
  
  policy = jsonencode({
    "Statement": [
        {
            "Action": "logs:CreateLogGroup",
            "Effect": "Allow",
            "Resource": "arn:aws:logs:us-west-2:126376345002:*"
        },
        {
            "Action": [
                "logs:PutLogEvents",
                "logs:CreateLogStream"
            ],
            "Effect": "Allow",
            "Resource": "arn:aws:logs:us-west-2:126376345002:log-group:*:log-stream:*"
        }
    ],
    "Version": "2012-10-17"
})
}

# Auto-discovered custom policy: ServiceNowAWSIntegrationRolePolicy
resource "aws_iam_policy" "ServiceNowAWSIntegrationRolePolicy" {
  name = "ServiceNowAWSIntegrationRolePolicy"
  path = "/"
  
  policy = jsonencode({
    "Statement": [
        {
            "Action": [
                "tag:GetResources",
                "sns:List*",
                "sns:GetSubscriptionAttributes",
                "sns:GetEndpointAttributes",
                "sdb:GetAttributes",
                "s3:List*",
                "s3:GetBucket*",
                "s3:GetAccountPublicAccessBlock",
                "route53:List*",
                "route53:GetHostedZone",
                "redshift:Describe*",
                "rds:Describe*",
                "organizations:List*",
                "organizations:Describe*",
                "memorydb:Describe*",
                "lambda:List*",
                "lambda:Get*",
                "kinesisvideo:ListStreams",
                "kinesisanalytics:ListApplications",
                "kinesis:ListStreams",
                "kinesis:DescribeStream",
                "firehose:ListDeliveryStreams",
                "firehose:DescribeDeliveryStream",
                "es:ListDomainNames",
                "elasticloadbalancing:Describe*",
                "elasticfilesystem:Describe*",
                "elasticache:List*",
                "elasticache:Describe*",
                "eks:List*",
                "eks:Describe*",
                "ecs:List*",
                "ecs:Describe*",
                "ec2:ReportInstanceStatus",
                "ec2:Describe*",
                "dynamodb:ListTables",
                "dynamodb:ListGlobalTables",
                "dynamodb:Describe*",
                "config:ListDiscoveredResources",
                "cognito-idp:ListUserPools",
                "cloudwatch:List*",
                "cloudwatch:Get*",
                "cloudformation:List*",
                "cloudformation:Describe*",
                "autoscaling:Describe*",
                "autoscaling-plans:Describe*",
                "application-autoscaling:Describe*",
                "apigateway:GET",
                "account:ListRegions"
            ],
            "Effect": "Allow",
            "Resource": "*",
            "Sid": "SNOWDiscovery"
        }
    ],
    "Version": "2012-10-17"
})
}

# Auto-discovered custom policy: aitranscript-s3-access-policy
resource "aws_iam_policy" "aitranscript_s3_access_policy" {
  name = "aitranscript-s3-access-policy"
  path = "/"
  
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:ListAllMyBuckets"
            ],
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "s3:ListBucket",
                "s3:GetBucketLocation"
            ],
            "Resource": "arn:aws:s3:::aitranscript-*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "s3:PutObject",
                "s3:GetObject",
                "s3:DeleteObject",
                "s3:ListMultipartUploadParts",
                "s3:AbortMultipartUpload"
            ],
            "Resource": "arn:aws:s3:::aitranscript-*/*"
        }
    ]
})
}

# Auto-discovered custom policy: qa-publish-events-policy
resource "aws_iam_policy" "qa_publish_events_policy" {
  name = "qa-publish-events-policy"
  path = "/"
  
  policy = jsonencode({
    "Statement": [
        {
            "Action": [
                "dynamodb:ListStreams",
                "dynamodb:GetShardIterator",
                "dynamodb:GetRecords",
                "dynamodb:DescribeStream"
            ],
            "Effect": "Allow",
            "Resource": [
                "arn:aws:dynamodb:us-west-2:126376345002:table/qa-le-bluebird-grades/stream/2024-01-17T23:48:02.288",
                "arn:aws:dynamodb:us-west-2:126376345002:table/qa-le-bluebird-course-completion/stream/2024-01-17T23:48:02.296"
            ]
        },
        {
            "Action": [
                "dynamodb:UpdateItem",
                "dynamodb:Scan",
                "dynamodb:Query",
                "dynamodb:PutItem",
                "dynamodb:GetItem",
                "dynamodb:DescribeTable",
                "dynamodb:DeleteItem"
            ],
            "Effect": "Allow",
            "Resource": [
                "arn:aws:dynamodb:us-west-2:126376345002:table/qa-le-bluebird-statements/index/*",
                "arn:aws:dynamodb:us-west-2:126376345002:table/qa-le-bluebird-statements",
                "arn:aws:dynamodb:us-west-2:126376345002:table/qa-le-bluebird-grades",
                "arn:aws:dynamodb:us-west-2:126376345002:table/qa-le-bluebird-course-completion",
                "arn:aws:dynamodb:us-west-2:126376345002:table/qa-le-bluebird-articulate-coures-mapping",
                "arn:aws:dynamodb:us-west-2:126376345002:table/qa-le-bluebird-activities-states"
            ]
        },
        {
            "Action": "sns:Publish",
            "Effect": "Allow",
            "Resource": "arn:aws:sns:us-west-2:126376345002:qa-le-bluebird-events"
        }
    ],
    "Version": "2012-10-17"
})
}

# Auto-discovered custom policy: Amazon-EventBridge-Scheduler-Execution-Policy-50568945-32c3-41ed-967d-6e3d421cfa95
resource "aws_iam_policy" "Amazon_EventBridge_Scheduler_Execution_Policy_50568945_32c3_41ed_967d_6e3d421cfa95" {
  name = "Amazon-EventBridge-Scheduler-Execution-Policy-50568945-32c3-41ed-967d-6e3d421cfa95"
  path = "/"
  
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "lambda:InvokeFunction"
            ],
            "Resource": [
                "arn:aws:lambda:us-west-2:126376345002:function:le-pelh-remove-linkedIn-access-token-from-dynamoDB:*",
                "arn:aws:lambda:us-west-2:126376345002:function:le-pelh-remove-linkedIn-access-token-from-dynamoDB"
            ]
        }
    ]
})
}

# Auto-discovered custom policy: AWSLambdaBasicExecutionRole-b36530fd-c068-4a59-b779-f4a7d0ebd9c5
resource "aws_iam_policy" "AWSLambdaBasicExecutionRole_b36530fd_c068_4a59_b779_f4a7d0ebd9c5" {
  name = "AWSLambdaBasicExecutionRole-b36530fd-c068-4a59-b779-f4a7d0ebd9c5"
  path = "/"
  
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "logs:CreateLogGroup",
            "Resource": "arn:aws:logs:us-west-2:126376345002:*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "logs:CreateLogStream",
                "logs:PutLogEvents"
            ],
            "Resource": [
                "arn:aws:logs:us-west-2:126376345002:log-group:/aws/lambda/le-pelh-linkedin-img-convertor:*"
            ]
        }
    ]
})
}

# Auto-discovered custom policy: AWSCodePipelineServiceRole-us-west-1-asu-grading-backend
resource "aws_iam_policy" "AWSCodePipelineServiceRole_us_west_1_asu_grading_backend" {
  name = "AWSCodePipelineServiceRole-us-west-1-asu-grading-backend"
  path = "/"
  
  policy = jsonencode({
    "Statement": [
        {
            "Action": [
                "iam:PassRole"
            ],
            "Resource": "*",
            "Effect": "Allow",
            "Condition": {
                "StringEqualsIfExists": {
                    "iam:PassedToService": [
                        "cloudformation.amazonaws.com",
                        "elasticbeanstalk.amazonaws.com",
                        "ec2.amazonaws.com",
                        "ecs-tasks.amazonaws.com"
                    ]
                }
            }
        },
        {
            "Action": [
                "codecommit:CancelUploadArchive",
                "codecommit:GetBranch",
                "codecommit:GetCommit",
                "codecommit:GetRepository",
                "codecommit:GetUploadArchiveStatus",
                "codecommit:UploadArchive"
            ],
            "Resource": "*",
            "Effect": "Allow"
        },
        {
            "Action": [
                "codedeploy:CreateDeployment",
                "codedeploy:GetApplication",
                "codedeploy:GetApplicationRevision",
                "codedeploy:GetDeployment",
                "codedeploy:GetDeploymentConfig",
                "codedeploy:RegisterApplicationRevision"
            ],
            "Resource": "*",
            "Effect": "Allow"
        },
        {
            "Action": [
                "codestar-connections:UseConnection"
            ],
            "Resource": "*",
            "Effect": "Allow"
        },
        {
            "Action": [
                "elasticbeanstalk:*",
                "ec2:*",
                "elasticloadbalancing:*",
                "autoscaling:*",
                "cloudwatch:*",
                "s3:*",
                "sns:*",
                "cloudformation:*",
                "rds:*",
                "sqs:*",
                "ecs:*"
            ],
            "Resource": "*",
            "Effect": "Allow"
        },
        {
            "Action": [
                "lambda:InvokeFunction",
                "lambda:ListFunctions"
            ],
            "Resource": "*",
            "Effect": "Allow"
        },
        {
            "Action": [
                "opsworks:CreateDeployment",
                "opsworks:DescribeApps",
                "opsworks:DescribeCommands",
                "opsworks:DescribeDeployments",
                "opsworks:DescribeInstances",
                "opsworks:DescribeStacks",
                "opsworks:UpdateApp",
                "opsworks:UpdateStack"
            ],
            "Resource": "*",
            "Effect": "Allow"
        },
        {
            "Action": [
                "cloudformation:CreateStack",
                "cloudformation:DeleteStack",
                "cloudformation:DescribeStacks",
                "cloudformation:UpdateStack",
                "cloudformation:CreateChangeSet",
                "cloudformation:DeleteChangeSet",
                "cloudformation:DescribeChangeSet",
                "cloudformation:ExecuteChangeSet",
                "cloudformation:SetStackPolicy",
                "cloudformation:ValidateTemplate"
            ],
            "Resource": "*",
            "Effect": "Allow"
        },
        {
            "Action": [
                "codebuild:BatchGetBuilds",
                "codebuild:StartBuild",
                "codebuild:BatchGetBuildBatches",
                "codebuild:StartBuildBatch"
            ],
            "Resource": "*",
            "Effect": "Allow"
        },
        {
            "Effect": "Allow",
            "Action": [
                "devicefarm:ListProjects",
                "devicefarm:ListDevicePools",
                "devicefarm:GetRun",
                "devicefarm:GetUpload",
                "devicefarm:CreateUpload",
                "devicefarm:ScheduleRun"
            ],
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "servicecatalog:ListProvisioningArtifacts",
                "servicecatalog:CreateProvisioningArtifact",
                "servicecatalog:DescribeProvisioningArtifact",
                "servicecatalog:DeleteProvisioningArtifact",
                "servicecatalog:UpdateProduct"
            ],
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "cloudformation:ValidateTemplate"
            ],
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "ecr:DescribeImages"
            ],
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "states:DescribeExecution",
                "states:DescribeStateMachine",
                "states:StartExecution"
            ],
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "appconfig:StartDeployment",
                "appconfig:StopDeployment",
                "appconfig:GetDeployment"
            ],
            "Resource": "*"
        }
    ],
    "Version": "2012-10-17"
})
}

# Auto-discovered custom policy: qa-events-course-mapping-policy
resource "aws_iam_policy" "qa_events_course_mapping_policy" {
  name = "qa-events-course-mapping-policy"
  path = "/"
  
  policy = jsonencode({
    "Statement": [
        {
            "Action": [
                "dynamodb:UpdateItem",
                "dynamodb:Scan",
                "dynamodb:Query",
                "dynamodb:PutItem",
                "dynamodb:GetItem",
                "dynamodb:DescribeTable",
                "dynamodb:DeleteItem"
            ],
            "Effect": "Allow",
            "Resource": "arn:aws:dynamodb:us-west-2:126376345002:table/qa-le-bluebird-articulate-coures-mapping"
        },
        {
            "Action": "s3:GetObject",
            "Effect": "Allow",
            "Resource": "arn:aws:s3:::qa-le-bluebird-assets"
        }
    ],
    "Version": "2012-10-17"
})
}

# Auto-discovered custom policy: AWSLambdaBasicExecutionRole-c2d860f4-9e5e-444b-bd54-8fea76df262c
resource "aws_iam_policy" "AWSLambdaBasicExecutionRole_c2d860f4_9e5e_444b_bd54_8fea76df262c" {
  name = "AWSLambdaBasicExecutionRole-c2d860f4-9e5e-444b-bd54-8fea76df262c"
  path = "/"
  
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "logs:CreateLogGroup",
            "Resource": "arn:aws:logs:us-west-2:126376345002:*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "logs:CreateLogStream",
                "logs:PutLogEvents"
            ],
            "Resource": [
                "arn:aws:logs:us-west-2:126376345002:log-group:/aws/lambda/AI-Grader-Test:*"
            ]
        }
    ]
})
}

# Auto-discovered custom policy: AWSLambdaBasicExecutionRole-fa48e1fb-1c94-46e6-917b-9496eb47434a
resource "aws_iam_policy" "AWSLambdaBasicExecutionRole_fa48e1fb_1c94_46e6_917b_9496eb47434a" {
  name = "AWSLambdaBasicExecutionRole-fa48e1fb-1c94-46e6-917b-9496eb47434a"
  path = "/"
  
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "logs:CreateLogGroup",
            "Resource": "arn:aws:logs:us-west-2:126376345002:*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "logs:CreateLogStream",
                "logs:PutLogEvents"
            ],
            "Resource": [
                "arn:aws:logs:us-west-2:126376345002:log-group:/aws/lambda/pelh-typesense-reindexer-scheduler:*"
            ]
        }
    ]
})
}

# Auto-discovered custom policy: amplify-d1p24pvuitvmhb-amplifytest-branch-9a60fb9e10-data7552DF31-1G7QNNODGXI-amplifyDataUnauthRolePolicy01355B9DCF-eZqbZ7V9fSQn
resource "aws_iam_policy" "amplify_d1p24pvuitvmhb_amplifytest_branch_9a60fb9e10_data7552DF31_1G7QNNODGXI_amplifyDataUnauthRolePolicy01355B9DCF_eZqbZ7V9fSQn" {
  name = "amplify-d1p24pvuitvmhb-amplifytest-branch-9a60fb9e10-data7552DF31-1G7QNNODGXI-amplifyDataUnauthRolePolicy01355B9DCF-eZqbZ7V9fSQn"
  path = "/"
  
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "appsync:GraphQL",
            "Resource": [
                "arn:aws:appsync:us-west-2:126376345002:apis/tejofvuhgjdpviwqgx3f4a2mqy/types/Todo/*",
                "arn:aws:appsync:us-west-2:126376345002:apis/tejofvuhgjdpviwqgx3f4a2mqy/types/Query/fields/getTodo",
                "arn:aws:appsync:us-west-2:126376345002:apis/tejofvuhgjdpviwqgx3f4a2mqy/types/Query/fields/listTodos",
                "arn:aws:appsync:us-west-2:126376345002:apis/tejofvuhgjdpviwqgx3f4a2mqy/types/Mutation/fields/createTodo",
                "arn:aws:appsync:us-west-2:126376345002:apis/tejofvuhgjdpviwqgx3f4a2mqy/types/Mutation/fields/updateTodo",
                "arn:aws:appsync:us-west-2:126376345002:apis/tejofvuhgjdpviwqgx3f4a2mqy/types/Mutation/fields/deleteTodo",
                "arn:aws:appsync:us-west-2:126376345002:apis/tejofvuhgjdpviwqgx3f4a2mqy/types/Subscription/fields/onCreateTodo",
                "arn:aws:appsync:us-west-2:126376345002:apis/tejofvuhgjdpviwqgx3f4a2mqy/types/Subscription/fields/onUpdateTodo",
                "arn:aws:appsync:us-west-2:126376345002:apis/tejofvuhgjdpviwqgx3f4a2mqy/types/Subscription/fields/onDeleteTodo"
            ],
            "Effect": "Allow"
        }
    ]
})
}

# Auto-discovered custom policy: qa-lrs-xapi-policy
resource "aws_iam_policy" "qa_lrs_xapi_policy" {
  name = "qa-lrs-xapi-policy"
  path = "/"
  
  policy = jsonencode({
    "Statement": [
        {
            "Action": [
                "dynamodb:UpdateItem",
                "dynamodb:Scan",
                "dynamodb:Query",
                "dynamodb:PutItem",
                "dynamodb:GetItem",
                "dynamodb:DescribeTable",
                "dynamodb:DeleteItem"
            ],
            "Effect": "Allow",
            "Resource": [
                "arn:aws:dynamodb:us-west-2:126376345002:table/qa-le-bluebird-statements",
                "arn:aws:dynamodb:us-west-2:126376345002:table/qa-le-bluebird-activities-states"
            ]
        },
        {
            "Action": [
                "secretsmanager:PutSecretValue",
                "secretsmanager:GetSecretValue"
            ],
            "Effect": "Allow",
            "Resource": "arn:aws:secretsmanager:us-west-2:126376345002:secret:*"
        }
    ],
    "Version": "2012-10-17"
})
}

# Auto-discovered custom policy: VpcFlowLogsToSplunk-Firehose
resource "aws_iam_policy" "VpcFlowLogsToSplunk_Firehose" {
  name = "VpcFlowLogsToSplunk-Firehose"
  path = "/"
  
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "",
            "Effect": "Allow",
            "Action": [
                "s3:PutObject",
                "s3:ListBucketMultipartUploads",
                "s3:ListBucket",
                "s3:GetObject",
                "s3:GetBucketLocation",
                "s3:AbortMultipartUpload"
            ],
            "Resource": [
                "arn:aws:s3:::vpc-flow-logs-to-splunk-*/*",
                "arn:aws:s3:::vpc-flow-logs-to-splunk-*"
            ]
        },
        {
            "Sid": "",
            "Effect": "Allow",
            "Action": [
                "lambda:InvokeFunction",
                "lambda:GetFunctionConfiguration"
            ],
            "Resource": "arn:aws:lambda:*:126376345002:function:VpcFlowLogsToSplunk-*:$LATEST"
        },
        {
            "Sid": "",
            "Effect": "Allow",
            "Action": "logs:PutLogEvents",
            "Resource": [
                "arn:aws:logs:*:126376345002:log-group:/aws/kinesisfirehose/VpcFlowLogsToSplunk-*:log-stream:delivery",
                "arn:aws:logs:*:126376345002:log-group:/aws/kinesisfirehose/VpcFlowLogsToSplunk-*:*"
            ]
        }
    ]
})
}

# Auto-discovered custom policy: CustomAWSApiGatewayPublishEvents
resource "aws_iam_policy" "CustomAWSApiGatewayPublishEvents" {
  name = "CustomAWSApiGatewayPublishEvents"
  path = "/"
  
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "execute-api:Invoke",
                "apigateway:GET"
            ],
            "Resource": [
                "arn:aws:execute-api:us-west-2:126376345002:2npij2rsy4/dev/POST/events/publish",
                "arn:aws:execute-api:us-west-2:126376345002:xo66el58yi/prod/POST/events/publish",
                "arn:aws:apigateway:us-west-2::/apis/2npij2rsy4/resources/i4wej8/methods/POST",
                "arn:aws:apigateway:us-west-2::/apis/xo66el58yi/resources/m97lor/methods/POST"
            ]
        }
    ]
})
}

# Auto-discovered custom policy: CognitoTestAccessPolicyLE
resource "aws_iam_policy" "CognitoTestAccessPolicyLE" {
  name = "CognitoTestAccessPolicyLE"
  path = "/"
  
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "cognito-idp:AdminDeleteUser",
                "cognito-idp:AdminUserGlobalSignOut",
                "cognito-idp:AdminEnableUser",
                "cognito-idp:ListGroups",
                "cognito-idp:AdminCreateUser",
                "cognito-idp:AdminDisableUser",
                "cognito-idp:AdminSetUserPassword",
                "cognito-idp:AdminListGroupsForUser",
                "cognito-idp:AdminUpdateUserAttributes",
                "cognito-idp:AdminGetUser",
                "cognito-idp:AdminConfirmSignUp"
            ],
            "Resource": "arn:aws:cognito-idp:us-west-2:126376345002:userpool/us-west-2_uEITQxO6k"
        },
        {
            "Sid": "VisualEditor1",
            "Effect": "Allow",
            "Action": [
                "cognito-idp:GlobalSignOut",
                "cognito-idp:GetUser",
                "cognito-idp:SignUp",
                "cognito-idp:ListDevices"
            ],
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "sts:AssumeRole"
            ],
            "Resource": [
                "arn:aws:iam::460413214814:role/service-role/test-cross-account-cognito-role-z4ghs59r"
            ]
        }
    ]
})
}

# Auto-discovered custom policy: dev-events-course-mapping-policy
resource "aws_iam_policy" "dev_events_course_mapping_policy" {
  name = "dev-events-course-mapping-policy"
  path = "/"
  
  policy = jsonencode({
    "Statement": [
        {
            "Action": [
                "dynamodb:UpdateItem",
                "dynamodb:Scan",
                "dynamodb:Query",
                "dynamodb:PutItem",
                "dynamodb:GetItem",
                "dynamodb:DescribeTable",
                "dynamodb:DeleteItem"
            ],
            "Effect": "Allow",
            "Resource": "arn:aws:dynamodb:us-west-2:126376345002:table/dev-le-bluebird-articulate-coures-mapping"
        },
        {
            "Action": "s3:GetObject",
            "Effect": "Allow",
            "Resource": "arn:aws:s3:::dev-le-bluebird-assets"
        }
    ],
    "Version": "2012-10-17"
})
}

# Auto-discovered custom policy: NetworkAdministratorTGWCLI
resource "aws_iam_policy" "NetworkAdministratorTGWCLI" {
  name = "NetworkAdministratorTGWCLI"
  path = "/"
  
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "AllowTGW",
            "Effect": "Allow",
            "Action": [
                "ec2:ReplaceTransitGatewayRoute",
                "ec2:RejectTransitGatewayVpcAttachment",
                "ec2:RejectTransitGatewayPeeringAttachment",
                "ec2:RegisterTransitGatewayMulticastGroupSources",
                "ec2:RegisterTransitGatewayMulticastGroupMembers",
                "ec2:ModifyTransitGatewayVpcAttachment",
                "ec2:ModifyTransitGatewayPrefixListReference",
                "ec2:ModifyTransitGateway",
                "ec2:ExportTransitGatewayRoutes",
                "ec2:EnableTransitGatewayRouteTablePropagation",
                "ec2:DisassociateTransitGatewayRouteTable",
                "ec2:DisassociateTransitGatewayMulticastDomain",
                "ec2:DisableTransitGatewayRouteTablePropagation",
                "ec2:DeregisterTransitGatewayMulticastGroupSources",
                "ec2:DeregisterTransitGatewayMulticastGroupMembers",
                "ec2:DeleteTransitGatewayVpcAttachment",
                "ec2:DeleteTransitGatewayRouteTable",
                "ec2:DeleteTransitGatewayRoute",
                "ec2:DeleteTransitGatewayPrefixListReference",
                "ec2:DeleteTransitGatewayPeeringAttachment",
                "ec2:DeleteTransitGatewayMulticastDomain",
                "ec2:DeleteTransitGateway",
                "ec2:CreateTransitGatewayVpcAttachment",
                "ec2:CreateTransitGatewayRouteTable",
                "ec2:CreateTransitGatewayRoute",
                "ec2:CreateTransitGatewayPrefixListReference",
                "ec2:CreateTransitGatewayPeeringAttachment",
                "ec2:CreateTransitGatewayMulticastDomain",
                "ec2:CreateTransitGateway",
                "ec2:AssociateTransitGatewayRouteTable",
                "ec2:AssociateTransitGatewayMulticastDomain",
                "ec2:AcceptTransitGatewayVpcAttachment",
                "ec2:AcceptTransitGatewayPeeringAttachment"
            ],
            "Resource": "*"
        }
    ]
})
}

# Enhanced permissions policy for CloudWatch Live Tail and RAM resource sharing
resource "aws_iam_policy" "enhanced_permissions_policy" {
  name = "EnhancedPermissionsPolicy"
  path = "/"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "CloudWatchLiveTailAccess"
        Effect = "Allow"
        Action = [
          "logs:StartLiveTail",
          "logs:StopLiveTail"
        ]
        Resource = "arn:aws:logs:*:126376345002:log-group:*"
      },
      {
        Sid    = "RAMResourceSharingAccess"
        Effect = "Allow"
        Action = [
          "ram:GetResourceShares",
          "ram:GetResourceShareAssociations",
          "ram:GetResourceShareInvitations"
        ]
        Resource = "*"
      }
    ]
  })
}
