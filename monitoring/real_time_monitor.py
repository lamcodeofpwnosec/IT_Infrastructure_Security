import psutil
import time
import requests

def send_alert(message):
    webhook_url = 'https://hooks.slack.com/services/YOUR/WEBHOOK/URL'
    payload = {'text': message}
    requests.post(webhook_url, json=payload)

def monitor_system():
    while True:
        cpu_usage = psutil.cpu_percent(interval=1)
        memory_info = psutil.virtual_memory()
        disk_usage = psutil.disk_usage('/')

        # Check thresholds
        if cpu_usage > 80:
            send_alert(f"High CPU Usage: {cpu_usage}%")
        if memory_info.percent > 80:
            send_alert(f"High Memory Usage: {memory_info.percent}%")
        if disk_usage.percent > 80:
            send_alert(f"High Disk Usage: {disk_usage.percent}%")

        time.sleep(60)  # Run every minute

if __name__ == "__main__":
    monitor_system()
