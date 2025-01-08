locals {
  json_array_of_objects = <<EOT
  [
    { "name": "Alice", "age": 25 },
    { "name": "Bob", "age": 28 },
    { "name": "Charlie", "age": 35 }
  ]
  EOT

  array_of_objects = jsondecode(local.json_array_of_objects)

  first_object              = local.array_of_objects[0]
  first_object_element      = element(local.array_of_objects, 0)
  first_object_name         = local.array_of_objects[0]["name"]
  first_object_element_name = element(local.array_of_objects, 0).name
}
