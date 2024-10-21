#!/bin/bash
# Fail2Ban Setup Script

sudo apt update
sudo apt install fail2ban -y

# Create a new jail configuration for SSH
cat <<EOL > /etc/fail2ban/jail.local
[sshd]
enabled = true
port = ssh
filter = sshd
logpath = /var/log/auth.log
maxretry = 5
bantime = 3600  # Ban for 1 hour
EOL

# Restart Fail2Ban
sudo systemctl restart fail2ban

echo "Fail2Ban setup completed!"
