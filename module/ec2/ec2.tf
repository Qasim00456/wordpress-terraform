resource "aws_instance" "wordpress" {
  instance_type = var.instance_type
  ami           =  local.EC2_AMI
  subnet_id = var.subnet_id
  security_groups = [ var.sg_rules ]

  user_data = file("${path.module}/cloud-init.sh")

tags = {
  name = "wordpress-instance"
}

}