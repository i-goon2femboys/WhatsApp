#!/bin/bash

# Define paths
APP_DIR="$HOME/.local/share/whatsapp-client"
DESKTOP_DIR="$HOME/.local/share/applications"

echo "### Removing WhatsApp Client files..."
rm -rf "$APP_DIR"
rm -f "$DESKTOP_DIR/whatsapp.desktop"

echo "### Updating desktop database..."
update-desktop-database "$DESKTOP_DIR"

echo "### Uninstall complete."
