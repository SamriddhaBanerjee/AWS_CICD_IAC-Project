module "vpc" {
  source = "../../modules/vpc"

  environment          = "acc"
  vpc_cidr             = "10.0.0.0/20"
  public_subnet_cidr_1 = "10.0.10.0/24"
  public_subnet_cidr_2 = "10.0.15.0/24"
  availability_zone_1  = "ap-south-1a"
  availability_zone_2  = "ap-south-1b"
}

module "security_group" {
  source      = "../../modules/security-groups"
  name        = "acc-app-sg"
  description = "acceptance security groups"
  vpc_id      = module.vpc.vpc_id
  ingress_rules = [ 
    {
      description = "HTTPS"
      from_port=[80,443]
      to_port = [80,443]
      protocol = "TCP"
    }
   ]
  egress_rules = [ 
    {
      description = "HTTPS"
      from_port=[80,443]
      to_port = [80,443]
      protocol = "TCP"
    }
   ]
}

module "ec2" {
  source            = "../../modules/ec2"
  name              = "acc-instance"
  ami_id            = "ami-0bca660a856fc8c72"
  instance_type     = "t3.micro"
  subnet_id         = module.vpc.public_sub_1
  security_group_id = [module.security_group.security_group_id]
  root_volume_size = 50
}
