Backup Website & Database Using CRON on Ubuntu
========================================

Backup Overview
---------------

This document provides instructions for backing up your website files and database, as well as scheduling automatic backups using cron.

Backup Script
-------------

The backup script performs the following tasks:

*   Creates a ZIP file of the website files.
*   Creates a SQL dump of the database.
*   Saves both files in the specified backup directory with a date stamp.

### Backup Script Code

```bash
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

```

Setting Up the Cron Job
-----------------------

To schedule the backup script to run automatically, follow these steps:

### 1\. Create the Backup Script

Save the backup script above in a file, e.g., `backup.sh`.

### 2\. Make the Script Executable

chmod +x /path/to/backup.sh


### 3\. Open the Crontab File

crontab -e


### 4\. Add a Cron Job

Add the following line to schedule the backup script (e.g., daily at 2 AM):

0 2 \* \* \* /path/to/backup.sh


### 5\. Save and Exit

Save the crontab file and exit the editor. Your backup will now run automatically at the scheduled time.

Conclusion
----------

Following these instructions will ensure that your website and database are regularly backed up. Always verify the backup files to ensure data integrity.

## Contact
Questions or feedback? Email me at **bdmehadih@gmail.com** Happy coding! 🚀