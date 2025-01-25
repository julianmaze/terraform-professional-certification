locals {
  ec2                 = csvdecode(file("${path.module}/ec2.csv"))
  ec2_lower_case_keys = [for x in local.ec2 : { for k, v in x : lower(k) => v }]

  instance_types = distinct([for x in local.ec2 : x.instance_type])
  instance_types_count = { for x in local.instance_types : x =>
    length([for y in local.ec2 : y.instance_type if y.instance_type == x])
  }

  instance_details = [for x in local.ec2 : {
    team = x.Team_Name
    type = x.instance_type
  }]

  map_of_maps = { for x in local.ec2_lower_case_keys : "${x.instance_type}_${x.region}_${x.team_name}" => x }
}

output "list_amis" {
  value = [for x in local.ec2 : x.AMI_ID]
}

output "unique_team_names" {
  value = distinct([for x in local.ec2 : x.Team_Name])
}

output "regions_list_of_lists" {
  value = [for x in local.ec2 : [x.Region]]
}

output "list_list_condition" {
  value = [for x in local.ec2 : [x.Region] if x.instance_type == "nano"]
}

output "instance_count_by_type" {
  value = local.instance_types_count
}

output "instance_details" {
  value = local.instance_details
}

output "map_of_maps" {
  value = local.map_of_maps
}
