#!/bin/bash

#-----------------------------------------------------------------
# First menu and the principal
#-----------------------------------------------------------------
function print_menu() {
    echo ""
    echo "-------------------------------------"
    echo "These are the options available:"
    echo ""
    echo "1. Show the last 15 lines of 3 log files"
    echo "2. Filter 15 lines from the same log files to display a specific word"
    echo "3. Exit"
    echo "-------------------------------------"
}


#-----------------------------------------------------------------
# Main menu allow the user interct with this script
#-----------------------------------------------------------------
function main_menu() {
    while true; do
        print_menu
        read -p "Select an option: " choice
        case $choice in
            1) show_last ;;
            2) show_filter ;;
            3) exit 0 ;;
            *) echo "Invalid option"; sleep 1 ;;
        esac
    done
}


#-----------------------------------------------------------------
# Function takes last 3 logs and print 15 lines of each
#-----------------------------------------------------------------
function show_last() {
    clear
    ls /var/log/*.log | head -n 3 | xargs tail -n 15
}


#-----------------------------------------------------------------
# Main menu
#-----------------------------------------------------------------
function show_filter() {
    clear
    read -p "Ingrese la palabra clave: " keywor
    log_files=$(find /var/log/ -type f -name "*.log" | head -n 3)

    if [ -z "$log_files" ]; then
        echo "No se encontraron archivos de log."
        exit 1
    fi

    tail -n 15 $log_files 2>/dev/null | grep "$keyword"
}


#--------------------------------------------------------
# Main function to start the script
#--------------------------------------------------------
function main() {
    clear
    main_menu
}

main