
module "ec2" {
  source = "./module/ec2"
  subnet_id = module.vpc.subnets
  sg_rules = module.vpc.sg_id
}

module "vpc" {
    source = "./module/vpc"
  
}
