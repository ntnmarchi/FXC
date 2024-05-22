# I like to opinionate VPCs so that they remain consistent across environments, hence the hard-coded values
module "fxc-network" {
  source  = "terraform-aws-modules/vpc/aws"
  
  name = var.vpc_name
  cidr = "10.0.0.0/16" # 65,536 IP addresses  

  azs             = var.availability_zones
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  enable_nat_gateway = true
  single_nat_gateway = true

  tags = var.tags
}
