#!bin/bash

set -e

if ! command -v openssl &> dev/null; then
    echo "[-] OpenSSL not installed. Install - 'sudo apt istall openssl'"
    exit 1
fi

if [ $# -lt 2 ]; then
    echo "Used: $0 <encrypt|decrypt> <file> [pass]"
    echo "Example:"
    echo "  $0 encrypt report.txt"
    echo "  $0 decrypt report.txt.enc mypassword"
    exit 1
fi

ACTION="$1"
FILE="$2"
PASSWORD="{$3:-}"

case "$ACTION" in
    encrypt)
        OUTPUT="${FILE}.enc"

        if [ -z "$PASSWORD" ]; then
            PASSWORD=$(openssl rand -base64 32)
            echo "[*] Generated password: $PASSWORD"
            echo "[!] Please, save password! You can't decrypt the file without it"
            echo "$PASSWORD" > "${FILE}.key"
            chmod 600 "${FILE}.key"
        fi

        echo "[*] Encrypt $FILE -> $OUTPUT"
        openssl enc -aes-256-cbc -salt -pbkdf2 \
            -in "$FILE" -out "$OUTPUT" \
            -pass pass:"$PASSWORD" 2> dev/null

        echo "[+] File encrypted"
        ls -la "$OUTPUT"
        ;;

    decrypt)
        if [[ ! "$FILE" =~ \.enc$ ]]; then
            echo "[!] Only file in .enc"
            exit 1
        fi
        
        OUTPUT="${FILE%.enc}.dec"
        
        if [ -z "$PASSWORD" ]; then
            KEY_FILE="${FILE%.enc}.key"
            if [ -f "$KEY_FILE" ]; then
                PASSWORD=$(cat "$KEY_FILE")
                echo "[*] Used password from - $KEY_FILE"
            else
                echo -n "[?] Enter password: "
                read -s PASSWORD
                echo
            fi
        fi
        
        echo "[*] Decrypt $FILE → $OUTPUT"
        if ! openssl enc -aes-256-cbc -d -pbkdf2 \
            -in "$FILE" -out "$OUTPUT" \
            -pass pass:"$PASSWORD" 2>/dev/null; then
            echo "[-] ERROR: Incorrect password or corrupted file"
            rm -f "$OUTPUT"
            exit 1
        fi
        
        echo "[+] File decrypted"
        ;;
    
    *)
        echo "Wrong action: $ACTION"
        exit 1
        ;;
esac
