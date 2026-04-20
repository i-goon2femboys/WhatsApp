#!/bin/bash
set -e

export PATH="/data/data/com.termux/files/usr/bin:$PATH"

APP_DIR="$HOME/.local/share/whatsapp-client"
DESKTOP_DIR="$HOME/.local/share/applications"
SCRIPT_DIR="$(dirname "$(realpath "$0")")"

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  WhatsApp Client Installer v1.0.0"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

echo ""
echo "[1/6] Updating package lists..."
pkg update -y

echo ""
echo "[2/6] Installing system packages..."
pkg install -y python-tkinter python-gobject webkit2gtk-4.0 xdg-utils update-desktop-database

echo ""
echo "[3/6] Installing Python dependencies..."
pip install pywebview Pillow

echo ""
echo "[4/6] Generating application icon..."
python3 "$SCRIPT_DIR/generate_icon.py"

echo ""
echo "[5/6] Setting up application directory..."
mkdir -p "$APP_DIR"
cp "$SCRIPT_DIR/app.py" "$APP_DIR/"
cp "$SCRIPT_DIR/launch.sh" "$APP_DIR/"
cp "$SCRIPT_DIR/generate_icon.py" "$APP_DIR/"
cp "$SCRIPT_DIR/icon.png" "$APP_DIR/"
cp "$SCRIPT_DIR/1.0.0" "$APP_DIR/"
chmod +x "$APP_DIR/launch.sh"

echo ""
echo "[6/6] Registering with XFCE4 application menu..."
mkdir -p "$DESKTOP_DIR"
cp "$SCRIPT_DIR/whatsapp.desktop" "$DESKTOP_DIR/whatsapp.desktop"
update-desktop-database "$DESKTOP_DIR"

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  Installation complete!"
echo "  Launch: WhatsApp from your XFCE4 application menu"
echo "  Reset:  $APP_DIR/launch.sh --reset"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
