data "archive_file" "zip_upload_handler" {
type = "zip"
source_dir = "${path.module}/lambda_handlers/"
output_path = "${path.module}/lambda_handlers/upload_handler.zip"
}

data "archive_file" "zip_get_handler" {
type = "zip"
source_dir = "${path.module}/lambda_handlers/"
output_path = "${path.module}/lambda_handlers/get_handler.zip"
}



resource "aws_lambda_function" "upload_lambda_function" {
  filename      = data.archive_file.zip_upload_handler.output_path
  function_name = var.function_upload_name_lambda
  handler       = var.function_upload_handler_lambda
  role          = aws_iam_role.lambda_exec_role1.arn
  runtime       = var.runtime_version
  depends_on    = [aws_iam_role_policy_attachment.attach_iam_policy_to_iam_role]
  
  environment {
    variables = {
      BUCKET_NAME = var.website_bucket_name_public 
      DYNAMODB_TABLE = var.table_name_dynamodb
      LOG_GROUP_NAME = var.log_group_upload_cloudwatch
    }
  }
}



resource "aws_lambda_function" "get_lambda_function" {
  filename      = data.archive_file.zip_get_handler.output_path
  function_name = var.function_get_name_lambda
  handler       = var.function_get_handler_lambda
  role          = aws_iam_role.lambda_exec_role1.arn
  runtime       = var.runtime_version
  depends_on    = [aws_iam_role_policy_attachment.attach_iam_policy_to_iam_role]


  environment {
    variables = {
      BUCKET_NAME = var.website_bucket_name_public 
      DYNAMODB_TABLE = var.table_name_dynamodb
      LOG_GROUP_NAME = var.log_group_get_cloudwatch
    }
  }
}



