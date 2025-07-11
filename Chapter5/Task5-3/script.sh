#!/bin/bash

# -----------------------------------------------------------------------------
# Script Name: script.sh
#
# Description:
#   Recursively lists the contents of one or more directories in a structured,
#   indented format to give a visual idea of the directory hierarchy.
#
# Usage:
#   ./script.sh [directory1] [directory2] ...
#
#   If you provide one or more directory paths as arguments, the script will
#   display a tree-like view of each directory and its subdirectories.
#
# Example:
#   ./script.sh /path/to/project
#
# Output:
#   /path/to/project
#       file1.txt
#       subdir1
#           file2.txt
#           subdir2
#               file3.txt
#
# Notes:
# - This script uses only Bash built-in features and does not require the `tree` command.
# - It handles directories and files with spaces correctly.
# - Tab/indentation uses 4 spaces per level for better readability across systems.
# -----------------------------------------------------------------------------

recls () {
    singletab="    "   # 4 spaces instead of tab for portability
    for tryfile in "$@"; do
        echo "$tryfile"
        if [ -d "$tryfile" ]; then
            thisfile="$tryfile"
            recdir "$tryfile"
        fi
    done
    unset dir singletab tab
}

recdir () {
    tab="$tab$singletab"
    dir="$1"
    shift
    for file in "$dir"/*; do
        name=$(basename "$file")
        echo -e "$tab$name"
        if [ -d "$file" ]; then
            recdir "$file"
        fi
    done
    tab="${tab%"$singletab"}"
}

recls "$@"
