
variable "map" {
  type = object({
    Name              = string
    Environment       = string
    SecurityGroupList = list(string)
    Tags              = map(string)
    Id                = number
  })
  default = {
    Id                = 1
    Name              = "server"
    Environment       = "development"
    SecurityGroupList = ["sg1", "sg2"]
    Tags = {
      Name        = "server"
      Environment = "development"
      Security    = "strict"
    }
  }
}
