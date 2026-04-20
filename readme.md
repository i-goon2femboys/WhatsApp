# WhatsApp Client for XFCE4

A fully integrated, native-feeling WhatsApp Web client for the XFCE4 Desktop Environment running on Termux X11 or proot-distro. Built with `pywebview` and `WebKitGTK`, it delivers a true standalone application window without the clutter of a full browser.


---

## Features

- **Standalone Window** — Opens WhatsApp Web in its own dedicated window, fully separated from any browser.
- **Persistent Sessions** — Stays logged in between launches using an isolated user data directory at `~/.local/share/whatsapp-client/user-data`.
- **Session Reset** — A built-in `--reset` flag wipes all session data for a clean logout.
- **Custom Icon** — High-resolution 512×512 WhatsApp-style icon generated programmatically with Pillow.
- **XFCE4 Menu Integration** — Automatically registers a `.desktop` entry so the app appears in your application menu.
- **Termux-Native Paths** — All paths follow strict Termux prefix conventions (`/data/data/com.termux/files/`).

---

## Requirements

- Termux with X11 or proot-distro running an XFCE4 desktop environment
- `webkit2gtk-4.0` (installed automatically by `install.sh`)
- Python 3.13+ with `pywebview` and `Pillow` (installed automatically by `install.sh`)

---

## Installation

Clone or copy the project files into a directory, then run:

```bash
chmod +x install.sh
./install.sh
```

The installer will:

1. Update `pkg` package lists
2. Install `webkit2gtk-4.0`, `python-gobject`, and other system dependencies
3. Install `pywebview` and `Pillow` via `pip`
4. Generate `icon.png` using `generate_icon.py`
5. Copy all application files to `~/.local/share/whatsapp-client/`
6. Register `whatsapp.desktop` with the XFCE4 application menu

---

## Usage

### From the XFCE4 Menu

Search for **WhatsApp** in your application menu and click to launch.

### From the Terminal

```bash
~/.local/share/whatsapp-client/launch.sh
```

### Reset Session (Logout & Clear Cache)

To log out completely and wipe all locally stored session data:

```bash
~/.local/share/whatsapp-client/launch.sh --reset
```

This permanently deletes `~/.local/share/whatsapp-client/user-data`. The next launch will require scanning the QR code again.

---

## Uninstallation

```bash
chmod +x uninstall.sh
./uninstall.sh
```

This removes the application directory and the desktop entry, then refreshes the XFCE4 menu database.

---

## File Structure

```
~/.local/share/whatsapp-client/
├── app.py              # Main pywebview application
├── generate_icon.py    # Pillow icon generation script
├── icon.png            # Generated application icon (512×512)
├── launch.sh           # Wrapper script with Termux path setup
├── 1.0.0               # Version marker file
└── user-data/          # Session persistence directory (created on first launch)
```

---

## Version

**Current Version:** 1.0.0

---

## Troubleshooting

| Issue | Solution |
|---|---|
| Window does not open | Ensure `DISPLAY` is set: `export DISPLAY=:0` |
| QR code not loading | Check your internet connection |
| Session not persisting | Verify write permissions on `~/.local/share/whatsapp-client/` |
| `webkit2gtk` errors | Re-run `install.sh` or run `pkg install webkit2gtk-4.0` manually |
