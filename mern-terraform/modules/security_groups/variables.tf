variable "vpc_id" {
  description = "VPC ID where the security groups will be created"
  type        = string
}

variable "allowed_ssh_ip" {
  description = "Allowed IP for SSH access (e.g., your public IP)"
  type        = string
}

variable "web_subnet_cidr" {
  description = "CIDR block of the web server subnet"
  type        = string
}
