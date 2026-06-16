#!/bin/bash

# Google Drive remote
REMOTE="caleb_drive:backup"

# Folders to backup
FOLDERS=("$HOME/Documents" "$HOME/Desktop" "$HOME/Downloads")

# Log file
LOGFILE="$HOME/rclone-backup.log"

for FOLDER in "${FOLDERS[@]}"; do
    BASENAME=$(basename "$FOLDER")   # e.g., "Documents"
    DEST="$REMOTE/$BASENAME"         # remote path

    echo "Backing up $FOLDER to $DEST at $(date)" >> "$LOGFILE"

    rclone copy "$FOLDER" "$DEST" \
        --progress \
        --transfers 8 \
        --checkers 8 \
        --create-empty-src-dirs \
        --exclude "$HOME/.local/share/Trash/**" \
        --exclude "**/node_modules/**" \
        --exclude "**/.*" \
        --log-file="$LOGFILE" \
        --log-level INFO
done

echo "Backup completed at $(date)" >> "$LOGFILE"
