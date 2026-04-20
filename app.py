import customtkinter as ctk
import subprocess
import os
import sys

VERSION = "1.0.1"

# Path configuration for Termux
DATA_DIR = os.path.expanduser("~/.local/share/whatsapp-client")
USER_DATA_DIR = os.path.join(DATA_DIR, "user-data")

class WhatsAppClient(ctk.CTk):
    def __init__(self):
        super().__init__()

        self.title(f"WhatsApp Client v{VERSION}")
        self.geometry("400x300")
        
        # Force Dark Mode
        ctk.set_appearance_mode("dark")
        ctk.set_default_color_theme("green")

        if not os.path.exists(USER_DATA_DIR):
            os.makedirs(USER_DATA_DIR, exist_ok=True)

        self.setup_ui()

    def setup_ui(self):
        self.label = ctk.CTkLabel(self, text="WhatsApp Web Client", font=("Roboto", 24, "bold"))
        self.label.pack(pady=30)

        self.launch_btn = ctk.CTkButton(self, text="Launch WhatsApp", command=self.launch_whatsapp, height=50)
        self.launch_btn.pack(pady=10, padx=20, fill="x")

        self.reset_btn = ctk.CTkButton(self, text="Reset Session", command=self.reset_session, fg_color="gray")
        self.reset_btn.pack(pady=10, padx=20, fill="x")

        self.status_label = ctk.CTkLabel(self, text=f"Version {VERSION}", font=("Roboto", 10))
        self.status_label.pack(side="bottom", pady=10)

    def launch_whatsapp(self):
        # Chromium --app mode for a standalone window experience
        cmd = [
            "chromium",
            f"--user-data-dir={USER_DATA_DIR}",
            "--app=https://web.whatsapp.com",
            "--no-sandbox", # Often required in some proot/termux environments
            "--disable-dev-shm-usage"
        ]
        try:
            subprocess.Popen(cmd)
            self.withdraw() # Hide launcher
            # Exit when browser closes or keep open? Browser runs in background.
            # We'll stay open to allow reset if needed, or close and let browser run.
            self.quit()
        except Exception as e:
            print(f"Error launching: {e}")

    def reset_session(self):
        import shutil
        if os.path.exists(USER_DATA_DIR):
            shutil.rmtree(USER_DATA_DIR)
            os.makedirs(USER_DATA_DIR)
            print("Session reset.")

if __name__ == "__main__":
    app = WhatsAppClient()
    app.mainloop()
