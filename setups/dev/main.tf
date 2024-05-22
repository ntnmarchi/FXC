module "network" {
  source             = "../../modules/fxc-network" # Update this path to your actual module location
  region             = var.region
  availability_zones = data.aws_availability_zones.available.names
  environment        = var.environment
  private_subnets    = var.private_subnets
  public_subnets     = var.public_subnets
}

