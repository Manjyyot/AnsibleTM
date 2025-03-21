variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}
variable "key_pair_name" {
  description = "The name of the AWS key pair to use for SSH access"
  type        = string
}
