#!/bin/bash
# Install necessary packages
yum update -y
yum install -y aws-cli tar  #aws cli needed to upload the script to s3

# Create backup script
cat << 'SCRIPT' > /home/ec2-user/backup.sh
#!/bin/bash
BACKUP_DIR="/home/ec2-user/backup"
TIMESTAMP=$(date +"%Y%m%d%H%M%S")
BACKUP_FILE="$BACKUP_DIR/backup-$TIMESTAMP.tar.gz"
S3_BUCKET="${s3_bucket_name}"

mkdir -p $BACKUP_DIR
tar -czvf $BACKUP_FILE /var/log
aws s3 cp $BACKUP_FILE s3://$S3_BUCKET/
echo "Backup uploaded to s3://$S3_BUCKET/backup-$TIMESTAMP.tar.gz" >> /var/log/backup.log
SCRIPT

chmod +x /home/ec2-user/backup.sh

# Schedule the backup script to run daily at 2:00 am UTC
echo "0 2 * * * /home/ec2-user/backup.sh" > /etc/cron.d/backup