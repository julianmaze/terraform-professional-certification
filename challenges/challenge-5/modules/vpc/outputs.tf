output "subnet_ids" {
  value = [for x in aws_subnet.challenge_5 : x.id]
}

output "vpc_id" {
  value = aws_vpc.main.id
}
