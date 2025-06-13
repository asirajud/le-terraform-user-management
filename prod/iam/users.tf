# IAM Users - Auto-generated from AWS

resource "aws_iam_user" "aaltman2_asu_edu_gianteagle" {
  name = "aaltman2@asu.edu.gianteagle"
  path = "/"

  tags = {
    Environment = "prod"
    ManagedBy   = "terraform"
  }
}

resource "aws_iam_user_policy_attachment" "aaltman2_asu_edu_gianteagle_iamuserchangepassword" {
  user       = aws_iam_user.aaltman2_asu_edu_gianteagle.name
  policy_arn = "arn:aws:iam::aws:policy/IAMUserChangePassword"
}

resource "aws_iam_user" "abpate13_asu_edu" {
  name = "abpate13@asu.edu"
  path = "/"

  tags = {
    Environment = "prod"
    ManagedBy   = "terraform"
  }
}

resource "aws_iam_user_policy_attachment" "abpate13_asu_edu_iamuserchangepassword" {
  user       = aws_iam_user.abpate13_asu_edu.name
  policy_arn = "arn:aws:iam::aws:policy/IAMUserChangePassword"
}

resource "aws_iam_user" "aclay11_asu_edu" {
  name = "aclay11@asu.edu"
  path = "/"

  tags = {
    Environment = "prod"
    ManagedBy   = "terraform"
  }
}

resource "aws_iam_user_policy_attachment" "aclay11_asu_edu_iamuserchangepassword" {
  user       = aws_iam_user.aclay11_asu_edu.name
  policy_arn = "arn:aws:iam::aws:policy/IAMUserChangePassword"
}

resource "aws_iam_user" "adreier2_asu_edu" {
  name = "adreier2@asu.edu"
  path = "/"

  tags = {
    Environment = "prod"
    ManagedBy   = "terraform"
  }
}

resource "aws_iam_user_policy_attachment" "adreier2_asu_edu_iamuserchangepassword" {
  user       = aws_iam_user.adreier2_asu_edu.name
  policy_arn = "arn:aws:iam::aws:policy/IAMUserChangePassword"
}

resource "aws_iam_user" "aether_user" {
  name = "aether_user"
  path = "/"

  tags = {
    Environment = "prod"
    ManagedBy   = "terraform"
  }
}

resource "aws_iam_user_policy_attachment" "aether_user_aether_s3_admin" {
  user       = aws_iam_user.aether_user.name
  policy_arn = aws_iam_policy.Aether_S3_Admin.arn
}

resource "aws_iam_user_policy_attachment" "aether_user_amazoneventbridgefullaccess" {
  user       = aws_iam_user.aether_user.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEventBridgeFullAccess"
}

resource "aws_iam_user" "aether_user_staging" {
  name = "aether_user_staging"
  path = "/"

  tags = {
    Environment = "prod"
    ManagedBy   = "terraform"
  }
}

resource "aws_iam_user_policy_attachment" "aether_user_staging_aether_s3_admin" {
  user       = aws_iam_user.aether_user_staging.name
  policy_arn = aws_iam_policy.Aether_S3_Admin.arn
}

resource "aws_iam_user_policy_attachment" "aether_user_staging_amazoneventbridgefullaccess" {
  user       = aws_iam_user.aether_user_staging.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEventBridgeFullAccess"
}

resource "aws_iam_user" "aitranscript_s3_user" {
  name = "aitranscript-s3-user"
  path = "/"

  tags = {
    Environment = "prod"
    ManagedBy   = "terraform"
  }
}

resource "aws_iam_user_policy_attachment" "aitranscript_s3_user_aitranscript_s3_access_policy" {
  user       = aws_iam_user.aitranscript_s3_user.name
  policy_arn = aws_iam_policy.aitranscript_s3_access_policy.arn
}

resource "aws_iam_user" "akuma405_asu_edu" {
  name = "akuma405@asu.edu"
  path = "/"

  tags = {
    Environment = "prod"
    ManagedBy   = "terraform"
  }
}

resource "aws_iam_user_policy_attachment" "akuma405_asu_edu_iamuserchangepassword" {
  user       = aws_iam_user.akuma405_asu_edu.name
  policy_arn = "arn:aws:iam::aws:policy/IAMUserChangePassword"
}

resource "aws_iam_user" "akuma534_asu_edu" {
  name = "akuma534@asu.edu"
  path = "/"

  tags = {
    Environment = "prod"
    ManagedBy   = "terraform"
  }
}

resource "aws_iam_user_policy_attachment" "akuma534_asu_edu_iamuserchangepassword" {
  user       = aws_iam_user.akuma534_asu_edu.name
  policy_arn = "arn:aws:iam::aws:policy/IAMUserChangePassword"
}

resource "aws_iam_user" "api_ai_grader" {
  name = "api-ai-grader"
  path = "/"

  tags = {
    Environment = "prod"
    ManagedBy   = "terraform"
  }
}

resource "aws_iam_user_policy_attachment" "api_ai_grader_amazonec2containerregistryfullaccess" {
  user       = aws_iam_user.api_ai_grader.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess"
}

resource "aws_iam_user_policy_attachment" "api_ai_grader_amazonec2containerregistrypoweruser" {
  user       = aws_iam_user.api_ai_grader.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryPowerUser"
}

resource "aws_iam_user_policy_attachment" "api_ai_grader_amazonsqsfullaccess" {
  user       = aws_iam_user.api_ai_grader.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSQSFullAccess"
}

resource "aws_iam_user" "api_user_gianteagle" {
  name = "api-user-gianteagle"
  path = "/"

  tags = {
    Environment = "prod"
    ManagedBy   = "terraform"
  }
}

resource "aws_iam_user" "apiuser_asu_edu" {
  name = "apiuser@asu.edu"
  path = "/"

  tags = {
    Environment = "prod"
    ManagedBy   = "terraform"
  }
}

