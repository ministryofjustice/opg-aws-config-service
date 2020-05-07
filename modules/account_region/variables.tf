variable "config_name" {
  description = "The name of the AWS Config instance."
  type        = string
}

variable "rule_maximum_execution_frequency" {
  description = "The maximum frequency with which AWS Config runs evaluations for a rule."
  type        = string
  default     = "TwentyFour_Hours"
}

variable "config_delivery_frequency" {
  description = "The frequency with which AWS Config delivers configuration snapshots."
  default     = "Six_Hours"
  type        = string
}

variable "include_global_resource_types" {
  description = "Specifies whether AWS Config includes all supported types of global resources with the resources that it records."
  type        = bool
  default     = true
}

variable "config_logs_prefix" {
  description = "The S3 prefix for AWS Config logs."
  type        = string
  default     = "config"
}

variable "tags" {
  type        = map(string)
  description = "A map of tags to add to all resources"
  default     = {}
}

variable "bespoke_rules" {
  default = {}
}

variable "config_iam_role" {}

variable "config_s3_bucket" {}
