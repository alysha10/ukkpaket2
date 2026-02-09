#!/bin/bash

# Konfigurasi
DB_NAME="moodle"
DB_USER="root"
BACKUP_DIR="/home"
DATE=$(date +"%Y-%m-%d_%H-%M")

# Nama file backup
BACKUP_FILE="$BACKUP_DIR/${DB_NAME}_backup_$DATE.sql"

# Proses backup
mysqldump -u $DB_USER $DB_NAME > $BACKUP_FILE

# Optional: hapus backup lebih dari 7 hari
find $BACKUP_DIR -name "${DB_NAME}_backup_*.sql" -type f -mtime +7 -delete
