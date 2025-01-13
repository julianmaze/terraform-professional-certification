variable "s3_bucket_name" {
  default = "sample-kplabs-bucket"
}

resource "aws_s3_bucket" "example" {
  bucket = var.s3_bucket_name
}
