#!/usr/bin/env bash

# Define the log file, treshold, and Slack webhook
LOGFILE=/var/log/secure
TRESHOLD=5
SLACK_WEBHOOK_URL=""
HOSTNAME=$(hostname)

# Function to send message to Slack
send_to_slack() {
        local message=$1
        curl -X POST --data-urlencode "payload={\"text\": \"$message\"}" $SLACK_WEBHOOK_URL
}


# Check for suspicious SSH login activities 
echo "Checking for suspicious SSH login activities..."
sudo awk '/Failed password for/ {for (i = 1; i <= NF; i++) if ($i == "from") {print $(i+1)} }' $LOGFILE | sort | uniq -c | sort -nr | while read count ip

do
        if [ $count -gt $TRESHOLD ]
        then
                message="[$HOSTNAME] Supicious Activity Detected: $count failed login attempts from IP $ip"
                echo $message
                send_to_slack "$message"
        fi

done
