variable "map_of_lists" {
  type = map(list(string))
  default = {
    name  = ["alice"],
    names = ["bob"]
  }
}
