variable "config_name" {
  description = "The name of the AWS Config instance."
  type        = string
}

variable "config_aggregator_name" {
  description = "The name of the aggregator."
  type        = string
}

variable "config_logs_prefix" {
  description = "The S3 prefix for AWS Config logs."
  type        = string
  default     = "config"
}

variable "aggregate_organization" {
  description = "Aggregate compliance data by organization"
  type        = bool
  default     = false
}

variable "is_production" {
  type    = bool
  default = false
}

variable "tags" {
  type        = map(string)
  description = "A map of tags to add to all resources"
  default     = {}
}
