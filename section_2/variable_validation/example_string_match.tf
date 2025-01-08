variable "email_id" {
  type = string

  validation {
    condition     = can(regex("^\\S+@\\S+\\.\\S+$", var.email_id))
    error_message = "The email must be a valid email address"
  }
}
