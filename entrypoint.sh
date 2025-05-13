#!/bin/bash

echo "[INFO] Setting font permissions..."
chmod 644 /var/www/onlyoffice/documentserver/fonts/Bookman*

echo "[INFO] Rebuilding font cache..."
fc-cache -f -v

echo "[INFO] Listing Bookman fonts..."
fc-list | grep -i bookman || echo "[WARNING] Bookman fonts not found."

echo "[INFO] Starting ONLYOFFICE services..."
/app/ds/run-document-server.sh
