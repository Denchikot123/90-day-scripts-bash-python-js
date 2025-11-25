#!/bin/bash

echo "=== SYSTEM INFO ==="
echo "Host: $(hostname)"
echo "User: $(whoami)"
echo "OS: $(cat /etc/os-release | grep PRETTY_NAME | cut -d= -f2)"
echo "Kernel: $(uname -r)"
echo "Uptime: $(uptime -p)"

echo "=== MEMORY ==="
free -h

echo "=== DISK ==="
df -h /

echo "=== NETWORK ==="
ip addr show | grep "inet " | grep -v "127.0.0.1"
