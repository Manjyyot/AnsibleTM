# Web Server in Public Subnet
resource "aws_instance" "web_server" {
  ami           = "ami-04b4f1a9cf54c11d0"
  instance_type = "t2.micro"
  subnet_id     = var.public_subnet_id
  key_name      = var.key_pair_name
  security_groups = [var.web_sg_id]  # 🔹 Dynamically using Security Group
  iam_instance_profile = var.iam_instance_profile # 🔹 Dynamically using IAM Role

  tags = {
    Name = "MERN-Web-Server"
  }
}

# Database Server in Private Subnet
resource "aws_instance" "db_server" {
  ami           = "ami-04b4f1a9cf54c11d0"
  instance_type = "t2.micro"
  subnet_id     = var.private_subnet_id
  key_name      = var.key_pair_name
  security_groups = [var.db_sg_id]  # 🔹 Dynamically using Security Group
  iam_instance_profile = var.iam_instance_profile # 🔹 Dynamically using IAM Role

  tags = {
    Name = "MERN-DB-Server"
  }
}
