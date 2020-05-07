variable "config_aggregator_name" {
  description = "The name of the aggregator."
  type        = string
  default     = "organization"
}

variable "config_name" {
  description = "The name of the AWS Config instance."
  type        = string
  default     = "aws-config"
}

variable "aggregate_organization" {
  description = "Aggregate compliance data by organization"
  type        = bool
  default     = false
}

variable "config_logs_prefix" {
  description = "The S3 prefix for AWS Config logs that is subfolder within bucket."
  type        = string
  default     = "config"
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
