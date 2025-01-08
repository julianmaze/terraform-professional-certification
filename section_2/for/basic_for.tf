variable "user_names" {
  type    = list(string)
  default = ["alice", "bob", "john"]
}

output "for_expression" {
  value = [for zeal in var.user_names : upper(zeal)]
}