resource "aws_iam_user" "apiuser_asu_edu_dev" {
  name = "apiuser@asu.edu.dev"
  path = "/"

  tags = {
    Environment = "prod"
    ManagedBy   = "terraform"
  }
}

resource "aws_iam_user_policy_attachment" "apiuser_asu_edu_dev_amazonapigatewayadministrator" {
  user       = aws_iam_user.apiuser_asu_edu_dev.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonAPIGatewayAdministrator"
}

resource "aws_iam_user_policy_attachment" "apiuser_asu_edu_dev_amazonapigatewaypushtocloudwatchlogs" {
  user       = aws_iam_user.apiuser_asu_edu_dev.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonAPIGatewayPushToCloudWatchLogs"
}

resource "aws_iam_user_policy_attachment" "apiuser_asu_edu_dev_iamfullaccess" {
  user       = aws_iam_user.apiuser_asu_edu_dev.name
  policy_arn = "arn:aws:iam::aws:policy/IAMFullAccess"
}

resource "aws_iam_user_policy_attachment" "apiuser_asu_edu_dev_iamuserchangepassword" {
  user       = aws_iam_user.apiuser_asu_edu_dev.name
  policy_arn = "arn:aws:iam::aws:policy/IAMUserChangePassword"
}

resource "aws_iam_user_policy_attachment" "apiuser_asu_edu_dev_amazonapigatewayinvokefullaccess" {
  user       = aws_iam_user.apiuser_asu_edu_dev.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonAPIGatewayInvokeFullAccess"
}

resource "aws_iam_user_policy_attachment" "apiuser_asu_edu_dev_amazondynamodbfullaccess" {
  user       = aws_iam_user.apiuser_asu_edu_dev.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess"
}

resource "aws_iam_user_policy_attachment" "apiuser_asu_edu_dev_awslambda_fullaccess" {
  user       = aws_iam_user.apiuser_asu_edu_dev.name
  policy_arn = "arn:aws:iam::aws:policy/AWSLambda_FullAccess"
}

resource "aws_iam_user" "apoogali_asu_edu" {
  name = "apoogali@asu.edu"
  path = "/"

  tags = {
    Environment = "prod"
    ManagedBy   = "terraform"
  }
}

resource "aws_iam_user_policy_attachment" "apoogali_asu_edu_iamuserchangepassword" {
  user       = aws_iam_user.apoogali_asu_edu.name
  policy_arn = "arn:aws:iam::aws:policy/IAMUserChangePassword"
}

resource "aws_iam_user" "asirajud_alias1_asu_edu" {
  name = "asirajud.alias1@asu.edu"
  path = "/"

  tags = {
    Environment = "prod"
    ManagedBy   = "terraform"
  }
}

resource "aws_iam_user_policy_attachment" "asirajud_alias1_asu_edu_iamuserchangepassword" {
  user       = aws_iam_user.asirajud_alias1_asu_edu.name
  policy_arn = "arn:aws:iam::aws:policy/IAMUserChangePassword"
}

resource "aws_iam_user" "asirajud_asu_edu" {
  name = "asirajud@asu.edu"
  path = "/"

  tags = {
    Environment = "prod"
    ManagedBy   = "terraform"
  }
}

