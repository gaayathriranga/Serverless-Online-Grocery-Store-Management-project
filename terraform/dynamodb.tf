
resource "aws_dynamodb_table" "product_table" {
  name           = var.table_name_dynamodb
  billing_mode   = "PROVISIONED"
  hash_key       = "customerName"
  read_capacity    = 5
  write_capacity   = 5

  attribute {
    name = "customerName"
    type = "S"
  }


}
