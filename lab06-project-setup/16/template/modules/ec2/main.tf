resource "aws_instance" "ec2_instance" {
  ami             = var.ami
  instance_type   = "t2.micro"
  key_name        = var.key_name
  subnet_id       = var.subnet_id
  security_groups = var.security_groups

  tags = {
    Name = var.name
  }
}
