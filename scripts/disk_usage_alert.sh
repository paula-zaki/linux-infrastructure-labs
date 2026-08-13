#!/usr/bin/env bash

# Slack webhook URL
SLACK_WEBHOOK_URL=''

# the treshold for the disk usage
TRESHOLD=5

# get the current disk usage percentage
DISK_USAGE=$(df -h / | awk 'NR==2 {print $5}' | cut -d% -f1)

# Server hostname
SERVER_HOSTNAME=$(hostname)


# Script
if [ "$DISK_USAGE" -ge "TRESHOLD" ]
then
        MESSAGE=":exclamation: ALERT - Disk usage on $SERVER_HOSTNAME is $DISK_USAGE %."
        curl -X POST \
        -H "Content-Type: application/json" \
        --data "{\"text\":\"${MESSAGE}\"}" \
        "$SLACK_WEBHOOK_URL"
fi
