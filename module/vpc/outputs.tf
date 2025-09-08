output "subnets" {
  value = aws_subnet.wordpress_subnet.id
}

output "sg_id" {
  value = aws_security_group.wordpress_sg.id
}