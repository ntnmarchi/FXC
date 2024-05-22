variable "environment" {
    description = "The deployment environment"
    type        = string  
}

variable "tags" {
  description = "Tags to be applied to all resources"
  type        = map(string)
  default     = {
    Terraform   = "true"
    Environment = "default"  # Placeholder, actual value set in locals
  }
}

variable "region" {
  description = "The AWS region to deploy in"
  type        = string
}

variable "availability_zones" {
  description = "A list of availability zones"
  type        = list(string)
}

variable "private_subnets" {
  description = "A list of private subnet CIDRs"
  type        = list(string)
}

variable "public_subnets" {
  description = "A list of public subnet CIDRs"
  type        = list(string)
}