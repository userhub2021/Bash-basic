#!/bin/bash
service_name=$(basename "$0" .sh)

if [  -z "$2" ]; then
    echo "Usage: $service_name <mem|cpu|disk>"
    exit 1
elif [ ! "$2" == "mem" ] && [ ! "$2" == "cpu" ] && [ ! "$2" == "disk" ]; then
    ps aux | grep -v grep | head -n 10
    echo "$(date) of the top 10 processes."
   exit 1
elif [ "$2" == "mem" ]; then
   ps aux --sort=-%mem 
   echo "$(date) of the processes sorted by memory usage."
elif [ "$2" == "cpu" ]; then
    ps aux --sort=-%cpu
    echo "$(date) of the processes sorted by CPU usage."
elif [ "$2" == "disk" ]; then
    echo "File path : Available capacity : used capacity " 
    df -ht | grep -e "/boot" -e "/" | awk '{ print $1, $5, $6 }'
    echo "Checked $(date)"
fi
exit 0
