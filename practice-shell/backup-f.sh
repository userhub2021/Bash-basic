#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 <backup_identifier>"
    exit 1
fi

if [ -d /backup/test1 ]; then
    echo "Directory exists"
else
    mkdir -p /backup/test1
    echo "backup directory created"
fi

if [ ! -d /home/testadmin/tools/history_shell/$1 ]; then
    mkdir -p /home/testadmin/tools/history_shell/"$1"
elif [ ! -f /home/testadmin/tools/history_shell/"$1"/exec.log ]; then
    touch /home/testadmin/tools/history_shell/"$1"/exec.log
fi

find /etc -type f -size -10k -name "*.conf" -print0 | while IFS= read -r -d '' result; do
    cp "$result" /backup/test1
    echo "File copied: $result"
done

echo "The backup completed successfully."
echo "Successfully backed up $(ls -l /backup/test1 | wc -l) files." >> /home/testadmin1/tools/history_shell/"$1"/exec.log
echo "Backup completed at $(date)" >> /home/testadmin1/tools/history_shell/"$1"/exec.log
exit 0