locals {
  rules = jsondecode(file("${path.module}/rules.json"))
}
