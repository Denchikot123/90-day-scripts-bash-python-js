#!/bin/bash

echo "[*] PROCESS MONITOR - $(date)"
echo "============================="

echo "\n[1] System/core processes: "
ps aux | grep "\[" | head -10

echo "\n[2] Processes with uncommon PPID/PID (PPID != 1): "
ps -eo pid,ppid,comm,cmd | awk '$2 != 1 && $4 !~ /\[/ {print}' | head -15

echo "\n[3] Network processes: "
netstat -tulpn 2>/dev/null | grep -E "LISTEN|ESTABLISHED" | head -10

echo "\n[4] Keyword processes: "
ps aux | grep -iE "miner|backdoor|shell|reverse|payload" | grep -v grep
