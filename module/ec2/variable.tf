variable "instance_type" {
    type = string
    default = "t3.micro"
  
}
locals {
  EC2_AMI = "ami-0c4fc5dcabc9df21d"
}

variable "subnet_id" {
  type = string
}
variable "sg_rules" {
  type = string
  
}