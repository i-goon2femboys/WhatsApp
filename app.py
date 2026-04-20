import webview
import os
import sys
import shutil

VERSION = "1.3.1"

# Path configuration for Termux
DATA_DIR = os.path.expanduser("~/.local/share/whatsapp-client")
USER_DATA_DIR = os.path.join(DATA_DIR, "user-data")

def main():
    # Handle session reset via terminal flag
    if "--reset" in sys.argv:
        if os.path.exists(USER_DATA_DIR):
            shutil.rmtree(USER_DATA_DIR)
            print("Session data cleared successfully.")
        else:
            print("No session data found to clear.")
        sys.exit(0)

    # Ensure data directory exists
    if not os.path.exists(USER_DATA_DIR):
        os.makedirs(USER_DATA_DIR, exist_ok=True)

    # Create the integrated webview window
    window = webview.create_window(
        title="WhatsApp",
        url="https://web.whatsapp.com",
        width=1200,
        height=800,
        min_size=(800, 600)
    )

    # Start the application
    # private_mode=False ensures cookies/session are saved in USER_DATA_DIR
    print(f"Launching WhatsApp Client v{VERSION}...")
    webview.start(private_mode=False, user_data_dir=USER_DATA_DIR, debug=False)

if __name__ == "__main__":
    main()
