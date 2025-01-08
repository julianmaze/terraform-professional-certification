# The old method - using a data block to look for failures
# data "http" "example" {
#       url = "https://google1231233dsd.com"
#   }

# New method - using a check block to assert the condition
check "website_checker" {
  data "http" "example" {
    url = "https://google1231233dsd.com"
  }

  assert {
    condition     = data.http.example.status_code == 200
    error_message = "Website is not running. Please check"
  }
}

resource "local_file" "foo" {
  content  = "Hi"
  filename = "${path.module}/foo.txt"
}
