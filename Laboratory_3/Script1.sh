#!/bin/bash

echo "Running my periodic task at $(date)"

# cron variables
cron_schedule="$1"
task_script="$2"

# Validates not empty 
if [ -z "$cron_schedule" ] || [ -z "$task_script" ]; then
    echo "Usage of script: $0 <cron_schedule> <task_script>"
    exit 1
fi

# Put the task
(crontab -l ; echo "$cron_schedule $task_script") | crontab -