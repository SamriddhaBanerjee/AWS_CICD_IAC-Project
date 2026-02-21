module "vpc" {
  source = "../../modules/vpc"

  environment          = "dev"
  vpc_cidr             = "10.0.0.0/20"
  public_subnet_cidr_1 = "10.0.1.0/24"
  public_subnet_cidr_2 = "10.0.2.0/24"
  availability_zone_1  = "ap-south-1a"
  availability_zone_2  = "ap-south-1b"
}

module "security_group" {
  source      = "../../modules/security-groups"
  name        = "dev-app-sg"
  description = "development security groups"
  vpc_id      = module.vpc.vpc_id

}

module "ec2" {
  source            = "../../modules/ec2"
  name              = "dev-instance"
  ami_id            = "ami-0bca660a856fc8c72"
  instance_type     = "t3.micro"
  subnet_id         = module.vpc.public_sub_1
  security_group_id = [module.security_group.security_group_id]
}
