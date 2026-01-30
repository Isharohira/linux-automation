#!/bin/bash

BACKUP_SERVER="root@192.168.40.135"
BACKUP_BASE="/prod_backup"
RESTORE_PATH="/linux-automation/data"

read -p "Enter backup date to restore (YYYY-MM-DD): " DATE

rsync -avz "$BACKUP_SERVER:$BACKUP_BASE/$DATE/" "$RESTORE_PATH/"

if [ $? -eq 0 ]; then
    echo "Restore completed successfully for date: $DATE"
else
    echo "Restore failed for date: $DATE"
fi

