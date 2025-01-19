resource "aws_s3_bucket" "example" {
  for_each = var.s3_buckets
  bucket   = "${var.pet_id}-${each.value}"
}

resource "aws_s3_object" "object" {
  for_each = var.s3_buckets
  bucket   = aws_s3_bucket.example[each.key].id
  key      = var.s3_base_object
}
