output "name" {
  value = aws_instance.ec2_instance.name
}

output "key_name" {
  value = aws_instance.ec2_instance.key_name
}

output "subnet_id" {
  value = aws_instance.ec2_instance.subnet_id
}

output "security_groups" {
  value = aws_instance.ec2_instance.security_groups
}
