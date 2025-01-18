## Challenge 7

This challenge tests your understanding of data types in Terraform and how to dynamically extract and process data from an external CSV file.

### Tasks:

All values **must** be fetched dynamically from the `ec2.csv` file. Avoid hardcoding any values from CSV in output values.

### 1. Fetch the Data from CSV file

Create a **local value** that reads and fetches all the data from the `ec2.csv` file.


### 2. Output a List of AMI IDs from CSV

Create an **output value** named `list_amis` that dynamically generates a `list` of all AMI IDs present in the CSV file.

Reference Final Output:

```sh
list_amis = [
  "ami-01816d07b1128cd2d",
  "ami-0fd05997b4dff7aac",
  "ami-09b0a86a2c84101e1",
  "ami-0995922d49dc9a17d",
]
```
### 3. Output a Unique List of Team Names from the CSV

Create an **output value** named `unique_team_names` that contains a `list` of all unique team names from the CSV file (no duplicates allowed).

Reference Final Output:

```sh
unique_team_names     = ["DevOps","SRE","Security"]
```


### 4. Output a List of Lists for Regions

Create an **output value named** `regions_list_of_lists` that contains a list of lists, with each region name from the CSV file in its own individual list.

Reference Final Output:
```sh
regions_list_of_lists = [
  [
    "us-east-1",
  ],
  [
    "ap-south-1",
  ],
  [
    "us-east-1",
  ],
  [
    "ap-southeast-1",
  ],
]
```

### 5. Output a Filtered List of Lists Based on a Condition

Create an **output value** named `list_list_condition` that contains a list of lists, but only include rows where the `instance_type` is `nano`.

Reference Final Output:

```sh
list_list_condition = [
  [
    "ap-south-1",
  ],
  [
    "us-east-1",
  ],
]
```

### 6. Map that contains total number of instance types

Create an **output value** named `instance_count_by_type` that generates a map displaying the count of each instance_type in the CSV file.

Reference Final Output:

```sh
instance_count_by_type = {
  "micro" = 2
  "nano" = 2
}
```

### 7. List of Maps

Create an **output value** named `instance_details` that generates a list of maps, where each map contains the team and type attributes for each instance from the CSV file.

Reference Final Output:

```sh
instance_details = [
  {
    "team" = "Security"
    "type" = "micro"
  },
  {
    "team" = "SRE"
    "type" = "nano"
  },
  {
    "team" = "DevOps"
    "type" = "nano"
  },
  {
    "team" = "SRE"
    "type" = "micro"
  },
]
```
### 8. Map of Maps
Output a map of map where each unique key contains combination of instance_type, region, and Team Name. The attributes for each map must be similar to the one shown in the reference output

Reference Final Output:

```sh
map_of_maps = {
  "micro_ap-southeast-1_SRE" = {
    "ami_id" = "ami-0995922d49dc9a17d"
    "instance_type" = "micro"
    "region" = "ap-southeast-1"
    "team_name" = "SRE"
  }
  "micro_us-east-1_Security" = {
    "ami_id" = "ami-01816d07b1128cd2d"
    "instance_type" = "micro"
    "region" = "us-east-1"
    "team_name" = "Security"
  }
  "nano_ap-south-1_SRE" = {
    "ami_id" = "ami-0fd05997b4dff7aac"
    "instance_type" = "nano"
    "region" = "ap-south-1"
    "team_name" = "SRE"
  }
  "nano_us-east-1_DevOps" = {
    "ami_id" = "ami-09b0a86a2c84101e1"
    "instance_type" = "nano"
    "region" = "us-east-1"
    "team_name" = "DevOps"
  }
}
```
