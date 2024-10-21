# IT Infrastructure Security Project

This project provides a multi-layered defense strategy to protect servers, applications, and websites from various types of cyber attacks. It includes firewall setup, real-time monitoring, vulnerability scanning, DDoS protection, and more. By leveraging tools like Nuclei, Nmap, Fail2Ban, and custom Python/Bash scripts, this project offers a complete solution to securing your IT infrastructure.


## Features

1. **Firewall and Intrusion Detection**: Configure iptables firewall rules.
2. **Real-Time Monitoring and Alerts**: Monitor CPU, memory, and disk usage and send alerts.
3. **Web Application Firewall (WAF)**: Protect against SQL injection and XSS attacks.
4. **Brute Force Protection**: Use Fail2Ban to block IPs showing signs of brute force.
5. **Vulnerability Scanning**: Automated vulnerability scanning using Nmap.
6. **DDoS Protection**: NGINX rate limiting to prevent DDoS attacks.
7. **Incident Response**: Automatically block IPs when suspicious activity is detected.
8. **Encrypted Backups**: Secure and encrypt backups automatically.

## How to Set Up

1. Run the `firewall/firewall_setup.sh` to configure the basic firewall.
2. Use `monitoring/real_time_monitor.py` to enable real-time monitoring and alerts.
3. Configure and run the Web Application Firewall (WAF) using `waf/waf.py`.
4. Set up brute force protection with `brute_force_protection/fail2ban_setup.sh`.
5. Automate vulnerability scans with [projectdiscovery](https://github.com/projectdiscovery/nuclei-templates/graphs/contributors) `vulnerability_scanner/vulnerability_scan.py`.
6. Apply DDoS protection using the `ddos_protection/ddos_protection.conf` with your NGINX setup.
7. Enable automated incident response using `incident_response/incident_response.py`.
8. Backup and encrypt important files with `backups/backup_script.sh`.

## Installation
**Prerequisites**
 * Linux (Ubuntu/Debian preferred)
 * Python 3.6+
 * Nuclei by ProjectDiscovery
 * Nmap
 * NGINX (for DDoS protection)
 * Fail2Ban
 * iptables and gpg for encryption

### Step-by-Step Installation
1. Clone the Repository
Clone the repository to your local machine:
```
git clone https://github.com/lamcodeofpwnosec/IT_Infrastructure_Security.git
```
2. Install Dependencies
Install required packages and tools using the following commands:
```
sudo apt update
sudo apt install python3-pip fail2ban nmap iptables gpg nginx -y
pip3 install psutil requests
```
3. Install Nuclei
Install Nuclei by running the following commands:

```
curl -s https://api.github.com/repos/projectdiscovery/nuclei/releases/latest | grep "browser_download_url.*nuclei-linux-amd64.zip" | cut -d '"' -f 4 | wget -qi -
unzip nuclei-linux-amd64.zip
sudo mv nuclei /usr/local/bin/
```
Ensure that Nuclei is correctly installed by running:
```
nuclei -version
```
4. Set Up Firewall Rules
Navigate to the `firewall/`` directory and run the firewall setup script:
```
cd firewall
sudo bash firewall_setup.sh
```
5. Set Up Brute Force Protection
Set up Fail2Ban to block brute force attacks:
```
cd ../brute_force_protection
sudo bash fail2ban_setup.sh
```
6. Configure DDoS Protection
Copy the NGINX rate limiting configuration to your NGINX configuration file:
```
sudo cp ../ddos_protection/ddos_protection.conf /etc/nginx/nginx.conf
sudo systemctl restart nginx
```
### Usage
1. **Real-Time Monitoring**
To monitor your system's CPU, memory, and disk usage in real-time and send alerts, run the Python script:
```
cd monitoring
python3 real_time_monitor.py
```
2. Vulnerability Scanning
You can run vulnerability scans using either Nmap or Nuclei by following the steps below:
 * Nmap Scan:
```
cd ../vulnerability_scanner
python3 vulnerability_scan.py
```
Choose option 1 for Nmap and enter the target IP.

3. Block Suspicious IP
If you detect suspicious activity, you can block an IP by running the following script:
```
cd ../firewall
sudo bash block_ip.sh <IP_ADDRESS>
```
4. Backup and Encrypt Data
To back up and encrypt sensitive data, use the following backup script:
```
cd ../backups
sudo bash backup_script.sh
```
### Author
IT Infrastructure Security Project was created by [@lamcodeofpwnosec](https://github.com/lamcodeofpwnosec/).