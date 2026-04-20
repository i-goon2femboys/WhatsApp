import webview
import os
import sys
import shutil

VERSION = "1.0.0"

DATA_DIR = os.path.expanduser("~/.local/share/whatsapp-client")
USER_DATA_DIR = os.path.join(DATA_DIR, "user-data")

def main():
    if "--reset" in sys.argv:
        if os.path.exists(USER_DATA_DIR):
            shutil.rmtree(USER_DATA_DIR)
            print("Session data cleared successfully.")
        else:
            print("No session data found to clear.")
        sys.exit(0)

    os.makedirs(USER_DATA_DIR, exist_ok=True)

    window = webview.create_window(
        title="WhatsApp",
        url="https://web.whatsapp.com",
        width=1280,
        height=820,
        min_size=(800, 600)
    )

    print(f"Launching WhatsApp Client v{VERSION}...")
    webview.start(private_mode=False, user_data_dir=USER_DATA_DIR, debug=False)

if __name__ == "__main__":
    main()
