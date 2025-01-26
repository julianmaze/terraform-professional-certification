locals {
  vpc    = "central-vpc"
  vpc-id = "vpc-07f268616c64f0312"
  subnets = toset([
    "app-subnet",
    "database-subnet",
    "central-subnet"
  ])

  sg    = csvdecode(file("${path.module}/sg.csv"))
  sg_in = [for x in local.sg : x if x.direction == "in"]

  cidr = {
    app        = data.aws_subnet.subnets["app-subnet"].cidr_block
    database   = data.aws_subnet.subnets["database-subnet"].cidr_block
    monitoring = data.aws_subnet.subnets["central-subnet"].cidr_block
    anti-virus = data.aws_subnet.subnets["central-subnet"].cidr_block
  }

  sg_in_to_create = { for itr, x in local.sg_in : tostring(itr) => {
    cidr     = lookup(local.cidr, x.cidr_block)
    protocol = x.protocol
    fromPort = element(split("-", x.port), 0)
    toPort   = length(split("-", x.port)) == 2 ? element(split("-", x.port), 1) : element(split("-", x.port), 0)
  } }
}

data "aws_subnet" "subnets" {
  for_each = local.subnets
  filter {
    name   = "tag:Name"
    values = [each.value]
  }
  vpc_id = local.vpc-id
}

output "subnet_ids" {
  value = { for x in local.subnets : x => data.aws_subnet.subnets[x].id }
}

resource "aws_security_group" "sg" {
  name   = "kplabs-sg"
  vpc_id = local.vpc-id
}

resource "aws_vpc_security_group_ingress_rule" "in" {
  for_each          = local.sg_in_to_create
  security_group_id = aws_security_group.sg.id

  cidr_ipv4   = each.value.cidr
  from_port   = each.value.fromPort
  ip_protocol = each.value.protocol
  to_port     = each.value.toPort
}

output "filtered_data" {
  value = { for k, v in local.sg_in_to_create : k => {
    cidr_block = v.cidr
    from_port  = v.fromPort
    to_port    = v.toPort
  } }
}
