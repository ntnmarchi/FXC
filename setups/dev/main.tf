locals {
  name_prefix = "${var.environment}-fxc"
  tags = {
    Environment = title("${var.environment}")
    Team        = "fxc"
    Project     = "test"
  }
}

module "network" {
  source             = "../../modules/fxc-network" # Update this path to your actual module location
  vpc_name           = "${local.name_prefix}-vpc"
  region             = var.region
  availability_zones = data.aws_availability_zones.available.names
  environment        = var.environment
  private_subnets    = var.private_subnets
  public_subnets     = var.public_subnets
}

module "ec2" {
  source                        = "../../modules/fxc-ec2" # Update this path to your actual module location
  instance_name                 = "${local.name_prefix}-ec2"
  instance_ami                  = data.aws_ami.amazon_linux_2.id
  sg_name                       = var.sg_name
  vpc_id                        = module.network.vpc_id
  instance_type                 = var.instance_type
  subnet_id                     = module.network.public_subnet_ids[0]
  ec2_ssh_sg_ingress_cidr_block = var.ec2_ssh_sg_ingress_cidr_block
}