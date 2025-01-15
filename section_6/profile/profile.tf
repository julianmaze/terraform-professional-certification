provider "aws" {
  profile = "182758033613_AdministratorAccess"
}

resource "aws_security_group" "allow_tls" {
  name = "demo-firewall"
}
