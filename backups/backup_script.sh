#!/bin/bash
# Backup Script

backup_dir="/var/backups"
target_dir="/home/user/data"
backup_file="$backup_dir/data_backup_$(date +%Y%m%d).tar.gz"

# Create a backup and encrypt it using GPG
tar -czf - $target_dir | gpg --symmetric --cipher-algo aes256 -o $backup_file.gpg

echo "Backup and encryption completed: $backup_file.gpg"
