run "test_run" {
  command = plan

  assert {
    condition     = length(var.s3_bucket_name) > 3
    error_message = "S3 bucket name must be greater than 3 characters"
  }
}
