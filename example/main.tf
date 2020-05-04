module "opg_aws_config_accountwide" {
  source = "./terraform-aws-config/account"

  providers = {
    aws = aws.eu_west_1
  }
}

module "opg_aws_config_eu_west" {
  source           = "./terraform-aws-config/account_region"
  config_iam_role  = module.opg_aws_config_accountwide.aws_config_role
  config_s3_bucket = module.opg_aws_config_accountwide.aws_config_s3_bucket

  providers = {
    aws      = aws.eu_west_1
    aws.main = aws.eu_west_1
  }
}

module "opg_aws_config_sandbox_us_east" {
  source           = "./terraform-aws-config/account_region"
  config_iam_role  = module.opg_aws_config_accountwide.aws_config_role
  config_s3_bucket = module.opg_aws_config_accountwide.aws_config_s3_bucket

  providers = {
    aws      = aws.us_east_1
    aws.main = aws.eu_west_1
  }
}
