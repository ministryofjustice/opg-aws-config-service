module "aws_config_sandbox_accountwide" {
  source                 = "../modules/account"
  config_logs_prefix     = var.config_logs_prefix
  config_name            = var.config_name
  config_aggregator_name = var.config_aggregator_name
  aggregate_organization = var.aggregate_organization
  tags                   = local.default_tags

  providers = {
    aws = aws.main_region_provider
  }
}

/*
Use whichever region you are applying config rules against as aws provider.
Use your home/main region as aws.main_region_provider as the bucket and role
are imported as data sources from this region.
*/
module "aws_config_sandbox_eu_west" {
  source                           = "../modules/account_region"
  config_iam_role                  = module.aws_config_sandbox_accountwide.aws_config_role
  config_s3_bucket                 = module.aws_config_sandbox_accountwide.aws_config_s3_bucket
  config_name                      = var.config_name
  rule_maximum_execution_frequency = var.rule_maximum_execution_frequency
  config_delivery_frequency        = var.config_delivery_frequency
  include_global_resource_types    = var.include_global_resource_types
  bespoke_rules                    = local.rules
  tags                             = local.default_tags

  providers = {
    aws                      = aws.main_region_provider
    aws.main_region_provider = aws.main_region_provider
  }
}

module "aws_config_sandbox_us_east" {
  source           = "../modules/account_region"
  config_iam_role  = module.aws_config_sandbox_accountwide.aws_config_role
  config_s3_bucket = module.aws_config_sandbox_accountwide.aws_config_s3_bucket
  config_name      = var.config_name
  tags             = local.default_tags

  providers = {
    aws      = aws.us_east_1
    aws.main = aws.main_region_provider
  }
}
