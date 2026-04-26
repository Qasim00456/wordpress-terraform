variable "instance_type" {
    type = string
    default = "t3.micro"
  
}
locals {
  EC2_AMI = "ami-0685f8dd865c8e389"
}

variable "subnet_id" {
  type = string
}
variable "sg_rules" {
  type = string
  
}