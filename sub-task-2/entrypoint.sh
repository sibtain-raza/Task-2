#!/bin/bash

# Start the run once job.
echo "Docker container has been started"

declare -p | grep -Ev 'BASHOPTS|BASH_VERSINFO|EUID|PPID|SHELLOPTS|UID' > /container.env

# Setup a cron schedule
echo "SHELL=/bin/bash
BASH_ENV=/container.env

0 6 * * * bash /root/attendance.sh

1 0 * * * bash /root/autoschedule.sh

0 6 * * * bash /root/finalattendance.sh

0 6 * * * bash /root/nearest.sh
# This extra line makes it a valid cron" > scheduler.txt

crontab scheduler.txt
cron -f
