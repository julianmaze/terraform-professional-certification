data "aws_caller_identity" "this" {}

output "this" {
  value = data.aws_caller_identity.this.*
}
