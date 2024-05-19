MariaDB Service Checker Script
==============================

This bash script is designed to check the status of the MariaDB service and start it if it's not running. It also ensures that the script is added to cron for periodic execution.

Usage
-----

1.  **Clone the Repository Or Dir From:**  
    `git clone https://github.com/mehadi/server-code-snippets`
2.  **Navigate to the Directory:**  
    `cd /var/www/crons`
3.  **Make the Script Executable:**  
    `chmod +x mariadb_checker.sh`
4.  **Execute the Script:**  
    `sudo ./mariadb_checker.sh`

Features
--------

*   **Logging:** The script logs messages to a specified log file (`mariadb_checker.log`) located in `/var/www/crons/logs/`.
*   **Cron Job:** It adds the script to cron for automatic periodic execution, checking the MariaDB service every 2 minutes.
*   **Service Management:** If the MariaDB service is not running, the script starts it and logs the status.

Requirements
------------

*   **Root Privileges:** The script must be executed with root privileges to perform service management tasks and modify cron jobs.

Configuration
-------------

*   **Log Directory and File Path:** You can customize the log directory and file path by modifying the `LOG_DIR` and `LOG_FILE` variables in the script.

Notes
-----

*   Ensure that the script is located in a directory accessible by the root user.
*   Make sure to review the script and adjust the paths and configurations according to your system setup before execution.