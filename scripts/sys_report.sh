#!/usr/bin/env bash

# Befor you run the script you should have installed sysstat
# For RedHat family 
# sudo dnf install sysstat

# creating the dir where the reports will be added
sudo mkdir -p /var/log/sar_reports
REPORT_DIR="/var/log/sar_reports"

# the file that holds with data and also it will have the date
DATE=$(date '+%Y-%m-%d')
REPORT_FILE="$REPORT_DIR/cpu_mem_io_report_$DATE"

#creating the file
sudo sh -c "sar -burd > $REPORT_FILE"

# You will need to run this script using cron jobs or a systemd timer to ensure it runs regularly.
