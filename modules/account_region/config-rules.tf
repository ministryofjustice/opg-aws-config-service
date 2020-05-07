resource "aws_config_config_rule" "generic" {
  for_each = { for rule in local.rules : rule.name => rule }

  name             = each.value.name
  description      = each.value.description
  input_parameters = each.value.parameters

  source {
    owner             = "AWS"
    source_identifier = each.value.source_identifier
  }

  tags = var.tags

  depends_on = [aws_config_configuration_recorder.main]
}
