resource "aws_cloudwatch_log_group" "upload_log_group" {
  name              = var.log_group_upload_cloudwatch
  retention_in_days = 14
  tags              = var.tags
}

resource "aws_cloudwatch_log_group" "get_log_group" {
  name              = var.log_group_get_cloudwatch
  retention_in_days = 14
  tags              = var.tags
}
