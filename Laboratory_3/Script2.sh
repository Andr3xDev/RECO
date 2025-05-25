#!/bin/bash

# Validates two first parameters exist
if [ $# -lt 2 ] || [ $# -gt 3 ]; then
    echo "Uso: $0 <no_files> <max_size> [directory]"
    exit 1
fi

no_files="$1"
max_size="$2"
start_dir="${3:-$(pwd)}"

# Validate given directory exist
if [ ! -d "$start_dir" ]; then
    echo "Error: El directorio '$start_dir' no existe."
    exit 1
fi

# Search files on the given directory and shows the size, name and path
find "$start_dir" -type f -size -"$max_size" -printf "%s %p\n" 2>/dev/null | sort -n | head -n "$no_files" | awk '{
    size=$1; 
    file=$2; 
    sub(/[^/]+$/, "", file); 
    print "Name:", $2, "| Path:", file, "| Sizr:", size, "bytes"
}'
