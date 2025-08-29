resource "random_id" "suffix" {
  byte_length = 4
}


resource "aws_s3_bucket" "bucket" {
  bucket = "${var.env}-bucket-${random_id.suffix.hex}"
  tags = {
    Name = "${var.env}-bucket"
    Environment = var.env
  }
}