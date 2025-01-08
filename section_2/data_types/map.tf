variable "map" {
  type = map(string)
  default = {
    Name        = "server"
    Environment = "development"
    Security    = "strict"
  }
}
