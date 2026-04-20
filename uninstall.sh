#!/bin/bash
set -e

export PATH="/data/data/com.termux/files/usr/bin:$PATH"

APP_DIR="$HOME/.local/share/whatsapp-client"
DESKTOP_DIR="$HOME/.local/share/applications"

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  WhatsApp Client Uninstaller"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

echo ""
echo "[1/3] Removing application directory..."
if [ -d "$APP_DIR" ]; then
    rm -rf "$APP_DIR"
    echo "      Removed: $APP_DIR"
else
    echo "      Not found, skipping: $APP_DIR"
fi

echo ""
echo "[2/3] Removing desktop entry..."
if [ -f "$DESKTOP_DIR/whatsapp.desktop" ]; then
    rm -f "$DESKTOP_DIR/whatsapp.desktop"
    echo "      Removed: $DESKTOP_DIR/whatsapp.desktop"
else
    echo "      Not found, skipping."
fi

echo ""
echo "[3/3] Updating desktop database..."
update-desktop-database "$DESKTOP_DIR"

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  Uninstall complete."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
