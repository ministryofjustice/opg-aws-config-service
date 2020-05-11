locals {
  rules                  = jsondecode(file("${path.module}/rules.json"))
  aggregate_organization = false

  default_tags = {
    default-tag = "A Tag"
  }
}
