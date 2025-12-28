#!/bin/bash

domain="${1:?Usage: $0 <domain>}"

echo "=== $domain ==="
echo "IP(s): $(dig +short A "$domain" 2>/dev/null | tr '\n' ' ')"
echo "Mail: $(dig +short MX "$domain" 2>/dev/null | awk 'NR==1{print $2}')"
echo "SPF: $(dig +short TXT "$domain" 2>/dev/null | grep -o 'v=spf[^"]*' | head -1)"

whois_output=$(timeout 5 whois "$domain" 2>/dev/null)
echo "Created: $(echo "$whois_output" | grep -i 'creation' | head -1)"
echo "Registrar: $(echo "$whois_output" | grep -i 'registrar' | head -1)"
