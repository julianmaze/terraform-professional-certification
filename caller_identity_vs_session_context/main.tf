provider "aws" {
  region     = "us-west-2"
  access_key = "xxxxxxxxxxxxxxxxx"
  secret_key = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
  assume_role {
    role_arn     = "arn:aws:iam::0123456789012:role/terraform-pro"
    session_name = "terraformyew"
  }
}

data "aws_caller_identity" "current" {}

data "aws_iam_session_context" "current" {
  arn = data.aws_caller_identity.current.arn
}

output "caller_identity" {
  value = data.aws_caller_identity.current
}

output "session_context" {
  value = data.aws_iam_session_context.current
}
