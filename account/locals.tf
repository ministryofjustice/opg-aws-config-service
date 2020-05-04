locals {
  environment = terraform.workspace

  default_tags = {
    business-unit          = "OPG"
    application            = "AWS-Config"
    environment-name       = local.environment
    owner                  = "OPG Supervision"
    infrastructure-support = "OPG WebOps: opgteam@digital.justice.gov.uk"
    is-production          = var.is_production
    source-code            = "https://github.com/ministryofjustice/opg-aws-config-service"
  }
}

