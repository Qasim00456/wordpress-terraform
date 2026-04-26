resource "aws_instance" "wordpress" {
  instance_type = var.instance_type
  ami           = local.EC2_AMI
  subnet_id     = var.subnet_id
  vpc_security_group_ids = [var.sg_rules]

  user_data = file("${path.module}/cloud-init.sh")

  tags = {
    Name = "wordpress-instance"
  }

}