resource "aws_iam_user_policy_attachment" "asirajud_asu_edu_amazoneksclusterpolicy" {
  user       = aws_iam_user.asirajud_asu_edu.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

resource "aws_iam_user_policy_attachment" "asirajud_asu_edu_iamuserchangepassword" {
  user       = aws_iam_user.asirajud_asu_edu.name
  policy_arn = "arn:aws:iam::aws:policy/IAMUserChangePassword"
}

resource "aws_iam_user_policy_attachment" "asirajud_asu_edu_amazoneksworkernodepolicy" {
  user       = aws_iam_user.asirajud_asu_edu.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
}

resource "aws_iam_user" "bbhanda1_asu_edu" {
  name = "bbhanda1@asu.edu"
  path = "/"

  tags = {
    Environment = "prod"
    ManagedBy   = "terraform"
  }
}

resource "aws_iam_user_policy_attachment" "bbhanda1_asu_edu_iamuserchangepassword" {
  user       = aws_iam_user.bbhanda1_asu_edu.name
  policy_arn = "arn:aws:iam::aws:policy/IAMUserChangePassword"
}

resource "aws_iam_user" "bitbucket_user_pipelines_deployment" {
  name = "bitbucket-user-pipelines-deployment"
  path = "/"

  tags = {
    Environment = "prod"
    ManagedBy   = "terraform"
  }
}

resource "aws_iam_user_policy_attachment" "bitbucket_user_pipelines_deployment_customcreateandreadallsecretsinthisaccount" {
  user       = aws_iam_user.bitbucket_user_pipelines_deployment.name
  policy_arn = aws_iam_policy.secrets_manager_policy.arn
}

resource "aws_iam_user_policy_attachment" "bitbucket_user_pipelines_deployment_bitbucketec2routetablepolicy" {
  user       = aws_iam_user.bitbucket_user_pipelines_deployment.name
  policy_arn = aws_iam_policy.ec2_route_table_policy.arn
}

resource "aws_iam_user_policy_attachment" "bitbucket_user_pipelines_deployment_cloudfrontfullaccess" {
  user       = aws_iam_user.bitbucket_user_pipelines_deployment.name
  policy_arn = "arn:aws:iam::aws:policy/CloudFrontFullAccess"
}

resource "aws_iam_user" "bitbucket_user_pipelines_deployment_dev" {
  name = "bitbucket-user-pipelines-deployment-dev"
  path = "/"

  tags = {
    Environment = "prod"
    ManagedBy   = "terraform"
  }
}

resource "aws_iam_user_policy_attachment" "bitbucket_user_pipelines_deployment_dev_customcreateandreadallsecretsinthisaccount" {
  user       = aws_iam_user.bitbucket_user_pipelines_deployment_dev.name
  policy_arn = aws_iam_policy.secrets_manager_policy.arn
}

resource "aws_iam_user_policy_attachment" "bitbucket_user_pipelines_deployment_dev_cloudfrontfullaccess" {
  user       = aws_iam_user.bitbucket_user_pipelines_deployment_dev.name
  policy_arn = "arn:aws:iam::aws:policy/CloudFrontFullAccess"
}

resource "aws_iam_user" "blogan12_asu_edu_asu_le_api_prod" {
  name = "blogan12@asu.edu.asu-le-api-prod"
  path = "/"

  tags = {
    Environment = "prod"
    ManagedBy   = "terraform"
  }
}

resource "aws_iam_user" "brianlogan_local" {
  name = "brianlogan-local"
  path = "/"

  tags = {
    Environment = "prod"
    ManagedBy   = "terraform"
  }
}

resource "aws_iam_user_policy_attachment" "brianlogan_local_administratoraccess_amplify" {
  user       = aws_iam_user.brianlogan_local.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess-Amplify"
}

resource "aws_iam_user" "canvas_data_streams_invalid_domain_dev" {
  name = "canvas.data.streams@invalid.domain.dev"
  path = "/"

  tags = {
    Environment = "prod"
    ManagedBy   = "terraform"
  }
}

resource "aws_iam_user" "cbgardin_asu_edu_asu_le_api_prod" {
  name = "cbgardin@asu.edu.asu-le-api-prod"
  path = "/"

  tags = {
    Environment = "prod"
    ManagedBy   = "terraform"
  }
}

resource "aws_iam_user_policy_attachment" "cbgardin_asu_edu_asu_le_api_prod_iamuserchangepassword" {
  user       = aws_iam_user.cbgardin_asu_edu_asu_le_api_prod.name
  policy_arn = "arn:aws:iam::aws:policy/IAMUserChangePassword"
}

resource "aws_iam_user" "central_api_hub_poc" {
  name = "central_api_hub_poc"
  path = "/"

  tags = {
    Environment = "prod"
    ManagedBy   = "terraform"
  }
}

resource "aws_iam_user_policy_attachment" "central_api_hub_poc_amazoncognitodeveloperauthenticatedidentities" {
  user       = aws_iam_user.central_api_hub_poc.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonCognitoDeveloperAuthenticatedIdentities"
}

resource "aws_iam_user_policy_attachment" "central_api_hub_poc_amazoncognitopoweruser" {
  user       = aws_iam_user.central_api_hub_poc.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonCognitoPowerUser"
}

resource "aws_iam_user_policy_attachment" "central_api_hub_poc_amazonescognitoaccess" {
  user       = aws_iam_user.central_api_hub_poc.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonESCognitoAccess"
}

resource "aws_iam_user" "CheckpointDiscovery" {
  name = "CheckpointDiscovery"
  path = "/"

  tags = {
    Environment = "prod"
    ManagedBy   = "terraform"
  }
}

resource "aws_iam_user_policy_attachment" "CheckpointDiscovery_amazonec2readonlyaccess" {
  user       = aws_iam_user.CheckpointDiscovery.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess"
}

resource "aws_iam_user" "chinnikr_asu_edu_asu_le_api_prod" {
  name = "chinnikr@asu.edu.asu-le-api-prod"
  path = "/"

  tags = {
    Environment = "prod"
    ManagedBy   = "terraform"
  }
}

resource "aws_iam_user_policy_attachment" "chinnikr_asu_edu_asu_le_api_prod_iamuserchangepassword" {
  user       = aws_iam_user.chinnikr_asu_edu_asu_le_api_prod.name
  policy_arn = "arn:aws:iam::aws:policy/IAMUserChangePassword"
}

resource "aws_iam_user" "cvouga_asu_edu_asu_le_api_prod" {
  name = "cvouga@asu.edu.asu-le-api-prod"
  path = "/"

  tags = {
    Environment = "prod"
    ManagedBy   = "terraform"
  }
}

resource "aws_iam_user_policy_attachment" "cvouga_asu_edu_asu_le_api_prod_genericreadonlypolicy" {
  user       = aws_iam_user.cvouga_asu_edu_asu_le_api_prod.name
  policy_arn = aws_iam_policy.generic_readonly_policy.arn
}

resource "aws_iam_user_policy_attachment" "cvouga_asu_edu_asu_le_api_prod_iamuserchangepassword" {
  user       = aws_iam_user.cvouga_asu_edu_asu_le_api_prod.name
  policy_arn = "arn:aws:iam::aws:policy/IAMUserChangePassword"
}

resource "aws_iam_user_policy_attachment" "cvouga_asu_edu_asu_le_api_prod_enhancedpermissionspolicy" {
  user       = aws_iam_user.cvouga_asu_edu_asu_le_api_prod.name
  policy_arn = aws_iam_policy.enhanced_permissions_policy.arn
}

resource "aws_iam_user" "dchanda1_asu_edu" {
  name = "dchanda1@asu.edu"
  path = "/"

  tags = {
    Environment = "prod"
    ManagedBy   = "terraform"
  }
}

resource "aws_iam_user_policy_attachment" "dchanda1_asu_edu_iamuserchangepassword" {
  user       = aws_iam_user.dchanda1_asu_edu.name
  policy_arn = "arn:aws:iam::aws:policy/IAMUserChangePassword"
}

resource "aws_iam_user" "dsatish1_asu_edu" {
  name = "dsatish1@asu.edu"
  path = "/"

  tags = {
    Environment = "prod"
    ManagedBy   = "terraform"
  }
}

resource "aws_iam_user_policy_attachment" "dsatish1_asu_edu_iamuserchangepassword" {
  user       = aws_iam_user.dsatish1_asu_edu.name
  policy_arn = "arn:aws:iam::aws:policy/IAMUserChangePassword"
}

resource "aws_iam_user" "DynamoDBAPIUser" {
  name = "DynamoDBAPIUser"
  path = "/"

  tags = {
    Environment = "prod"
    ManagedBy   = "terraform"
  }
}

resource "aws_iam_user" "ganance1_asu_edu" {
  name = "ganance1@asu.edu"
  path = "/"

  tags = {
    Environment = "prod"
    ManagedBy   = "terraform"
  }
}

resource "aws_iam_user_policy_attachment" "ganance1_asu_edu_iamuserchangepassword" {
  user       = aws_iam_user.ganance1_asu_edu.name
  policy_arn = "arn:aws:iam::aws:policy/IAMUserChangePassword"
}

resource "aws_iam_user" "hbisht1_asu_edu" {
  name = "hbisht1@asu.edu"
  path = "/"

  tags = {
    Environment = "prod"
    ManagedBy   = "terraform"
  }
}

resource "aws_iam_user_policy_attachment" "hbisht1_asu_edu_iamuserchangepassword" {
  user       = aws_iam_user.hbisht1_asu_edu.name
  policy_arn = "arn:aws:iam::aws:policy/IAMUserChangePassword"
}

resource "aws_iam_user_policy_attachment" "hbisht1_asu_edu_awsresourceexplorerreadonlyaccess" {
  user       = aws_iam_user.hbisht1_asu_edu.name
  policy_arn = "arn:aws:iam::aws:policy/AWSResourceExplorerReadOnlyAccess"
}

resource "aws_iam_user" "hdrodri1_asu_edu" {
  name = "hdrodri1@asu.edu"
  path = "/"

  tags = {
    Environment = "prod"
    ManagedBy   = "terraform"
  }
}

resource "aws_iam_user_policy_attachment" "hdrodri1_asu_edu_iamuserchangepassword" {
  user       = aws_iam_user.hdrodri1_asu_edu.name
  policy_arn = "arn:aws:iam::aws:policy/IAMUserChangePassword"
}

resource "aws_iam_user" "hyunwook_asu_edu_asu_le_api_prod" {
  name = "hyunwook@asu.edu.asu-le-api-prod"
  path = "/"

  tags = {
    Environment = "prod"
    ManagedBy   = "terraform"
  }
}

resource "aws_iam_user_policy_attachment" "hyunwook_asu_edu_asu_le_api_prod_iamuserchangepassword" {
  user       = aws_iam_user.hyunwook_asu_edu_asu_le_api_prod.name
  policy_arn = "arn:aws:iam::aws:policy/IAMUserChangePassword"
}

resource "aws_iam_user" "InfobloxDiscovery" {
  name = "InfobloxDiscovery"
  path = "/"

  tags = {
    Environment = "prod"
    ManagedBy   = "terraform"
  }
}

resource "aws_iam_user" "jcampb70_asu_edu" {
  name = "jcampb70@asu.edu"
  path = "/"

  tags = {
    Environment = "prod"
    ManagedBy   = "terraform"
  }
}

resource "aws_iam_user_policy_attachment" "jcampb70_asu_edu_iamuserchangepassword" {
  user       = aws_iam_user.jcampb70_asu_edu.name
  policy_arn = "arn:aws:iam::aws:policy/IAMUserChangePassword"
}

resource "aws_iam_user" "jicalder_asu_edu" {
  name = "jicalder@asu.edu"
  path = "/"

  tags = {
    Environment = "prod"
    ManagedBy   = "terraform"
  }
}

resource "aws_iam_user" "jmclain3_asu_edu_moodle" {
  name = "jmclain3@asu.edu.moodle"
  path = "/"

  tags = {
    Environment = "prod"
    ManagedBy   = "terraform"
  }
}

resource "aws_iam_user_policy_attachment" "jmclain3_asu_edu_moodle_amazonec2fullaccess" {
  user       = aws_iam_user.jmclain3_asu_edu_moodle.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}

resource "aws_iam_user_policy_attachment" "jmclain3_asu_edu_moodle_iamreadonlyaccess" {
  user       = aws_iam_user.jmclain3_asu_edu_moodle.name
  policy_arn = "arn:aws:iam::aws:policy/IAMReadOnlyAccess"
}

resource "aws_iam_user_policy_attachment" "jmclain3_asu_edu_moodle_iamuserchangepassword" {
  user       = aws_iam_user.jmclain3_asu_edu_moodle.name
  policy_arn = "arn:aws:iam::aws:policy/IAMUserChangePassword"
}

resource "aws_iam_user" "jmsmit49_asu_edu" {
  name = "jmsmit49@asu.edu"
  path = "/"

  tags = {
    Environment = "prod"
    ManagedBy   = "terraform"
  }
}

resource "aws_iam_user" "jtwill40_asu_edu_gianteagle" {
  name = "jtwill40@asu.edu.gianteagle"
  path = "/"

  tags = {
    Environment = "prod"
    ManagedBy   = "terraform"
  }
}

resource "aws_iam_user_policy_attachment" "jtwill40_asu_edu_gianteagle_iamuserchangepassword" {
  user       = aws_iam_user.jtwill40_asu_edu_gianteagle.name
  policy_arn = "arn:aws:iam::aws:policy/IAMUserChangePassword"
}

resource "aws_iam_user" "kishaanp_asu_edu" {
  name = "kishaanp@asu.edu"
  path = "/"

  tags = {
    Environment = "prod"
    ManagedBy   = "terraform"
  }
}

resource "aws_iam_user_policy_attachment" "kishaanp_asu_edu_le_developement_cc_100ml_admin_users" {
  user       = aws_iam_user.kishaanp_asu_edu.name
  policy_arn = aws_iam_policy.LE_Developement_CC_100ML_Admin_Users.arn
}

resource "aws_iam_user_policy_attachment" "kishaanp_asu_edu_amazoncognitopoweruser" {
  user       = aws_iam_user.kishaanp_asu_edu.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonCognitoPowerUser"
}

resource "aws_iam_user_policy_attachment" "kishaanp_asu_edu_iamuserchangepassword" {
  user       = aws_iam_user.kishaanp_asu_edu.name
  policy_arn = "arn:aws:iam::aws:policy/IAMUserChangePassword"
}

resource "aws_iam_user" "kishaanp_asu_edu_asu_le_api_prod" {
  name = "kishaanp@asu.edu.asu.le.api.prod"
  path = "/"

  tags = {
    Environment = "prod"
    ManagedBy   = "terraform"
  }
}

resource "aws_iam_user_policy_attachment" "kishaanp_asu_edu_asu_le_api_prod_amazonapigatewayadministrator" {
  user       = aws_iam_user.kishaanp_asu_edu_asu_le_api_prod.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonAPIGatewayAdministrator"
}

resource "aws_iam_user_policy_attachment" "kishaanp_asu_edu_asu_le_api_prod_amazoncognitopoweruser" {
  user       = aws_iam_user.kishaanp_asu_edu_asu_le_api_prod.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonCognitoPowerUser"
}

resource "aws_iam_user_policy_attachment" "kishaanp_asu_edu_asu_le_api_prod_amazonsnsreadonlyaccess" {
  user       = aws_iam_user.kishaanp_asu_edu_asu_le_api_prod.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSNSReadOnlyAccess"
}

resource "aws_iam_user_policy_attachment" "kishaanp_asu_edu_asu_le_api_prod_secretsmanagerreadwrite" {
  user       = aws_iam_user.kishaanp_asu_edu_asu_le_api_prod.name
  policy_arn = "arn:aws:iam::aws:policy/SecretsManagerReadWrite"
}

resource "aws_iam_user_policy_attachment" "kishaanp_asu_edu_asu_le_api_prod_amazonsesfullaccess" {
  user       = aws_iam_user.kishaanp_asu_edu_asu_le_api_prod.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSESFullAccess"
}

resource "aws_iam_user_policy_attachment" "kishaanp_asu_edu_asu_le_api_prod_iamuserchangepassword" {
  user       = aws_iam_user.kishaanp_asu_edu_asu_le_api_prod.name
  policy_arn = "arn:aws:iam::aws:policy/IAMUserChangePassword"
}

resource "aws_iam_user_policy_attachment" "kishaanp_asu_edu_asu_le_api_prod_cloudwatchlogsreadonlyaccess" {
  user       = aws_iam_user.kishaanp_asu_edu_asu_le_api_prod.name
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchLogsReadOnlyAccess"
}

resource "aws_iam_user_policy_attachment" "kishaanp_asu_edu_asu_le_api_prod_amazondynamodbfullaccess" {
  user       = aws_iam_user.kishaanp_asu_edu_asu_le_api_prod.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess"
}

resource "aws_iam_user_policy_attachment" "kishaanp_asu_edu_asu_le_api_prod_amazons3fullaccess" {
  user       = aws_iam_user.kishaanp_asu_edu_asu_le_api_prod.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

resource "aws_iam_user_policy_attachment" "kishaanp_asu_edu_asu_le_api_prod_awslambda_readonlyaccess" {
  user       = aws_iam_user.kishaanp_asu_edu_asu_le_api_prod.name
  policy_arn = "arn:aws:iam::aws:policy/AWSLambda_ReadOnlyAccess"
}

resource "aws_iam_user" "kjsegovi_asu_edu" {
  name = "kjsegovi@asu.edu"
  path = "/"

  tags = {
    Environment = "prod"
    ManagedBy   = "terraform"
  }
}

resource "aws_iam_user" "kkesani_asu_edu_le_prod" {
  name = "kkesani@asu.edu.le.prod"
  path = "/"

  tags = {
    Environment = "prod"
    ManagedBy   = "terraform"
  }
}

resource "aws_iam_user_policy_attachment" "kkesani_asu_edu_le_prod_iamuserchangepassword" {
  user       = aws_iam_user.kkesani_asu_edu_le_prod.name
  policy_arn = "arn:aws:iam::aws:policy/IAMUserChangePassword"
}

resource "aws_iam_user" "kserio_asu_edu" {
  name = "kserio@asu.edu"
  path = "/"

  tags = {
    Environment = "prod"
    ManagedBy   = "terraform"
  }
}

resource "aws_iam_user_policy_attachment" "kserio_asu_edu_iamuserchangepassword" {
  user       = aws_iam_user.kserio_asu_edu.name
  policy_arn = "arn:aws:iam::aws:policy/IAMUserChangePassword"
}

resource "aws_iam_user" "kspate10_asu_edu" {
  name = "kspate10@asu.edu"
  path = "/"

  tags = {
    Environment = "prod"
    ManagedBy   = "terraform"
  }
}

resource "aws_iam_user_policy_attachment" "kspate10_asu_edu_iamuserchangepassword" {
  user       = aws_iam_user.kspate10_asu_edu.name
  policy_arn = "arn:aws:iam::aws:policy/IAMUserChangePassword"
}

resource "aws_iam_user" "lmpeders_asu_edu" {
  name = "lmpeders@asu.edu"
  path = "/"

  tags = {
    Environment = "prod"
    ManagedBy   = "terraform"
  }
}

resource "aws_iam_user_policy_attachment" "lmpeders_asu_edu_iamuserchangepassword" {
  user       = aws_iam_user.lmpeders_asu_edu.name
  policy_arn = "arn:aws:iam::aws:policy/IAMUserChangePassword"
}

resource "aws_iam_user" "mgombis_asu_edu" {
  name = "mgombis@asu.edu"
  path = "/"

  tags = {
    Environment = "prod"
    ManagedBy   = "terraform"
  }
}

resource "aws_iam_user_policy_attachment" "mgombis_asu_edu_iamuserchangepassword" {
  user       = aws_iam_user.mgombis_asu_edu.name
  policy_arn = "arn:aws:iam::aws:policy/IAMUserChangePassword"
}

resource "aws_iam_user" "michal_przybylowicz_gogoapps_io" {
  name = "michal.przybylowicz@gogoapps.io"
  path = "/"

  tags = {
    Environment = "prod"
    ManagedBy   = "terraform"
  }
}

resource "aws_iam_user_policy_attachment" "michal_przybylowicz_gogoapps_io_cloudwatchlogsfullaccess" {
  user       = aws_iam_user.michal_przybylowicz_gogoapps_io.name
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchLogsFullAccess"
}

resource "aws_iam_user_policy_attachment" "michal_przybylowicz_gogoapps_io_iamuserchangepassword" {
  user       = aws_iam_user.michal_przybylowicz_gogoapps_io.name
  policy_arn = "arn:aws:iam::aws:policy/IAMUserChangePassword"
}

resource "aws_iam_user_policy_attachment" "michal_przybylowicz_gogoapps_io_amazoneksfargatepodexecutionrolepolicy" {
  user       = aws_iam_user.michal_przybylowicz_gogoapps_io.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSFargatePodExecutionRolePolicy"
}

resource "aws_iam_user_policy_attachment" "michal_przybylowicz_gogoapps_io_awscodepipeline_fullaccess" {
  user       = aws_iam_user.michal_przybylowicz_gogoapps_io.name
  policy_arn = "arn:aws:iam::aws:policy/AWSCodePipeline_FullAccess"
}

resource "aws_iam_user" "ndutta6_asu_edu_asu_le_api_prod" {
  name = "ndutta6@asu.edu.asu-le-api-prod"
  path = "/"

  tags = {
    Environment = "prod"
    ManagedBy   = "terraform"
  }
}

resource "aws_iam_user_policy_attachment" "ndutta6_asu_edu_asu_le_api_prod_amazoncognitopoweruser" {
  user       = aws_iam_user.ndutta6_asu_edu_asu_le_api_prod.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonCognitoPowerUser"
}

resource "aws_iam_user_policy_attachment" "ndutta6_asu_edu_asu_le_api_prod_iamuserchangepassword" {
  user       = aws_iam_user.ndutta6_asu_edu_asu_le_api_prod.name
  policy_arn = "arn:aws:iam::aws:policy/IAMUserChangePassword"
}

resource "aws_iam_user_policy_attachment" "ndutta6_asu_edu_asu_le_api_prod_amazondynamodbfullaccess" {
  user       = aws_iam_user.ndutta6_asu_edu_asu_le_api_prod.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess"
}

resource "aws_iam_user" "obaalouc_asu_edu" {
  name = "obaalouc@asu.edu"
  path = "/"

  tags = {
    Environment = "prod"
    ManagedBy   = "terraform"
  }
}

resource "aws_iam_user_policy_attachment" "obaalouc_asu_edu_iamuserchangepassword" {
  user       = aws_iam_user.obaalouc_asu_edu.name
  policy_arn = "arn:aws:iam::aws:policy/IAMUserChangePassword"
}

resource "aws_iam_user" "piotr_dybka_gogoapps_io" {
  name = "piotr.dybka@gogoapps.io"
  path = "/"

  tags = {
    Environment = "prod"
    ManagedBy   = "terraform"
  }
}

resource "aws_iam_user_policy_attachment" "piotr_dybka_gogoapps_io_amazonroute53domainsfullaccess" {
  user       = aws_iam_user.piotr_dybka_gogoapps_io.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonRoute53DomainsFullAccess"
}

resource "aws_iam_user_policy_attachment" "piotr_dybka_gogoapps_io_awscertificatemanagerprivatecafullaccess" {
  user       = aws_iam_user.piotr_dybka_gogoapps_io.name
  policy_arn = "arn:aws:iam::aws:policy/AWSCertificateManagerPrivateCAFullAccess"
}

resource "aws_iam_user_policy_attachment" "piotr_dybka_gogoapps_io_amazonroute53fullaccess" {
  user       = aws_iam_user.piotr_dybka_gogoapps_io.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonRoute53FullAccess"
}

resource "aws_iam_user_policy_attachment" "piotr_dybka_gogoapps_io_awscertificatemanagerfullaccess" {
  user       = aws_iam_user.piotr_dybka_gogoapps_io.name
  policy_arn = "arn:aws:iam::aws:policy/AWSCertificateManagerFullAccess"
}

resource "aws_iam_user_policy_attachment" "piotr_dybka_gogoapps_io_iamfullaccess" {
  user       = aws_iam_user.piotr_dybka_gogoapps_io.name
  policy_arn = "arn:aws:iam::aws:policy/IAMFullAccess"
}

resource "aws_iam_user_policy_attachment" "piotr_dybka_gogoapps_io_amazonecs_fullaccess" {
  user       = aws_iam_user.piotr_dybka_gogoapps_io.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonECS_FullAccess"
}

resource "aws_iam_user_policy_attachment" "piotr_dybka_gogoapps_io_iamuserchangepassword" {
  user       = aws_iam_user.piotr_dybka_gogoapps_io.name
  policy_arn = "arn:aws:iam::aws:policy/IAMUserChangePassword"
}

resource "aws_iam_user_policy_attachment" "piotr_dybka_gogoapps_io_amazonsagemakerservicecatalogproductscodepipelineservicerolepolicy" {
  user       = aws_iam_user.piotr_dybka_gogoapps_io.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonSageMakerServiceCatalogProductsCodePipelineServiceRolePolicy"
}

resource "aws_iam_user_policy_attachment" "piotr_dybka_gogoapps_io_amazonroute53resolverfullaccess" {
  user       = aws_iam_user.piotr_dybka_gogoapps_io.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonRoute53ResolverFullAccess"
}

resource "aws_iam_user_policy_attachment" "piotr_dybka_gogoapps_io_awscodepipeline_fullaccess" {
  user       = aws_iam_user.piotr_dybka_gogoapps_io.name
  policy_arn = "arn:aws:iam::aws:policy/AWSCodePipeline_FullAccess"
}

resource "aws_iam_user" "pjadhav2_asu_edu_asu_le_api_prod" {
  name = "pjadhav2@asu.edu.asu-le-api-prod"
  path = "/"

  tags = {
    Environment = "prod"
    ManagedBy   = "terraform"
  }
}

resource "aws_iam_user_policy_attachment" "pjadhav2_asu_edu_asu_le_api_prod_iamuserchangepassword" {
  user       = aws_iam_user.pjadhav2_asu_edu_asu_le_api_prod.name
  policy_arn = "arn:aws:iam::aws:policy/IAMUserChangePassword"
}

resource "aws_iam_user" "rcisner1_asu_edu" {
  name = "rcisner1@asu.edu"
  path = "/"

  tags = {
    Environment = "prod"
    ManagedBy   = "terraform"
  }
}

resource "aws_iam_user_policy_attachment" "rcisner1_asu_edu_iamuserchangepassword" {
  user       = aws_iam_user.rcisner1_asu_edu.name
  policy_arn = "arn:aws:iam::aws:policy/IAMUserChangePassword"
}

resource "aws_iam_user" "relango_asu_edu_asu_le_api_prod" {
  name = "relango@asu.edu.asu-le-api-prod"
  path = "/"

  tags = {
    Environment = "prod"
    ManagedBy   = "terraform"
  }
}

resource "aws_iam_user_policy_attachment" "relango_asu_edu_asu_le_api_prod_iamuserchangepassword" {
  user       = aws_iam_user.relango_asu_edu_asu_le_api_prod.name
  policy_arn = "arn:aws:iam::aws:policy/IAMUserChangePassword"
}

resource "aws_iam_user" "rsavajiy_asu_edu" {
  name = "rsavajiy@asu.edu"
  path = "/"

  tags = {
    Environment = "prod"
    ManagedBy   = "terraform"
  }
}

resource "aws_iam_user" "ses_smtp_user_20250410_103506" {
  name = "ses-smtp-user.20250410-103506"
  path = "/"

  tags = {
    Environment = "prod"
    ManagedBy   = "terraform"
  }
}

resource "aws_iam_user" "sfaison3_asu_edu" {
  name = "sfaison3@asu.edu"
  path = "/"

  tags = {
    Environment = "prod"
    ManagedBy   = "terraform"
  }
}

resource "aws_iam_user_policy_attachment" "sfaison3_asu_edu_iamuserchangepassword" {
  user       = aws_iam_user.sfaison3_asu_edu.name
  policy_arn = "arn:aws:iam::aws:policy/IAMUserChangePassword"
}

resource "aws_iam_user" "sfuhs_asu_edu" {
  name = "sfuhs@asu.edu"
  path = "/"

  tags = {
    Environment = "prod"
    ManagedBy   = "terraform"
  }
}

resource "aws_iam_user_policy_attachment" "sfuhs_asu_edu_custominlinepolicy" {
  user       = aws_iam_user.sfuhs_asu_edu.name
  policy_arn = aws_iam_policy.CustomInlinePolicy.arn
}

resource "aws_iam_user_policy_attachment" "sfuhs_asu_edu_iamuserchangepassword" {
  user       = aws_iam_user.sfuhs_asu_edu.name
  policy_arn = "arn:aws:iam::aws:policy/IAMUserChangePassword"
}

resource "aws_iam_user" "skirkile_asu_edu" {
  name = "skirkile@asu.edu"
  path = "/"

  tags = {
    Environment = "prod"
    ManagedBy   = "terraform"
  }
}

resource "aws_iam_user_policy_attachment" "skirkile_asu_edu_iamuserchangepassword" {
  user       = aws_iam_user.skirkile_asu_edu.name
  policy_arn = "arn:aws:iam::aws:policy/IAMUserChangePassword"
}

resource "aws_iam_user" "smckinn7_asu_edu" {
  name = "smckinn7@asu.edu"
  path = "/"

  tags = {
    Environment = "prod"
    ManagedBy   = "terraform"
  }
}

resource "aws_iam_user_policy_attachment" "smckinn7_asu_edu_iamuserchangepassword" {
  user       = aws_iam_user.smckinn7_asu_edu.name
  policy_arn = "arn:aws:iam::aws:policy/IAMUserChangePassword"
}

resource "aws_iam_user" "smckinn7_asu_edu_gianteagle" {
  name = "smckinn7@asu.edu.gianteagle"
  path = "/"

  tags = {
    Environment = "prod"
    ManagedBy   = "terraform"
  }
}

resource "aws_iam_user_policy_attachment" "smckinn7_asu_edu_gianteagle_iamuserchangepassword" {
  user       = aws_iam_user.smckinn7_asu_edu_gianteagle.name
  policy_arn = "arn:aws:iam::aws:policy/IAMUserChangePassword"
}

resource "aws_iam_user" "smote3_asu_edu" {
  name = "smote3@asu.edu"
  path = "/"

  tags = {
    Environment = "prod"
    ManagedBy   = "terraform"
  }
}

resource "aws_iam_user_policy_attachment" "smote3_asu_edu_amazoncognitopoweruser" {
  user       = aws_iam_user.smote3_asu_edu.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonCognitoPowerUser"
}

resource "aws_iam_user_policy_attachment" "smote3_asu_edu_iamuserchangepassword" {
  user       = aws_iam_user.smote3_asu_edu.name
  policy_arn = "arn:aws:iam::aws:policy/IAMUserChangePassword"
}

resource "aws_iam_user" "smrice3_asu_edu" {
  name = "smrice3@asu.edu"
  path = "/"

  tags = {
    Environment = "prod"
    ManagedBy   = "terraform"
  }
}

resource "aws_iam_user_policy_attachment" "smrice3_asu_edu_iamuserchangepassword" {
  user       = aws_iam_user.smrice3_asu_edu.name
  policy_arn = "arn:aws:iam::aws:policy/IAMUserChangePassword"
}

resource "aws_iam_user" "snangali_asu_edu" {
  name = "snangali@asu.edu"
  path = "/"

  tags = {
    Environment = "prod"
    ManagedBy   = "terraform"
  }
}

resource "aws_iam_user_policy_attachment" "snangali_asu_edu_iamuserchangepassword" {
  user       = aws_iam_user.snangali_asu_edu.name
  policy_arn = "arn:aws:iam::aws:policy/IAMUserChangePassword"
}

resource "aws_iam_user" "srpowell_asu_edu" {
  name = "srpowell@asu.edu"
  path = "/"

  tags = {
    Environment = "prod"
    ManagedBy   = "terraform"
  }
}

resource "aws_iam_user_policy_attachment" "srpowell_asu_edu_iamuserchangepassword" {
  user       = aws_iam_user.srpowell_asu_edu.name
  policy_arn = "arn:aws:iam::aws:policy/IAMUserChangePassword"
}

resource "aws_iam_user" "ssoni14_asu_edu" {
  name = "ssoni14@asu.edu"
  path = "/"

  tags = {
    Environment = "prod"
    ManagedBy   = "terraform"
  }
}

resource "aws_iam_user_policy_attachment" "ssoni14_asu_edu_iamuserchangepassword" {
  user       = aws_iam_user.ssoni14_asu_edu.name
  policy_arn = "arn:aws:iam::aws:policy/IAMUserChangePassword"
}

resource "aws_iam_user" "stayo_asu_edu" {
  name = "stayo@asu.edu"
  path = "/"

  tags = {
    Environment = "prod"
    ManagedBy   = "terraform"
  }
}

resource "aws_iam_user_policy_attachment" "stayo_asu_edu_iamuserchangepassword" {
  user       = aws_iam_user.stayo_asu_edu.name
  policy_arn = "arn:aws:iam::aws:policy/IAMUserChangePassword"
}

resource "aws_iam_user" "tdrake7_asu_edu" {
  name = "tdrake7@asu.edu"
  path = "/"

  tags = {
    Environment = "prod"
    ManagedBy   = "terraform"
  }
}

resource "aws_iam_user_policy_attachment" "tdrake7_asu_edu_iamuserchangepassword" {
  user       = aws_iam_user.tdrake7_asu_edu.name
  policy_arn = "arn:aws:iam::aws:policy/IAMUserChangePassword"
}

resource "aws_iam_user" "tjena_asu_edu_asu_le_api_prod" {
  name = "tjena@asu.edu.asu-le-api-prod"
  path = "/"

  tags = {
    Environment = "prod"
    ManagedBy   = "terraform"
  }
}

resource "aws_iam_user_policy_attachment" "tjena_asu_edu_asu_le_api_prod_iamuserchangepassword" {
  user       = aws_iam_user.tjena_asu_edu_asu_le_api_prod.name
  policy_arn = "arn:aws:iam::aws:policy/IAMUserChangePassword"
}

resource "aws_iam_user" "tmjone39_asu_edu" {
  name = "tmjone39@asu.edu"
  path = "/"

  tags = {
    Environment = "prod"
    ManagedBy   = "terraform"
  }
}

resource "aws_iam_user_policy_attachment" "tmjone39_asu_edu_iamuserchangepassword" {
  user       = aws_iam_user.tmjone39_asu_edu.name
  policy_arn = "arn:aws:iam::aws:policy/IAMUserChangePassword"
}

resource "aws_iam_user" "tpopovic_asu_edu_gianteagle" {
  name = "tpopovic@asu.edu.gianteagle"
  path = "/"

  tags = {
    Environment = "prod"
    ManagedBy   = "terraform"
  }
}

resource "aws_iam_user_policy_attachment" "tpopovic_asu_edu_gianteagle_iamuserchangepassword" {
  user       = aws_iam_user.tpopovic_asu_edu_gianteagle.name
  policy_arn = "arn:aws:iam::aws:policy/IAMUserChangePassword"
}

resource "aws_iam_user" "wladyslaw_jasinski_gogoapps_io" {
  name = "wladyslaw.jasinski@gogoapps.io"
  path = "/"

  tags = {
    Environment = "prod"
    ManagedBy   = "terraform"
  }
}

resource "aws_iam_user_policy_attachment" "wladyslaw_jasinski_gogoapps_io_iamuserchangepassword" {
  user       = aws_iam_user.wladyslaw_jasinski_gogoapps_io.name
  policy_arn = "arn:aws:iam::aws:policy/IAMUserChangePassword"
}

resource "aws_iam_user" "wpcampbe_asu_edu" {
  name = "wpcampbe@asu.edu"
  path = "/"

  tags = {
    Environment = "prod"
    ManagedBy   = "terraform"
  }
}

resource "aws_iam_user_policy_attachment" "wpcampbe_asu_edu_iamuserchangepassword" {
  user       = aws_iam_user.wpcampbe_asu_edu.name
  policy_arn = "arn:aws:iam::aws:policy/IAMUserChangePassword"
}

resource "aws_iam_user" "ypachchi_asu_edu" {
  name = "ypachchi@asu.edu"
  path = "/"

  tags = {
    Environment = "prod"
    ManagedBy   = "terraform"
  }
}

