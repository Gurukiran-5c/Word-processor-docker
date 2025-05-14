#!/bin/bash

set -e

echo "[INFO] Ensuring Bookman font files exist..."
if ls /usr/share/fonts/truetype/bookman/Bookman* 1> /dev/null 2>&1; then
  echo "[INFO] Setting font permissions..."
  chmod 644 /usr/share/fonts/truetype/bookman/Bookman*

  echo "[INFO] Rebuilding font cache..."
  fc-cache -f -v

  echo "[INFO] Generating fonts for ONLYOFFICE..."
  /usr/bin/documentserver-generate-allfonts.sh

  echo "[INFO] Verifying Bookman fonts..."
  fc-list | grep -i bookman || echo "[WARNING] Bookman fonts not found."
else
  echo "[WARNING] Bookman font files not found at expected path: /usr/share/fonts/truetype/bookman"
fi

echo "[INFO] Starting ONLYOFFICE services..."
/app/ds/run-document-server.sh
