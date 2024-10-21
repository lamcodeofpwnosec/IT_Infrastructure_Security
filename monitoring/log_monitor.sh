#!/bin/bash
# Log Monitoring Script

log_file="/var/log/auth.log"
last_checked=$(date)

# Monitor log file for specific keywords (e.g., "Failed password", "Unauthorized")
tail -Fn0 $log_file | while read line; do
    echo "$line" | grep -i "failed password"
    if [ $? = 0 ]; then
        echo "Suspicious activity detected: $line"
        echo "Suspicious activity detected on $(date): $line" | mail -s "Security Alert" admin@example.com
    fi
done
