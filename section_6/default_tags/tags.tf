provider "aws" {
  default_tags {
    tags = {
      Team    = "Security"
      Managed = "Terraform"
      Env     = "Production"
    }
  }
}

resource "aws_security_group" "allow_tls" {
  name = "demo-firewall"

  // Override the default tags
  tags = {
    Team = "Networking"
  }
}

resource "aws_iam_user" "this" {
  name = "kplabs-user"
}
