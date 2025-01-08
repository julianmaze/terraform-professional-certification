locals {
  encode = jsonencode({
    name   = "Alice"
    age    = 30
    skills = ["Terraform", "AWS", "Azure"]
  })

  decode = jsondecode(<<-EOT
    {
      "name": "Bob",
      "age": 25,
      "skills": ["Terraform", "AWS", "Azure"]
    }
    EOT
  )

  decode_file = jsondecode(file("${path.module}/policy.json"))
}
