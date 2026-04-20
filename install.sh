#!/bin/bash

# Define paths
APP_DIR="$HOME/.local/share/whatsapp-client"
BIN_DIR="/data/data/com.termux/files/usr/bin"
DESKTOP_DIR="$HOME/.local/share/applications"

echo "### Installing system packages (WebKitGTK for pywebview)..."
pkg update -y
pkg install -y python-tkinter python-gobject webkit2gtk-4.0 xdg-utils update-desktop-database

echo "### Installing Python dependencies..."
# Removed customtkinter, added pywebview
pip install pywebview Pillow

echo "### Generating custom icon..."
python3 generate_icon.py

echo "### Setting up application directory..."
mkdir -p "$APP_DIR"
cp app.py launch.sh icon.png generate_icon.py 1.0.0 "$APP_DIR/" 2>/dev/null || true

echo "### Configuring execution permissions..."
chmod +x "$APP_DIR/launch.sh"

echo "### Integrating with XFCE4 menu..."
mkdir -p "$DESKTOP_DIR"
cp whatsapp.desktop "$DESKTOP_DIR/"
update-desktop-database "$DESKTOP_DIR"

echo "### Done! You can now find 'WhatsApp' in your XFCE4 menu."
