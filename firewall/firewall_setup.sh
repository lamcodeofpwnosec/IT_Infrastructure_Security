#!/bin/bash
# Firewall Setup Script

# Flush existing rules
iptables -F

# Default policy: Drop all traffic
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT

# Allow loopback traffic
iptables -A INPUT -i lo -j ACCEPT

# Allow established connections
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

# Allow SSH
iptables -A INPUT -p tcp --dport 22 -j ACCEPT

# Allow HTTP and HTTPS traffic
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp --dport 443 -j ACCEPT

# Log and drop everything else
iptables -A INPUT -j LOG --log-prefix "Dropped: "
iptables -A INPUT -j DROP

# Save iptables rules
iptables-save > /etc/iptables/rules.v4

echo "Firewall setup completed!"
