#!/bin/bash

PACKAGES=("nmap" "python3" "curl" "git" "wget")

install_apt() {
    echo "[+] Installing via apt (Debian/Ubuntu)"
    sudo apt update && sudo apt install -y "${PACKAGES[@]}"
}

install_yum() {
    echo "[+] Installing via yum (RHEL/CentOS)"
    sudo yum install -y "${PACKAGES[@]}"
}

install_pacman() {
    echo "[+] Installing via pacman (Arch)"
    sudo pacman install -Sy --noconfirm "${PACKAGES[@]}"
}

if command -v apt &> /dev/null/; then
    install_apt
elif command -v yum &> /dev/null; then
    install_yum
elif command -v pacman &> /dev/null; then
    install_pacman
else
    echo "ERROR: Unknown package manager"
    exit 1
fi

echo "OK: Installation complete"
