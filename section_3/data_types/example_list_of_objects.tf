variable "list_of_objects" {
  type = list(object({
    name = string
    age  = number
    tags = map(string)
  }))
  default = [
    {
      name = "alice"
      age  = 32
      tags = {
        "env"  = "dev",
        "name" = "alice"
      }
    }
  ]
}
