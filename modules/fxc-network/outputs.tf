output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.fxc-network.vpc_id
}

output "private_subnet_ids" {
  description = "List of IDs of private subnets"
  value       = module.fxc-network.private_subnets
}

output "public_subnet_ids" {
  description = "List of IDs of public subnets"
  value       = module.fxc-network.public_subnets
}
