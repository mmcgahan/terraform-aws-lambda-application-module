resource "aws_lambda_event_source_mapping" "msk_event_source" {
  for_each = var.msk_event_source_config

  event_source_arn  = var.msk_arn
  function_name     = "${aws_lambda_function.lambda_application[each.key].function_name}:${var.alias_name}"
  topics            = each.value.topics
  starting_position = each.value.starting_position
  batch_size        = each.value.batch_size
}
