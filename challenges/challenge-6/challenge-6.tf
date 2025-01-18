terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.80.0"
    }
  }
}

provider "aws" {
 region = "us-east-1"
}

resource "aws_security_group" "allow_tls" {
  name        = "demo-firewall"

}

data "aws_caller_identity" "current" {}

output "account_id" {
  value = data.aws_caller_identity.current.account_id
}


resource "aws_iam_role" "cw_full_access" {
  name = "CloudWatchFullAccess"
  managed_policy_arns = ["arn:aws:iam::aws:policy/CloudWatchFullAccess"] 

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        AWS = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
      }
      Action = "sts:AssumeRole"
    }]
  })
}
