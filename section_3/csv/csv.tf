locals {
  # csvdecode creates a list of maps
  csv = csvdecode(file("${path.module}/data.csv"))
}

resource "aws_instance" "instance" {
  for_each      = { for x in local.csv : x.instance_id => x }
  ami           = each.value.ami
  instance_type = each.value.instance_type
}
