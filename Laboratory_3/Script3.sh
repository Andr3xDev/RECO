#!/bin/bash
clear

# Function to display currently running processes
show_processes() {
    echo -e "\nRunning Processes:"
    ps -eo pid,comm,%mem,%cpu --sort=-%cpu | head -n 15
}

# Function to search for a process by name
search_process() {
    read -p "Enter the process name to search: " process_name
    ps aux | grep -i "$process_name" | grep -v "grep"
}

# Function to kill a process by PID
kill_process() {
    read -p "Enter the PID of the process to kill: " pid
    if kill -9 "$pid" 2>/dev/null; then
        echo "Process $pid successfully terminated."
    else
        echo "Error terminating the process. Check the PID."
    fi
}

# Function to restart a process by name
restart_process() {
    read -p "Enter the process name to restart: " process_name
    pid=$(pgrep -o "$process_name")  # Get the oldest PID of the process
    if [ -n "$pid" ]; then
        kill -9 "$pid" && sleep 1 && "$process_name" &
        echo "Process $process_name restarted successfully."
    else
        echo "Process '$process_name' not found."
    fi
}

# Interactive menu
while true; do
    echo -e "\n===== Process Management Menu ====="
    echo "1) Show running processes"
    echo "2) Search for a process by name"
    echo "3) Kill a process by PID"
    echo "4) Restart a process by name"
    echo "5) Exit"
    read -p "Select an option: " option

    case $option in
        1) clear; show_processes ;;
        2) clear; search_process ;;
        3) clear; kill_process ;;
        4) clear; restart_process ;;
        5) echo "Exiting..."; exit 0 ;;
        *) echo "Invalid option. Please try again." ;;
    esac
done
