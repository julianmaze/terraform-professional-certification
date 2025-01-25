terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.80.0"
    }
  }
}

// IAM Access
provider "aws" {
  shared_config_files      = ["./.aws/config"]
  shared_credentials_files = ["./.aws/credentials"]
  profile                  = "iam-access"
  alias                    = "iam"
}

// EC2 access
provider "aws" {
  shared_config_files      = ["./.aws/config"]
  shared_credentials_files = ["./.aws/credentials"]
  profile                  = "ec2-access"
  alias                    = "ec2"
}

// Read only access
provider "aws" {
  shared_config_files      = ["./.aws/config"]
  shared_credentials_files = ["./base-folder/default-creds.txt"]
  profile                  = "readonly-access"
  alias                    = "read"
}

resource "aws_security_group" "allow_tls" {
  name     = "demo-firewall"
  provider = aws.ec2

}

data "aws_caller_identity" "current" {
  provider = aws.read
}

output "account_id" {
  value = data.aws_caller_identity.current.account_id
}


resource "aws_iam_role" "cw_full_access" {
  name = "CloudWatchFullAccess"

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
  provider = aws.iam
}

resource "aws_iam_role_policy_attachment" "cw_full_access_attach" {
  role       = aws_iam_role.cw_full_access.name
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchFullAccess"
  provider   = aws.iam
}
