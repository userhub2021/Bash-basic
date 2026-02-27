#!/bin/bash

if [ -d /backup/test1 ]; then
    echo "Directory exists"
else
    mkdir -p /backup/test1
    echo "backup directory created"
fi

find /etc -type f -size -10k -name "*.conf" -print0 | while IFS= read -r -d '' result; do
    cp "$result" /backup/test1
    echo "File copied: $result"
done

ls -1 /backup/test1 | wc -l
exit 0