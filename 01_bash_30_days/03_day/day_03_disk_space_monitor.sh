#!/bin/bash

MAX_USAGE=90

usage=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')
if [ $usage -gt $MAX_USAGE ]; then
    echo "WARNING: The disk is loaded on ${usage}%"
    echo "INFO: The 5 largest files:"
    find / -type f -exec du -sh {} + 2>/dev/null | sort -rh | head -5
fi

for dir in /tmp /var/tmp /dev/shm; do
    if [ -d "$dir" ]; then
        count=$(find "$dir" -type f -size +100M 2>/dev/null | wc -l)
        if [ $count -gt 0 ]; then
            echo "Found large files in: $dir: $count"
        fi
    fi
done
