#!/bin/bash

# Ensure Termux prefix paths are prioritized
export PATH="/data/data/com.termux/files/usr/bin:$PATH"

# Set application home (assuming scripts are in ~/.local/bin/whatsapp-client)
APP_DIR="/data/data/com.termux/files/home/.local/share/whatsapp-client"

# Check if app.py exists in APP_DIR, otherwise use current
if [ -f "$APP_DIR/app.py" ]; then
    python3 "$APP_DIR/app.py"
else
    python3 "$(dirname "$0")/app.py"
fi
