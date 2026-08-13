#!/usr/bin/env bash

# This script requires ClamAV to be installed and run regularly. 

# Setting up variables
SLACK_WEBHOOK_URL=""
LOG_FILE="/var/log/clamd.scan"
SEARCH_PATTERN="FOUND"
LAST_LINE_PROCESSED=""
HOSTNAME=$(hostname)

sudo tail -Fn0 "$LOG_FILE" | while read -r line
do
    if [[ "$line" == *"$SEARCH_PATTERN"* &&
          "$line" != "$LAST_LINE_PROCESSED" ]]
    then
        SLACK_MESSAGE="Malware Found on $HOSTNAME: $line"

        curl -X POST \
             -H "Content-type: application/json" \
             --data "{\"text\":\"$SLACK_MESSAGE\"}" \
             "$SLACK_WEBHOOK_URL"

        LAST_LINE_PROCESSED="$line"
    fi
done
