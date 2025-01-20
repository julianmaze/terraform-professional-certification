terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.80.0"
    }
  }
}

// Default provider, use ro-user and assume the ReadOnlyRole
provider "aws" {
  region                   = "us-east-1"
  shared_config_files      = ["./.aws/conf"]
  shared_credentials_files = ["./.aws/credentials"]
  profile                  = "ro-user"
  assume_role {
    role_arn = "arn:aws:iam::0123456789:role/ReadOnlyRole"
  }
}

// asg provider
provider "aws" {
  region                   = "us-east-1"
  shared_config_files      = ["./.aws/conf"]
  shared_credentials_files = ["./.aws/credentials"]
  profile                  = "asg"
  alias                    = "asg"
}

// iam provider
provider "aws" {
  region                   = "us-east-1"
  shared_config_files      = ["./.aws/conf"]
  shared_credentials_files = ["./.aws/credentials"]
  profile                  = "iam"
  alias                    = "iam"
}

data "aws_caller_identity" "local" {}

resource "local_file" "this" {
  content  = data.aws_caller_identity.local.account_id
  filename = "account-number.txt"
}

module "asg" {
  source = "./modules/asg"
  providers = {
    aws = aws.asg
  }
}

module "iam" {
  source = "./modules/iam"
  providers = {
    aws = aws.iam
  }
}
