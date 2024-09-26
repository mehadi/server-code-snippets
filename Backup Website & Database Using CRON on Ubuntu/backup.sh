#!/bin/bash

# Define variables
DB_USER="DB_USER"
DB_NAME="DB_NAME"
DB_PASSWORD="DB_PASSWORD"  # Hardcoded database password
BACKUP_DIR="/var/www/backups/website.com"
WEB_DIR="/var/www/website.com"
DATE=$(date +'%Y%m%d')

# Create backup directory if it doesn't exist
mkdir -p $BACKUP_DIR

# Backup the website files
zip -r $BACKUP_DIR/website_backup_$DATE.zip $WEB_DIR

# Backup the database
mysqldump -u $DB_USER -p"$DB_PASSWORD" $DB_NAME > $BACKUP_DIR/website_db_backup_$DATE.sql

# Confirmation message
echo "Backup completed: "
echo "- Website: $BACKUP_DIR/website_backup_$DATE.zip"
echo "- Database: $BACKUP_DIR/website_db_backup_$DATE.sql"
