locals {
  environment = terraform.workspace
  inner_rules = jsondecode(file("${path.module}/rules.json"))
  rules       = merge(local.inner_rules, var.bespoke_rules)
}
