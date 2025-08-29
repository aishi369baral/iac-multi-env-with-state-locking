resource "aws_s3_bucket" "bucket" {
  bucket = "remote-bucket-aishi"
  tags = {
    Name = "remote-bucket-aishi"
  
  }
}