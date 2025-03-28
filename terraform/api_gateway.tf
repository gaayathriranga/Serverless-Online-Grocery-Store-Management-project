

resource "aws_api_gateway_rest_api" "grocery_api" {
  name        = var.api_gateway_name
  description = "API Gateway for MyGrocery Lambda functions"
}

resource "aws_api_gateway_resource" "grocery_resource" {
  rest_api_id = aws_api_gateway_rest_api.grocery_api.id
  parent_id   = aws_api_gateway_rest_api.grocery_api.root_resource_id
  path_part   = "grocery"
}



resource "aws_api_gateway_method" "post_grocery_data" {
  rest_api_id   = aws_api_gateway_rest_api.grocery_api.id
  resource_id   = aws_api_gateway_resource.grocery_resource.id
  http_method   = "POST"
  authorization = "NONE"
}

resource "aws_api_gateway_method_response" "post_grocery_data_response_200" {
  rest_api_id = aws_api_gateway_rest_api.grocery_api.id
  resource_id = aws_api_gateway_resource.grocery_resource.id
  http_method = aws_api_gateway_method.post_grocery_data.http_method
  status_code = 200

 
  response_parameters = {
    "method.response.header.Access-Control-Allow-Headers"     = true,
    "method.response.header.Access-Control-Allow-Methods"     = true,
    "method.response.header.Access-Control-Allow-Origin"      = true,
    "method.response.header.Access-Control-Allow-Credentials" = true
  }
}

resource "aws_api_gateway_integration" "integration_post_grocery_data" {
  rest_api_id             = aws_api_gateway_rest_api.grocery_api.id
  resource_id             = aws_api_gateway_resource.grocery_resource.id
  http_method             = aws_api_gateway_method.post_grocery_data.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.upload_lambda_function.invoke_arn
}



resource "aws_api_gateway_method" "get_grocery_data" {
  rest_api_id   = aws_api_gateway_rest_api.grocery_api.id
  resource_id   = aws_api_gateway_resource.grocery_resource.id
  http_method   = "GET"
  authorization = "NONE"
}

resource "aws_api_gateway_method_response" "get_grocery_data_response_200" {
  rest_api_id = aws_api_gateway_rest_api.grocery_api.id
  resource_id = aws_api_gateway_resource.grocery_resource.id
  http_method = aws_api_gateway_method.get_grocery_data.http_method
  status_code = 200

 
   response_parameters = {
    "method.response.header.Access-Control-Allow-Headers"     = true,
    "method.response.header.Access-Control-Allow-Methods"     = true,
    "method.response.header.Access-Control-Allow-Origin"      = true,
    "method.response.header.Access-Control-Allow-Credentials" = true
  }
}

resource "aws_api_gateway_integration" "integration_get_grocery_data" {
  rest_api_id             = aws_api_gateway_rest_api.grocery_api.id
  resource_id             = aws_api_gateway_resource.grocery_resource.id
  http_method             = aws_api_gateway_method.get_grocery_data.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.get_lambda_function.invoke_arn
}



resource "aws_lambda_permission" "grocery_apigw_lambda_permission" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.upload_lambda_function.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.grocery_api.execution_arn}/*"
}

resource "aws_lambda_permission" "grocery_apigw_lambda_permission_get" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.get_lambda_function.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.grocery_api.execution_arn}/*"
}




resource "aws_api_gateway_deployment" "grocery_api_deploy" {
  rest_api_id = aws_api_gateway_rest_api.grocery_api.id
  stage_name  = var.api_gateway_stage_name
  triggers = {
    redeployment = sha1(jsonencode([
    aws_api_gateway_resource.grocery_resource,
    aws_api_gateway_integration.integration_post_grocery_data,
    aws_api_gateway_integration.integration_get_grocery_data
    ]))
  }
  lifecycle {
    create_before_destroy = true
  }
}




module "cors" {
  source = "../modules/cors"

  api_id            = aws_api_gateway_rest_api.grocery_api.id
  api_resource_id   = aws_api_gateway_resource.grocery_resource.id
  allow_credentials = true
}



