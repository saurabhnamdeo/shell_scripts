#!/bin/bash

<<note

This simple bash file is to take backup,

note


# Directories to backup
backup_source="/home/ubuntu/shell_script"

# Backup destination
backup_dest="/home/ubuntu/backup"

# Check if backup destination exists, if not, create it
if [ ! -d "$backup_dest" ]; then
  mkdir -p "$backup_dest"
  echo "Created backup directory $backup_dest"
else
  echo "Backup directory $backup_dest already exists"
fi

# Create archive filename with the current date
backup_file="$backup_dest/backup-$(date +%Y-%m-%d-%h-%m-%s).zip"

# Create the backup
zip -r $backup_file $backup_source

# Print status message
echo "Backup of $backup_source completed and saved as $backup_file"
