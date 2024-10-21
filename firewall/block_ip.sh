#!/bin/bash
# Block IP Script

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <IP_ADDRESS>"
    exit 1
fi

IP=$1

# Block the given IP
iptables -A INPUT -s $IP -j DROP
iptables-save > /etc/iptables/rules.v4

echo "Blocked IP: $IP"
