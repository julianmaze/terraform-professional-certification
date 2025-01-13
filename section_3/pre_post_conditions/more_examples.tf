# Create a local app.txt file only if the db.txt file exists
resource "local_file" "app.txt" {
  filename = "app.txt"
  content  = "Sample App Content"

  lifecycle {
    precondition {
      condition     = fileexists("${path.module}/db.txt")
      error_message = "The db.txt file must exist."
    }
  }
}

# Create a local app.txt file only if the db.txt file exists and is not empty
resource "local_file" "app.txt2" {
  filename = "app.txt"
  content  = "Sample App Content"

  lifecycle {
    precondition {
      condition     = fileexists("${path.module}/db.txt") && file("${path.module}/db.txt") != ""
      error_message = "The db.txt file must exist."
    }
  }
}

# Create a local sensitive.txt file only if the environment is production
variable "environment" {}

resource "local_file" "sensitive_data" {
  filename = "sensitive.txt"
  content  = "This is sensitive data"

  lifecycle {
    precondition {
      condition     = var.environment == "production"
      error_message = "Sensitive File can only be created in Production."
    }
  }
}

# Create a local sensitive.txt file only if the environment is production and the app.txt file exists
resource "local_file" "sensitive_data2" {
  filename = "sensitive.txt"
  content  = "This is sensitive data"

  lifecycle {
    precondition {
      condition     = var.environment == "production"
      error_message = "Sensitive File can only be created in Production."
    }
    precondition {
      condition     = fileexists("${path.module}/app.txt")
      error_message = "app.txt must be present."
    }
  }
}
