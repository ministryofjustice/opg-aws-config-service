resource "aws_config_config_rule" "rules" {
  for_each = { for rule in local.rules : rule.name => rule }

  name                        = each.value.name
  description                 = each.value.description
  input_parameters            = each.value.parameters
  maximum_execution_frequency = lookup(each.value, "rule_maximum_execution_frequency", var.rule_maximum_execution_frequency)

  source {
    owner             = "AWS"
    source_identifier = each.value.source_identifier
  }

  tags = var.tags

  depends_on = [aws_config_configuration_recorder.main]
}
