#!/bin/bash
output=/home/testadmin1/tool/output.txt
time=$(date "+%Y-%m-%d %H:%M:%S")
SEMD=$(ausearch -m avc -ts recent )

echo -e "\n --------Rejection History--------"
if [ "$SEMD" = "<no match>" ];then
   echo "Everything is fine at $time" >> "$output"
else
   echo "Command Execution is failure at $time "
fi

 echo -e "\n --------SELinux Target--------"
Setup=$(sestatus | grep -e "SELinux Mode" -e "SELinux target")

if [ "$Setup" = "Enforcing" ];then
   echo "$Setup >> $output"
   echo "Please check the $output file"
else
   echo "$Setup"
fi
