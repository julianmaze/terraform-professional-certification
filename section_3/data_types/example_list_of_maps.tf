variable "list_of_maps" {
  type = list(map(string))
  default = [
    {
      user  = "alice"
      email = "alice@kplabs.in"
    },
    {
      user  = "bob"
      email = "bob@kplabs.in"
    }
  ]
}
