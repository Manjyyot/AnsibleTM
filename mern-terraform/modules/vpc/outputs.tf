# Output VPC ID
output "vpc_id" {
  value       = aws_vpc.main_vpc.id
  description = "ID of the created VPC"
}

# Output Public Subnet ID
output "public_subnet_id" {
  value       = aws_subnet.public_subnet.id
  description = "ID of the public subnet"
}

# Output Private Subnet ID
output "private_subnet_id" {
  value       = aws_subnet.private_subnet.id
  description = "ID of the private subnet"
}

# Output Internet Gateway ID
output "igw_id" {
  value       = aws_internet_gateway.igw.id
  description = "ID of the Internet Gateway"
}

# Output NAT Gateway ID
output "nat_gateway_id" {
  value       = aws_nat_gateway.nat.id
  description = "ID of the NAT Gateway"
}

output "public_subnet_cidr" {
  value = aws_subnet.public_subnet.cidr_block
}
