#!/bin/bash

File_name=service_check.sh

#$1=サービス名、$2=オプションとなる想定。
if [ $1 == "" -o $2 == "" ]; then
   echo "Usage:$File_name <service_name> <start|stop|status>"
   exit 1
elif [ $2 == "start" ]; then
    systemctl start $1
    echo "$1 started"
elif [ $2 == "stop" ]; then
    systemctl stop $1
    echo "$1 stopped"
elif [ $2 == "status" ]; then
   service_status=$(systemctl status $1 | grep "Active:" | awk '{print $2}')
   echo "$1 status: $service_status"
fi
exit 0

