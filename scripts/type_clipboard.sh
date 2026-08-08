#!/bin/bash

# Get clipboard content
TEXT=$(wl-paste)

# Check if clipboard is empty
if [ -z "$TEXT" ]; then
    echo "Clipboard is empty!"
    exit 1
fi


sleep 0.5
# Type clipboard content
wtype "$TEXT"

