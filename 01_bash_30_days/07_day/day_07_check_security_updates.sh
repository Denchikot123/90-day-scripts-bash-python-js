#!/bin/bash

echo "[*] Checking for security updates..."

if command -v apt-get &> /dev/null; then
    echo "[+] Debian-based system detected"
    apt-get update > /dev/null 2>&1
    apt-get upgrade --dry-run | grep -i security
    
elif command -v yum &> /dev/null; then
    echo "[+] RHEL-based system detected"
    yum check-update --security | grep -E "^[a-zA-Z]"
    
elif command -v pacman &> /dev/null; then
    echo "[+] Arch-based system detected"
    pacman -Qu | grep -i security
    
else
    echo "[-] Unknown package manager"
    exit 1
fi

echo "[*] Security check completed"
