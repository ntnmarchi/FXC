variable "tags" {
  description = "Tags to be applied to all resources"
  type        = map(string)
  default     = {
    Terraform   = "true"
    Environment = "default"  # Placeholder, actual value set in locals
  }
}

variable "instance_name" {
    description = "The name of the EC2 instance"
    type        = string  
}

variable "instance_type" {
    description = "The type of EC2 instance to launch"
    type        = string  
}

variable "sg_name" {
    description = "The name of the security group"
    type        = string    
}

variable "subnet_id" {
    description = "The ID of the subnet to launch the instance in"
    type        = string      
}

variable "ec2_ssh_sg_ingress_cidr_block" {
    description = "The CIDR block to allow SSH access from"
    type        = list(string)  
}

variable "vpc_id" {
    description = "The ID of the VPC"
    type        = string   
}

variable "instance_ami" {
    description = "The AMI to use for the instance"
    type        = string  
}