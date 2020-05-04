variable "config_logs_prefix" {
  description = "The S3 prefix for AWS Config logs."
  type        = string
  default     = "config"
}

variable "config_name" {
  description = "The name of the AWS Config instance."
  type        = string
  default     = "aws-config"
}

variable "config_logs_bucket_prefix" {
  type    = string
  default = "config-logs"
}

variable "is_production" {
  type    = bool
  default = false
}
