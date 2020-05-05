output "aws_config_role" {
  description = "The AWS config role."
  value       = module.opg_aws_config_myaccount_accountwide.aws_config_role
}

output "aws_config_s3_bucket" {
  description = "The AWS config s3 bucket."
  value       = module.opg_aws_config_myaccount_accountwide.aws_config_s3_bucket
}
