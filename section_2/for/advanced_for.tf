variable "ami" {
  type = map(any)
  default = {
    dev = "ami-123"
    stg = "ami-456"
    prd = "ami-789"
  }
}

output "upper_case_keys" {
  value = [for key, value in var.ami : upper(key)]
}

output "two_symbol_on_list" {
  value = [for i, v in var.user_names : "index: ${i}, value: ${v}"]
}

output "upper_case_alice" {
  value = [for k, v in var.user_names : upper(v) if v == "alice"]
}

output "map_upper_case" {
  value = { for x in var.user_names : x => upper(x) }
}
