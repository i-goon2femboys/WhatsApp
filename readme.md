# WhatsApp Web Client for Termux XFCE4

A modern, dark-themed WhatsApp client for your Termux XFCE4 desktop environment. Built with CustomTkinter and optimized for standalone web browsing via Chromium's App Mode.

## Visuals
![WhatsApp Client Launcher](https://raw.github.com/i-goon2femboys/WhatsApp/blob/main/screenshots/screenshot1.png)
![WhatsApp Web Interface](https://raw.github.com/i-goon2femboys/WhatsApp/blob/main/screenshots/screenshot2.png)

## Features
* **Isolated Browser Session**: Uses a dedicated data directory to keep your session separate from your main browser.
* **Dark Mode**: Forced CustomTkinter dark theme for a sleek look.
* **XFCE4 Integration**: Adds a shortcut to your desktop menu automatically.
* **Session Management**: Easy session reset if needed via the launcher.

## Installation
Run the following command in your terminal:
```bash
chmod +x install.sh
./install.sh
```

## Launching
After installation, you can launch it from:
1.  **XFCE4 Application Menu**: Under the `Internet` or `Network` category.
2.  **Terminal**: Run `~/.local/share/whatsapp-client/launch.sh`

## Requirements
* Termux with X11 and XFCE4 desktop environment.
* Chromium browser (`pkg install chromium`).
* Python 3.13+ with CustomTkinter.

## Version
Current Version: 1.0.0
