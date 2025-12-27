#!/bin/bash

TARGET="$1" # Your IP
OUTPUT="./scan_result"
SCAN_NAME="result_$(date '+%Y-%m-%d_%H%M%S')"

if [ -n "$1" ]; then
    TARGET="$1"
else
    echo "[-] Wrong format (./day_11_auto_nmap_scan.sh [IP].)"
    exit 1
fi

if ! command -v nmap &> /dev/null; then
    echo "[ERROR] Nmap not found. Install nmap (apt install nmap / yum install nmap)"
    exit 1
fi

mkdir -p "$OUTPUT"

echo "[*] Start scanning target: $TARGET"
echo "[*] Results saved in: $OUTPUT/"
echo "==============================================="

sudo nmap -sV -sC -O -p- -T4 "$TARGET" -oA "$OUTPUT/$SCAN_NAME"

if [ $? -eq 0 ]; then
    echo "[+] Scan completed"
else
    echo "[ERROR] Error during scanning" >&2
    exit 1
fi
