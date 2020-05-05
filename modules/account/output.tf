output "aws_config_role" {
  description = "The AWS config role."
  value       = aws_iam_role.config
}

output "aws_config_s3_bucket" {
  description = "The AWS config s3 bucket."
  value       = aws_s3_bucket.config
}
