locals {
  index_zero         = local.decode.skills[0]
  index_zero_element = element(local.decode.skills, 0)
}
