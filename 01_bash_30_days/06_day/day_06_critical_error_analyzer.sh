#!/bin/bash

DIR="/var/log"
ERROR=("error" "critical" "fail" "panic" "denied" "corrupt")

search_log() {
    local pattern="$1"
    local file_log=("syslog" "auth.log" "kern.log" "messages")

    for log in ${file_log[@]}; do
        if [ -f "$DIR/$log" ]; then
            count=$(grep -i -c "$pattern" "$DIR/$log" 2>/dev/null)
            [ $count -gt 0 ] && echo "OK: $count matches for '$pattern'"
        fi
    done
}

for pattern in ${ERROR[@]}; do
    search_log "$pattern"
done
