output "policy_arns" {
  description = "ARNs of all custom IAM policies"
  value = {
    secrets_manager_policy  = aws_iam_policy.secrets_manager_policy.arn
    ec2_route_table_policy  = aws_iam_policy.ec2_route_table_policy.arn
    generic_readonly_policy = aws_iam_policy.generic_readonly_policy.arn
  }
}
output "user_arns" {
  description = "ARNs of all IAM users"
  value = {
    aaltman2_asu_edu_gianteagle = aws_iam_user.aaltman2_asu_edu_gianteagle.arn
    abpate13_asu_edu = aws_iam_user.abpate13_asu_edu.arn
    aclay11_asu_edu = aws_iam_user.aclay11_asu_edu.arn
    adreier2_asu_edu = aws_iam_user.adreier2_asu_edu.arn
    aether_user = aws_iam_user.aether_user.arn
    aether_user_staging = aws_iam_user.aether_user_staging.arn
    aitranscript_s3_user = aws_iam_user.aitranscript_s3_user.arn
    akuma405_asu_edu = aws_iam_user.akuma405_asu_edu.arn
    akuma534_asu_edu = aws_iam_user.akuma534_asu_edu.arn
    api_ai_grader = aws_iam_user.api_ai_grader.arn
    api_user_gianteagle = aws_iam_user.api_user_gianteagle.arn
    apiuser_asu_edu = aws_iam_user.apiuser_asu_edu.arn
    apiuser_asu_edu_dev = aws_iam_user.apiuser_asu_edu_dev.arn
    apoogali_asu_edu = aws_iam_user.apoogali_asu_edu.arn
    asirajud_alias1_asu_edu = aws_iam_user.asirajud_alias1_asu_edu.arn
    asirajud_asu_edu = aws_iam_user.asirajud_asu_edu.arn
    bbhanda1_asu_edu = aws_iam_user.bbhanda1_asu_edu.arn
    bitbucket_user_pipelines_deployment = aws_iam_user.bitbucket_user_pipelines_deployment.arn
    bitbucket_user_pipelines_deployment_dev = aws_iam_user.bitbucket_user_pipelines_deployment_dev.arn
    blogan12_asu_edu_asu_le_api_prod = aws_iam_user.blogan12_asu_edu_asu_le_api_prod.arn
    brianlogan_local = aws_iam_user.brianlogan_local.arn
    canvas_data_streams_invalid_domain_dev = aws_iam_user.canvas_data_streams_invalid_domain_dev.arn
    cbgardin_asu_edu_asu_le_api_prod = aws_iam_user.cbgardin_asu_edu_asu_le_api_prod.arn
    central_api_hub_poc = aws_iam_user.central_api_hub_poc.arn
    CheckpointDiscovery = aws_iam_user.CheckpointDiscovery.arn
    chinnikr_asu_edu_asu_le_api_prod = aws_iam_user.chinnikr_asu_edu_asu_le_api_prod.arn
    cvouga_asu_edu_asu_le_api_prod = aws_iam_user.cvouga_asu_edu_asu_le_api_prod.arn
    dchanda1_asu_edu = aws_iam_user.dchanda1_asu_edu.arn
    dsatish1_asu_edu = aws_iam_user.dsatish1_asu_edu.arn
    DynamoDBAPIUser = aws_iam_user.DynamoDBAPIUser.arn
    ganance1_asu_edu = aws_iam_user.ganance1_asu_edu.arn
    hbisht1_asu_edu = aws_iam_user.hbisht1_asu_edu.arn
    hdrodri1_asu_edu = aws_iam_user.hdrodri1_asu_edu.arn
    hyunwook_asu_edu_asu_le_api_prod = aws_iam_user.hyunwook_asu_edu_asu_le_api_prod.arn
    InfobloxDiscovery = aws_iam_user.InfobloxDiscovery.arn
    jcampb70_asu_edu = aws_iam_user.jcampb70_asu_edu.arn
    jicalder_asu_edu = aws_iam_user.jicalder_asu_edu.arn
    jmclain3_asu_edu_moodle = aws_iam_user.jmclain3_asu_edu_moodle.arn
    jmsmit49_asu_edu = aws_iam_user.jmsmit49_asu_edu.arn
    jtwill40_asu_edu_gianteagle = aws_iam_user.jtwill40_asu_edu_gianteagle.arn
    kishaanp_asu_edu = aws_iam_user.kishaanp_asu_edu.arn
    kishaanp_asu_edu_asu_le_api_prod = aws_iam_user.kishaanp_asu_edu_asu_le_api_prod.arn
    kjsegovi_asu_edu = aws_iam_user.kjsegovi_asu_edu.arn
    kkesani_asu_edu_le_prod = aws_iam_user.kkesani_asu_edu_le_prod.arn
    kserio_asu_edu = aws_iam_user.kserio_asu_edu.arn
    kspate10_asu_edu = aws_iam_user.kspate10_asu_edu.arn
    lmpeders_asu_edu = aws_iam_user.lmpeders_asu_edu.arn
    mgombis_asu_edu = aws_iam_user.mgombis_asu_edu.arn
    michal_przybylowicz_gogoapps_io = aws_iam_user.michal_przybylowicz_gogoapps_io.arn
    ndutta6_asu_edu_asu_le_api_prod = aws_iam_user.ndutta6_asu_edu_asu_le_api_prod.arn
    obaalouc_asu_edu = aws_iam_user.obaalouc_asu_edu.arn
    piotr_dybka_gogoapps_io = aws_iam_user.piotr_dybka_gogoapps_io.arn
    pjadhav2_asu_edu_asu_le_api_prod = aws_iam_user.pjadhav2_asu_edu_asu_le_api_prod.arn
    rcisner1_asu_edu = aws_iam_user.rcisner1_asu_edu.arn
    relango_asu_edu_asu_le_api_prod = aws_iam_user.relango_asu_edu_asu_le_api_prod.arn
    rsavajiy_asu_edu = aws_iam_user.rsavajiy_asu_edu.arn
    ses_smtp_user_20250410_103506 = aws_iam_user.ses_smtp_user_20250410_103506.arn
    sfaison3_asu_edu = aws_iam_user.sfaison3_asu_edu.arn
    sfuhs_asu_edu = aws_iam_user.sfuhs_asu_edu.arn
    skirkile_asu_edu = aws_iam_user.skirkile_asu_edu.arn
    smckinn7_asu_edu = aws_iam_user.smckinn7_asu_edu.arn
    smckinn7_asu_edu_gianteagle = aws_iam_user.smckinn7_asu_edu_gianteagle.arn
    smote3_asu_edu = aws_iam_user.smote3_asu_edu.arn
    smrice3_asu_edu = aws_iam_user.smrice3_asu_edu.arn
    snangali_asu_edu = aws_iam_user.snangali_asu_edu.arn
    srpowell_asu_edu = aws_iam_user.srpowell_asu_edu.arn
    ssoni14_asu_edu = aws_iam_user.ssoni14_asu_edu.arn
    stayo_asu_edu = aws_iam_user.stayo_asu_edu.arn
    tdrake7_asu_edu = aws_iam_user.tdrake7_asu_edu.arn
    tjena_asu_edu_asu_le_api_prod = aws_iam_user.tjena_asu_edu_asu_le_api_prod.arn
    tmjone39_asu_edu = aws_iam_user.tmjone39_asu_edu.arn
    tpopovic_asu_edu_gianteagle = aws_iam_user.tpopovic_asu_edu_gianteagle.arn
    wladyslaw_jasinski_gogoapps_io = aws_iam_user.wladyslaw_jasinski_gogoapps_io.arn
    wpcampbe_asu_edu = aws_iam_user.wpcampbe_asu_edu.arn
    ypachchi_asu_edu = aws_iam_user.ypachchi_asu_edu.arn
  }
}

