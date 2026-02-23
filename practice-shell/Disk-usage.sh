#!/bin/bash
output=/home/testadmin1/tools/usage.txt
time=$(date "+%Y-%m-%d %H:%M:%S")
Check=$(df -hT | awk 'NR>1 {print $6}' | sed 's/%//' | sort -nr | head -1)
hostName=$(hostname)

dir_Check(){
    if [ -f "$output" ]; then
         echo "Output file already exists at $output"
    else
       touch "$output"
       echo "Output file created at $output"
    fi
}

dir_Check

storage_ch(){
    echo -e "\n---------------Disk Usage---------------"
    echo "Disk Usage of $hostName at $time"
    if [ "$Check" -gt 80 ];then
        echo "Disk Usage is above 80% at $time"
        echo "recommend to expand the disk space for lvm or vg at $hostName"
    else
        echo "$hostName: Disk Usage is normal !"
    fi
}

storage_ch >> "$output"
