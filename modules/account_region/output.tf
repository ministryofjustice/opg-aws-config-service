output "aws_sns_topic" {
  description = "The AWS SNS topic for config role."
  value       = aws_sns_topic.config
}

output "aws_config_recorder" {
  description = "The AWS config recorder."
  value       = aws_config_configuration_recorder.main
}

output "aws_config_recorder_status" {
  description = "The AWS config recorder."
  value       = aws_config_configuration_recorder_status.main
}
