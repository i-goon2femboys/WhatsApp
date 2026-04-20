# WhatsApp Client for Termux XFCE4

A native, integrated WhatsApp client for your Termux XFCE4 desktop environment. Built with `pywebview` for a standalone desktop application experience.

## Visuals
![WhatsApp Client Icon](icon.png)
![WhatsApp Web Interface](screenshot2.png)

## Features
* **Integrated Experience**: No more opening external browsers. WhatsApp runs in its own window.
* **Session Persistence**: Stays logged in using an isolated user data directory.
* **Custom Icon**: Includes a unique green WhatsApp-style icon generated with Pillow.
* **Direct XFCE4 Integration**: Adds a shortcut to your desktop menu automatically.

## Installation
Run the following command in your terminal:
```bash
chmod +x install.sh
./install.sh
```

## Usage
*   **Launch**: Open "WhatsApp" from your XFCE4 application menu.
*   **Terminal Launch**: Run `~/.local/share/whatsapp-client/launch.sh`
*   **Reset Session**: To log out and clear all data, run `~/.local/share/whatsapp-client/launch.sh --reset`

## Requirements
* Termux with X11 and XFCE4 desktop environment.
* `webkit2gtk-4.0` (installed via `install.sh`).
* Python 3.13+ with `pywebview` and `Pillow`.

## Version
Current Version: 1.0.0
