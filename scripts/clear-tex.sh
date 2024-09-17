#!/bin/bash

# Define the trash directory
TRASH="$HOME/.local/share/Trash/files"

# Create the trash directory if it doesn't exist
mkdir -p "$TRASH"

# Loop through all items in the current directory
for item in *; do
    # Check if the item is a file
    if [[ -f "$item" ]]; then
        # Get the file extension
        ext="${item##*.}"
        
        # If the extension is not tex or pdf, move the file to trash
        if [[ "$ext" != "tex" && "$ext" != "pdf" ]]; then
            mv "$item" "$TRASH"
            echo "Moved $item to trash."
        fi
    fi
done
