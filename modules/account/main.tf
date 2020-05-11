# Get the access to the effective Account ID in which Terraform is working.
data "aws_partition" "current" {}

data "aws_caller_identity" "current" {}
