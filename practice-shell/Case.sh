#!/bin/bash

read -p "Enter the file name you want to create:" filename

if [ -z "$filename" ]; then
    echo "Error: Filename cannot be empty."
    exit 1
fi

if [ -f "$filename" ]; then
    echo "Exists $filename"
    exit 1
elif [ -d "$filename" ]; then
    echo "$filename exists as a directory"
    exit 0
fi

case "$filename" in
    *.txt)
        touch "$filename"
        echo "Text file created: $filename"
    ;;
    *.sh)
        touch "$filename"
        chmod u+x "$filename"
        echo "$(ls -l "$filename" | awk '{ print $1 }') $filename"
        echo "Shell script file created: $filename"
    ;;
    *)
       touch "$filename"
       echo "$filename created at $(date)"
    ;;
esac
exit 0