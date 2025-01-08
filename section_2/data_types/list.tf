variable "list" {
  type    = list(string)
  default = ["value", "value2"]
}

output "index0" {
  value = var.list[0]
}
