module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = var.instance_name
  ami  = var.instance_ami
  instance_type = var.instance_type

  key_name = aws_key_pair.generated_key.key_name

  vpc_security_group_ids = [aws_security_group.ec2_ssh.id]
  subnet_id              = var.subnet_id
  associate_public_ip_address = true

  tags = var.tags
}

provider "tls" { }

resource "tls_private_key" "txc_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Save the public key in AWS
resource "aws_key_pair" "generated_key" {
  key_name   = "generated_key"
  public_key = tls_private_key.txc_key.public_key_openssh
}

# Security Group
resource "aws_security_group" "ec2_ssh" {
  name = var.sg_name
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.ec2_ssh_sg_ingress_cidr_block
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.tags
}
