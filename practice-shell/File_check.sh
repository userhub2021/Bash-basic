#!/bin/bash

if [ -f "$1" ]; then
    echo "Found"
else
    echo "Not Found"
    exit 1
fi
