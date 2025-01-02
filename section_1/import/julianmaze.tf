# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform from "Z0407921W5XGEPSJT29J"
resource "aws_route53_zone" "julianmaze" {
  comment           = "Voltaire and Gila DNS"
  delegation_set_id = null
  force_destroy     = null
  name              = "julianmaze.com"
  tags              = {}
  tags_all          = {}
  vpc {
    vpc_id     = "vpc-0bb9201d536b22c12"
    vpc_region = "us-west-2"
  }
}
