#!/bin/bash

# Log directory and file path
LOG_DIR="/var/www/crons/logs"
LOG_FILE="$LOG_DIR/mariadb_checker.log"

# Function to log messages
log() {
    local log_message="$1"
    echo "$(date +"%Y-%m-%d %T") $log_message" >> "$LOG_FILE"
}

# Create log directory if it doesn't exist
if [ ! -d "$LOG_DIR" ]; then
    mkdir -p "$LOG_DIR"
    chmod 755 "$LOG_DIR"
fi

# Create log file if it doesn't exist
touch "$LOG_FILE"
chmod 644 "$LOG_FILE"

# Function to check if MariaDB service is running
check_service() {
    if systemctl is-active --quiet mariadb; then
        return 0
    else
        return 1
    fi
}

# Function to start the MariaDB service
start_service() {
    systemctl start mariadb
    if [ $? -ne 0 ]; then
        log "Failed to start MariaDB service. Please check the service manually."
        exit 1
    fi
}

# Function to check if script is already added to cron
check_cron() {
    if crontab -l | grep -q "*/2 * * * * /var/www/crons/mariadb_checker.sh"; then
        return 0
    else
        return 1
    fi
}

# Function to add the script to cron
add_to_cron() {
    # Add script to cron if not already added
    if ! check_cron; then
        cron_command="*/2 * * * * /var/www/crons/mariadb_checker.sh"
        (crontab -l ; echo "$cron_command" ) | crontab -
        log "Script added to cron"
    else
        log "Script is already added to cron"
    fi
}

# Main function
main() {
    if check_service; then
        log "MariaDB is live"
    else
        log "MariaDB is not live, starting the service..."
        start_service
        if check_service; then
            log "MariaDB service started successfully"
        else
            log "Failed to start MariaDB service. Please check the service manually."
        fi
    fi
}

# Check if script is executed with root privileges
if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run with root privileges"
    exit 1
fi

# Call the main function
main