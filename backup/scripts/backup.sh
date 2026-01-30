#!/bin/bash
SOURCE="/linux-automation/data"
DESTINATION="root@192.168.40.135:/prod_backup"
DATE=$(date +%F)
LOGFILE="/linux-automation/backup/logs/backup.log"
rsync -avz "$SOURCE/" "$DESTINATION/$DATE" >> "$LOGFILE" 2>&1
