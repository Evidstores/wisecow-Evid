import requests
from datetime import datetime
import random  # for simulation

APP_URL = "http://localhost:4499"

def log_status(message):
    timestamp = datetime.now().strftime("[%Y-%m-%d %H:%M:%S]")
    print(f"{timestamp} {message}")

def check_app():
    # Simulate UP or DOWN randomly for demo
    simulated_status = random.choice(["UP", "DOWN"])
    
    if simulated_status == "UP":
        log_status("Application is UP")
    else:
        log_status("Application is DOWN")

if __name__ == "__main__":
    # Run multiple times to show both statuses
    for _ in range(5):
        check_app()
