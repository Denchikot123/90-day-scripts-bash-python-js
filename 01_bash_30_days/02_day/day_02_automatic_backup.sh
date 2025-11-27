#!/bin/bash 

BACKUP_DIR="$HOME/backup"
SOURCE_FILES=(
    "$HOME/.bashrc"
    "$HOME/.ssh/config"
    "$HOME/.ssh/known_hosts"
)

if [ ! -d "$BACKUP_DIR" ]; then
    mkdir -p "$BACKUP_DIR"
fi

for file in "${SOURCE_FILES[@]}"; do
    if [ -f "$file" ]; then
        cp -- "$file" "$BACKUP_DIR"
        echo "OK: Copied: "$file" -> "$BACKUP_DIR""
    else
        echo "ERROR: The file was not found or is not a regular file: "$file""
    fi
done
