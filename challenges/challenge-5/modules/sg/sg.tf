locals {
  sg_rules = csvdecode(file("${path.module}/sg.csv"))
  # sg_rules_in  = [for x in local.local.sg_rules : x if x.direction == "in"]
  # sg_rules_out = [for x in local.local.sg_rules : x if x.direction == "out"]
  sg_rules_in_map  = { for i, v in local.sg_rules : "rule_${tostring(i)}" => v if v.direction == "in" }
  sg_rules_out_map = { for i, v in local.sg_rules : "rule_${tostring(i)}" => v if v.direction == "out" }
}

resource "aws_security_group" "sg" {
  for_each = toset(["app-1-sg", "app-2-sg"])
  vpc_id   = var.vpc_id
}

# resource "aws_vpc_security_group_ingress_rule" "ingress" {
#   count             = length(local.sg_rules_in)
#   security_group_id = aws_security_group.sg["${local.sg_rules_in[count.index].description}-sg"].id

#   cidr_ipv4   = local.sg_rules_in[count.index].cidr_block
#   ip_protocol = local.sg_rules_in[count.index].protocol
#   to_port     = local.sg_rules_in[count.index].port
#   description = local.sg_rules_in[count.index].description
# }

# resource "aws_vpc_security_group_ingress_rule" "egress" {
#   count             = length(local.sg_rules_out)
#   security_group_id = aws_security_group.sg["${local.sg_rules_out[count.index].description}-sg"].id

#   cidr_ipv4   = local.sg_rules_out[count.index].cidr_block
#   ip_protocol = local.sg_rules_out[count.index].protocol
#   to_port     = local.sg_rules_out[count.index].port
#   description = local.sg_rules_out[count.index].description
# }

resource "aws_vpc_security_group_ingress_rule" "ingress" {
  for_each          = local.sg_rules_in_map
  security_group_id = aws_security_group.sg["${each.value.description}-sg"].id

  cidr_ipv4   = each.value.cidr_block
  ip_protocol = each.value.protocol
  from_port   = each.value.port
  to_port     = each.value.port
  description = each.value.description
}

resource "aws_vpc_security_group_egress_rule" "egress" {
  for_each          = local.sg_rules_out_map
  security_group_id = aws_security_group.sg["${each.value.description}-sg"].id

  cidr_ipv4   = each.value.cidr_block
  ip_protocol = each.value.protocol
  from_port   = each.value.port
  to_port     = each.value.port
  description = each.value.description
}

variable "vpc_id" {

}
