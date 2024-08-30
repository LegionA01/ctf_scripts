#!/bin/bash

# Check if the correct number of arguments are provided
if [ "$#" -lt 2 ]; then
    echo "Usage: $0 <string_to_search> <directory> [<additional_directories>...]"
    exit 1
fi

# The string to search for
search_string=$1
shift  # Shift arguments to remove the first one (string_to_search)

# Loop through all provided directories
for dir in "$@"; do
    if [ -d "$dir" ]; then
        echo "Searching in directory: $dir"
        grep -r "$search_string" "$dir" 2>/dev/null
    else
        echo "Directory $dir does not exist."
    fi
done

