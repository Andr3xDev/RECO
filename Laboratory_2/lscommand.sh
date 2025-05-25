#!/bin/bash

#-----------------------------------------------------------------
# Validates arguments exists in this script
#-----------------------------------------------------------------
if [ -z "$1" ]; then
    echo "No se indicó el directorio"
    exit 1
fi

DIR="$(cd "$1" 2>/dev/null && pwd)"


#-----------------------------------------------------------------
# Validates the given directory exist and continue the script 
#-----------------------------------------------------------------
function validate_dir() {
    if [ -d "$DIR" ]; then
        cd "$DIR" || exit 3
        echo "--------------------------------------------------"
        echo "Este es el contenido del diretorio"
        echo " "
        ls -A
        sleep 1
        main_menu
    else
        echo "Directorio no válido"
        exit 2
    fi
}


#-----------------------------------------------------------------
# First menu and the principal
#-----------------------------------------------------------------
function print_menu() {
    echo ""
    echo "-------------------------------------"
    echo "These are the options available:"
    echo ""
    echo "1. Sort directories"
    echo "2. Filter directories"
    echo "3. Exit"
    echo "-------------------------------------"
}


#-----------------------------------------------------------------
# Menu of sorting the list
#-----------------------------------------------------------------
function print_menu_sort() {
    echo ""
    echo "-------------------------------------"
    echo "These are the sorting options available:"
    echo ""
    echo "1. Most recent"
    echo "2. Oldest"
    echo "3. Size from largest to smallest"
    echo "4. Size from smallest to largest"
    echo "5. File type"
    echo "6. Return"
    echo "-------------------------------------"
}


#-----------------------------------------------------------------
# Menu of filtering the list
#-----------------------------------------------------------------
function print_menu_filter() {
    echo ""
    echo "-------------------------------------"
    echo "These are the filtering options available:"
    echo ""
    echo "1. Starting from string"
    echo "2. Ends with string"
    echo "3. Contains string"
    echo "4. Return"
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
            1) sort_directories ;;
            2) filter_directories ;;
            3) exit 0 ;;
            *) echo "Invalid option"; sleep 1 ;;
        esac
    done
}


#-----------------------------------------------------------------
# Sorting menu
#-----------------------------------------------------------------
function sort_directories() {
    while true; do
        print_menu_sort
        read -p "Select an option: " choice
        case $choice in
            1) sort_most_recent ;;
            2) sort_oldest ;;
            3) sort_size_large ;;
            4) sort_size_small ;;
            5) sort_file_type ;;
            6) break ;;
            *) echo "Invalid option"; sleep 1 ;;
        esac
    done
}


#-----------------------------------------------------------------
# Filtering menu
#-----------------------------------------------------------------
function filter_directories() {
    while true; do
        print_menu_filter
        read -p "Select an option: " choice
        case $choice in
            1) filter_starts; sleep 1 ;;
            2) filter_end; sleep 1 ;;
            3) filter_contains; sleep 1 ;;
            4) break ;;
            *) echo "Invalid option"; sleep 1 ;;
        esac
    done
}


#-----------------------------------------------------------------
# Sort functions
#-----------------------------------------------------------------
function sort_most_recent() {
    clear
    ls -At
} 
function sort_oldest() {
    clear
    ls -Atr
}
function sort_size_small() {
    clear
    ls -AlhSr
} 
function sort_size_large() {
    clear
    ls -AlhS
} 
function sort_file_type() {
    clear
    ls -A
    files=$(find . -maxdepth 1 -type f | wc -l)
    dirs=$(find . -maxdepth 1 -type d | wc -l)
    dirs=$((dirs - 1))
    echo "Archivos: $files"
    echo "Directorios: $dirs"
    sleep 1
} 


#--------------------------------------------------------
# Filter functions
#--------------------------------------------------------
function filter_contains() {
    clear
    read -p "Ingresa la cadena: " string1
    ls -A | grep "$string1"
}
function filter_starts() {
    clear
    read -p "Ingresa la cadena: " string2
    ls -A | grep "^$string2"
}
function filter_end() {
    clear
    read -p "Ingresa la cadena: " string3
    ls -A | grep "$string3$"
}


#--------------------------------------------------------
# Main function to start the script
#--------------------------------------------------------
function main() {
    clear
    validate_dir
}

main