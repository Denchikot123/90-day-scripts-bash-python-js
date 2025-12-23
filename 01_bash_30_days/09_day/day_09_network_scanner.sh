#!/bin/bash

echo "[*] PING SCANNER - $(date)"
echo "=========================="

for ip in {1..254}; do
    ping -c 1 -W 1 192.168.1.$ip > /dev/null 2>&1
    [ $? -eq 0 ] && echo "[+] 192.168.1.$ip - ALIVE"
done

echo "[*] Scan completed"
