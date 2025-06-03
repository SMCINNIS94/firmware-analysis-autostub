#!/bin/bash

echo "[*] Scanning binaries and shared libs for suspicious patterns..."

# Directory to start from
BASE_DIR="."

# Patterns to search
PATTERNS='sh|bash|system|exec|popen|fork|tmp|/dev|wget|curl|nc|telnet|python|perl|base64'

# Scan all executable binaries and shared libraries
find "$BASE_DIR" -type f \( -name "*.so*" -o -executable \) | while read -r file; do
  echo "[+] Scanning: $file"
  strings "$file" | grep -E "$PATTERNS" && echo "[!] Suspicious strings found in: $file"
done

echo "[*] Scan complete."

