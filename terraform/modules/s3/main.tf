


resource "aws_s3_bucket" "bucket" {
  bucket = "${var.env}-bucket-aishi"
  tags = {
    Name = "${var.env}-bucket-aishi"
    Environment = var.env
  }
}