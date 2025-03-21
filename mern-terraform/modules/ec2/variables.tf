variable "public_subnet_id" {
  description = "Public subnet ID from networking module"
  type        = string
}

variable "private_subnet_id" {
  description = "Private subnet ID from networking module"
  type        = string
}

variable "key_pair_name" {
  description = "SSH Key Pair name for EC2 access"
  type        = string
}

variable "web_sg_id" {
  description = "Security Group ID for the web server"
  type        = string
}

variable "db_sg_id" {
  description = "Security Group ID for the database server"
  type        = string
}

variable "iam_instance_profile" {
  description = "IAM Instance Profile name for EC2 instances"
  type        = string
}
