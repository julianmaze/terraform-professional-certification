provider "aws" {
  shared_config_files      = ["C:/other_aws_path/config"]
  shared_credentials_files = ["C:/other_aws_path/credentials"]
}

resource "aws_security_group" "allow_tls" {
  name = "demo-firewall"
}
