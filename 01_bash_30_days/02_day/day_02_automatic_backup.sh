#!/bin/bash 

BACKUP_DIR="$HOME/backup"
SOURCE_FILES=("$HOME/.bashrc" "$HOME/.ssh/config")

if [ ! -d "$BACKUP_DIR" ]; then
    mkdir -p "$BACKUP_DIR" 2>/dev/null
fi

for file in "${SOURCE_FILES[@]}"; do
    if [ -f "$file" ]; then
        cp -- "$file" "$BACKUP_DIR"
        echo "OK: Copied: "$file" -> "$BACKUP_DIR""
    else
        echo "ERROR: The file was not found or is not a regular file: "$file""
    fi
done
