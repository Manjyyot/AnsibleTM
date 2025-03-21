# Web Server Public IP
output "web_server_public_ip" {
  description = "Public IP of the Web Server"
  value       = module.ec2.web_server_public_ip
}

# Database Server Private IP
output "db_server_private_ip" {
  description = "Private IP of the Database Server"
  value       = module.ec2.db_server_private_ip
}

# Security Groups
output "web_sg_id" {
  description = "ID of the Web Server Security Group"
  value       = module.security_groups.web_sg_id
}

output "db_sg_id" {
  description = "ID of the Database Security Group"
  value       = module.security_groups.db_sg_id
}

# VPC and Subnets
output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}

output "public_subnet_id" {
  description = "Public Subnet ID"
  value       = module.vpc.public_subnet_id
}

output "private_subnet_id" {
  description = "Private Subnet ID"
  value       = module.vpc.private_subnet_id
}
