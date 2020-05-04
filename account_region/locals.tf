locals {
  environment = terraform.workspace

  default_tags = {
    business-unit          = "OPG"
    application            = "AWS-Config"
    environment-name       = local.environment
    owner                  = "OPG Supervision"
    infrastructure-support = "OPG WebOps: opgteam@digital.justice.gov.uk"
    is-production          = "true"
    source-code            = "https://github.com/ministryofjustice/opg-aws-config"
  }

  rules = jsondecode(file("${path.module}/rules.json"))

}


