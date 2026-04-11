#!/bin/bash
if [ -z "$1" ]; then
    echo "Usage: $0 <log_file>"
    exit 1
fi

LOGFILE="$1"
attacker_ip=$(awk '{print $1}' "$LOGFILE" | sort | uniq -c | sort -nr | head -n 1 | awk '{print $2}')
count=$(grep -c "^$attacker_ip" "$LOGFILE")
echo "$count"
