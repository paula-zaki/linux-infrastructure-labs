#!/usr/bin/env

# Slack webhook to get the notification
SLACK_WEBHOOK=""

# the amount of free memory in the system
FREE_MEMORY=$(vmstat -S m | awk 'NR==3 {print $4 }')

# Message when the memory is leaking
# cheking if it is less than 100M
if [ $FREE_MEMORY -lt 100 ]
then
        curl -X POST \ 
        -H "Content-Type: application/json" \
        --data "{\"text\":\"$MESSAGE\"}"\
        $SLACK_WEBHOOK
fi


# You will need to run this script using cron jobs or a systemd timer to ensure it runs regularly.
