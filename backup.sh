#!/bin/bash

# Define source and destination
SOURCE_FILE="/home/$USER/.config/hypr/hyprland.conf"
DEST_DIR="."

# Get current date and time
# Format: hyprland_current-date_backup_current-time.conf
# Using YYYY-MM-DD for date and HH-MM-SS for time to be safe for filenames
CURRENT_DATE=$(date +"%d-%m-%Y")
CURRENT_TIME=$(date +"%H-%M-%S")

DEST_FILE="${DEST_DIR}/hyprland_${CURRENT_DATE}_backup_${CURRENT_TIME}.conf"

# Check if source file exists
if [ -f "$SOURCE_FILE" ]; then
    cp "$SOURCE_FILE" "$DEST_FILE"
    if [ $? -eq 0 ]; then
        echo "Success: Backup created at $DEST_FILE"
    else
        echo "Error: Failed to copy file."
        exit 1
    fi
else
    echo "Error: Configuration file not found at $SOURCE_FILE"
    exit 1
fi
