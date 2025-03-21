# Call the VPC module to create networking resources
module "vpc" {
  source = "./modules/vpc"
}

module "security_groups" {
  source = "./modules/security_groups"

  vpc_id          = module.vpc.vpc_id
  allowed_ssh_ip  = "0.0.0.0/0"
  web_subnet_cidr = module.vpc.public_subnet_cidr
}

module "ec2" {
  source               = "./modules/ec2"
  public_subnet_id     = module.vpc.public_subnet_id
  private_subnet_id    = module.vpc.private_subnet_id
  key_pair_name        = var.key_pair_name
  web_sg_id            = module.security_groups.web_sg_id
  db_sg_id             = module.security_groups.db_sg_id
  iam_instance_profile = module.iam.iam_instance_profile
}


module "iam" {
  source = "./modules/iam"
}
