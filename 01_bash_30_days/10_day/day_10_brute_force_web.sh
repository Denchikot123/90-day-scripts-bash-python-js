#!/bin/bash

TARGET=" http://testphp.vulnweb.com" # Your url
WORDLIST="/usr/share/wordlists/dirb/common.txt" # For Kali

if [ -n "$1" ]; then
    TARGET="$1"
fi

if [ -n "$2" ]; then
    WORDLIST="$2"
fi

echo "[*] Start scanning directories for: $TARGET"
echo "==============================================="

while IFS= read -r dir; do
    dir_clean=$(echo "$dir" | tr -d '\r')
    
    url="$TARGET/${dir_clean}"
    
    http_code=$(timeout 5 curl -s -o /dev/null -w "%{http_code}" "$url")
    
    if [ "$http_code" -eq 200 ] || [ "$http_code" -eq 301 ] || [ "$http_code" -eq 302 ] || [ "$http_code" -eq 403 ]; then
        echo "[+] Found ($http_code): $url"
    fi
    
done < "$WORDLIST" 2>/dev/null

echo "[*] Сканирование завершено."
