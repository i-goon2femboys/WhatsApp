#!/bin/bash
export PATH="/data/data/com.termux/files/usr/bin:$PATH"

APP_DIR="/data/data/com.termux/files/home/.local/share/whatsapp-client"

if [ -f "$APP_DIR/app.py" ]; then
    exec python3 "$APP_DIR/app.py" "$@"
else
    exec python3 "$(dirname "$(realpath "$0")")/app.py" "$@"
fi
