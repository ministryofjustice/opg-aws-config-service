module "opg_aws_config_sandbox_accountwide" {
  source                    = "./modules/account"
  config_logs_prefix        = var.config_logs_prefix
  config_name               = var.config_name
  config_aggregator_name    = var.config_aggregator_name
  aggregate_organization    = var.aggregate_organization
  config_logs_bucket_prefix = var.config_logs_bucket_prefix
  is_production             = var.is_production

  providers = {
    aws = aws.eu_west_1
  }
}

module "opg_aws_config_sandbox_eu_west" {
  source                         = "./modules/account_region"
  config_iam_role                = module.opg_aws_config_sandbox_accountwide.aws_config_role
  config_s3_bucket               = module.opg_aws_config_sandbox_accountwide.aws_config_s3_bucket
  config_name                    = var.config_name
  config_max_execution_frequency = var.config_max_execution_frequency
  config_delivery_frequency      = var.config_delivery_frequency
  include_global_resource_types  = var.include_global_resource_types
  alerts_channel                 = var.alerts_channel
  bespoke_rules                  = local.rules

  providers = {
    aws      = aws.eu_west_1
    aws.main = aws.eu_west_1
  }
}

module "opg_aws_config_sandbox_us_east" {
  source           = "./modules/account_region"
  config_iam_role  = module.opg_aws_config_sandbox_accountwide.aws_config_role
  config_s3_bucket = module.opg_aws_config_sandbox_accountwide.aws_config_s3_bucket

  providers = {
    aws      = aws.us_east_1
    aws.main = aws.eu_west_1
  }
}
