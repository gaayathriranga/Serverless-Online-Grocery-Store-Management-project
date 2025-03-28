variable "region_aws" {
  default = "eu-central-1"
}


variable "access_key" {
  description = "AWS access key"
  type        = string
}

variable "secret_key" {
  description = "AWS secret key"
  type        = string
}


variable "website_bucket_name_public" {
  default = "my-grocery-bucket-3"
}

variable "web_hosting_folder_s3" {
  default = "MyGrocery"
}

variable "web_hosting_file_s3" {
  default = "index.html"
}

variable "tags" {
  default = {
    "Environment" = "dev"
    "Name"        = "MyGroceryApp"
  }
}

variable "js_file" {
  default = {
    "script.js" = "application/javascript"
  }
}

variable "api_url_js_file" {
  default = {
    "api_url.js" = "application/javascript"
  }
}


variable "table_name_dynamodb" {
  default = "mygrocery-product"
}

variable "function_upload_name_lambda" {
  default = "mygrocery_put_object"
}

variable "function_upload_handler_lambda" {
  default = "upload_handler.lambda_handler"
}

variable "function_get_name_lambda" {
  default = "mygrocery_get_object"
}

variable "function_get_handler_lambda" {
  default = "get_handler.lambda_handler"
}

variable "log_group_upload_cloudwatch" {
  default = "product-upload-lambda"
}

variable "log_group_get_cloudwatch" {
  default = "product-get-lambda"
}

variable "runtime_version" {
  default = "python3.8"
}

variable "api_gateway_name" {
  default = "mygrocery-api"
}

variable "api_gateway_stage_name" {
  default = "dev"
}
