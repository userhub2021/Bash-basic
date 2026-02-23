#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: $0 <file_path>"
  exit 1
fi
 if [ ! -f "$1" ]; then
    echo "File not found: $1"
    exit 1
fi

for username in $(cat $1); do
    if ! id "$username" &> /dev/null; then
       useradd "$username"
       echo "User $username created"
    else
       echo "User $username already exists. skipping..."
    fi
done;

exit 0
