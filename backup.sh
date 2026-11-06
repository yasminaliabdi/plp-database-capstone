#!/bin/bash

# Create the backups folder if it doesn't exist
mkdir -p backups

# Generate the backup file with the current date
BACKUP_FILE="backups/capstone_$(date +%F).dump"

echo "Starting backup of capstone database to $BACKUP_FILE..."

# Run pg_dump
sudo -u postgres pg_dump -Fc -f "$BACKUP_FILE" capstone

if [ $? -eq 0 ]; then
    echo "Backup completed successfully!"
else
    echo "Backup failed!"
fi