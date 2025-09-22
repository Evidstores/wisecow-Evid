import psutil
import datetime

CPU_THRESHOLD = 80
MEMORY_THRESHOLD = 80
DISK_THRESHOLD = 90
LOG_FILE = "system_health.log"

def log_alert(message):
    timestamp = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    alert = f"[{timestamp}] ALERT: {message}"
    print(alert)
    with open(LOG_FILE, "a") as f:
        f.write(alert + "\n")

def check_system():
    cpu = psutil.cpu_percent(interval=1)
    memory = psutil.virtual_memory().percent
    disk = psutil.disk_usage("/").percent
    processes = len(psutil.pids())

    if cpu > CPU_THRESHOLD:
        log_alert(f"High CPU Usage: {cpu}%")
    if memory > MEMORY_THRESHOLD:
        log_alert(f"High Memory Usage: {memory}%")
    if disk > DISK_THRESHOLD:
        log_alert(f"High Disk Usage: {disk}%")
    if processes > 300:
        log_alert(f"High number of processes: {processes}")

if __name__ == "__main__":
    check_system()
