import subprocess

def block_ip(ip):
    command = f"iptables -A INPUT -s {ip} -j DROP"
    subprocess.run(command, shell=True)
    print(f"Blocked IP: {ip}")

if __name__ == "__main__":
    suspicious_ip = "192.168.0.100"  # Example suspicious IP
    block_ip(suspicious_ip)
