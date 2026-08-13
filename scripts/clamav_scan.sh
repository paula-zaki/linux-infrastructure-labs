#!/usr/bin/env bash

# Make sure that you have clamav installed on your system
# For RedHat family the command is : sudo dnf install clamav 

#making sure that the dir where we are going to save our date exits
if [ ! -d /var/log/clamav ]
then
        sudo mkdir /var/log/clamav
fi

#setting our variables

LOG_FILE="/var/log/clamav/clamscan_$(date '+%Y-%m-%d').log"

sudo clamscan /home/vagrant -l "$LOG_FILE"

LLOG_CONTENT=$(sudo cat "$LOG_FILE")

HOSTNAME=$(hostname)

SLACK_WEBHOOK_URL=""

SLACK_MESSAGE="ClamAV Scan Results for $HOSTNAME:\n$LOG_CONTEN"

courl -X POST -H 'Content-type: application/json' --data "{"text":"${SLACK_MESSAGE}"}" $SLACK_WEBHOOK_URL
