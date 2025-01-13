variable "list_of_list" {
  type    = list(list(string))
  default = [["alice", "james"], ["bob"], ["john"]]
}
