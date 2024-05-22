resource "aws_iam_role" "ec2_backup_role" {
  name = var.ec2_backup_role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_policy" "ec2_backup_policy" {
  name = var.ec2_backup_role_name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3:PutObject",
          "s3:GetObject",
          "s3:ListBucket"
        ]
        Effect = "Allow"
        Resource = [
          "arn:aws:s3:::${var.ec2_backups_bucket_name}",  #locked down to single resource
          "arn:aws:s3:::${var.ec2_backups_bucket_name}/*" #anything within the bycket inherits the same permissions
        ]
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "ec2_backup_policy_attachment" {
  role       = aws_iam_role.ec2_backup_role.name
  policy_arn = aws_iam_policy.ec2_backup_policy.arn
}

resource "aws_iam_instance_profile" "ec2_backup_instance_profile" {
  name = var.ec2_backup_instance_profile_name
  role = aws_iam_role.ec2_backup_role.name
}


