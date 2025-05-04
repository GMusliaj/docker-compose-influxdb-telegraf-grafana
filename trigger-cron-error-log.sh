#!/bin/bash

## This script is used to trigger cron job errors in the /var/sys/log inside the telegraf container

## Run it as ./trigger-cron-error-log.sh

docker ps -q -f name=telegraf && docker exec -it telegraf bash -c 'echo "$(date "+%b %d %H:%M:%S") myhost CRON[12346]: (root) CMD (my-script.sh 2>&1 | logger)" >> /var/log/syslog && echo "$(date "+%b %d %H:%M:%S") myhost my-script.sh[12347]: ERROR: Unable to connect to DB" >> /var/log/syslog' || echo "Telegraf container does not exist or is not running"
