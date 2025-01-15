provider "aws" {
  region = "us-west-2"
}

provider "aws" {
  region = "us-west-1"
  alias  = "northern_california"
}

provider "aws" {
  region = "us-east-1"
  alias  = "virginia"
}

resource "aws_security_group" "allow_tls_oregon" {
  provider = aws // This is the default provider, so it is not necessary to specify it
  name     = "demo-firewall"
}
resource "aws_security_group" "allow_tls_norcal" {
  provider = aws.northern_california
  name     = "demo-firewall"
}
resource "aws_security_group" "allow_tls_virginia" {
  provider = aws.virginia
  name     = "demo-firewall"
}
