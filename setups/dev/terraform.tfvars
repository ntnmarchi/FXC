environment                   = "dev"
private_subnets               = ["10.0.4.0/24"]
public_subnets                = ["10.0.7.0/24"]
region                        = "eu-west-2"
sg_name                       = "fxc-sg"
ec2_ssh_sg_ingress_cidr_block = ["0.0.0.0/0"]
instance_type                 = "t2.micro"
backups_bucket_name           = "test-12-04-1992-backups" # this should be my-backup-bucket, used this name for testing