locals {
  rules                  = jsondecode(file("${path.module}/rules.json"))
  aggregate_organization = false

}
