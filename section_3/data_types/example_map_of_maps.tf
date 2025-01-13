variable "map_of_maps" {
  type = map(map(string))
  default = {
    dev = {
      instance_type = "t2.micro"
      Name          = "dev-server"
    },
    prod = {
      instance_type = "m5.large"
      Name          = "prod-server"
    }
  }
}
