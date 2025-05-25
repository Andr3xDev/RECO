#!/bin/bash

check_port() {
    host="$1"
    port="$2"
    
    nc -zv "$host" "$port" 2>&1 | grep -q "succeeded"

    if [ $? -eq 0 ]; then
        service=$(echo "" | nc "$host" "$port" | grep -oP '(?<=^|\n)SSH|HTTP|HTTPS|FTP|SMTP|POP3|IMAP(?=$|\n)')
        if [ -z "$service" ]; then
            service="Unknown"
        fi
        echo "Port $port is open and running service: $service"
    else
        echo "Port $port is closed or unreachable"
    fi
}
