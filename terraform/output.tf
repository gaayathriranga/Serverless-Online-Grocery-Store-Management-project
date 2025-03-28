output "terraform_aws_role_output" {
  value = aws_iam_role.lambda_exec_role1.name
}

output "terraform_aws_role_arn_output" {
  value = aws_iam_role.lambda_exec_role1.arn
}

output "terraform_logging_arn_output" {
  value = aws_iam_policy.grocery_store_lambda.arn
}



output "website_url" {
  value = aws_s3_bucket_website_configuration.public_website_bucket_website.website_endpoint
}



output "api_url" {
  value = "${aws_api_gateway_deployment.grocery_api_deploy.invoke_url}/grocery"
}


resource "local_file" "api_url_js" {
  depends_on = [
    aws_api_gateway_deployment.grocery_api_deploy
  ]

  filename = "front-end/api_url.js"
  content  = <<EOT
var apiUrl = {
  APIInvokeURL: "${aws_api_gateway_deployment.grocery_api_deploy.invoke_url}/grocery"
};

module.exports = apiUrl;
EOT
}






