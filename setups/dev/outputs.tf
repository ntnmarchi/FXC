output "ec2-instance-public-ip" {
  description = "public IP address of the EC2 instance"
  value       = module.ec2.instance_public_ip
}