resource "aws_dynamodb_table" "my_table" {
    name = "${var.env}-app-table"
    billing_mode = "PAY_PER_REQUEST"
    hash_key = var.hash_key
    attribute {
      name = var.hash_key
      type = "S"
    }
    tags = {
      Name = "${var.env}-app-table"
      Environment = var.env
    }
  
}