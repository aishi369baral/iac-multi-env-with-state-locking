terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.80.0"
    }
  }
  backend "s3" {
  bucket="remote-bucket-aishi"
  key="dev/terraform.tfstate"
  region="us-east-2"
  dynamodb_table="remote-app-table"

  }
}
