#!/bin/sh
# Author: zw2425@imperial.ac.uk
# Script: ConcatenateTwoFiles.sh
# Description: Merge two files into one
# Arguments: 1 -> tab delimited file
# Date: Oct 2025

#If 2 arguments are not provided, print this 'error' message
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <file1> <file2> <output_file>"
    exit 1
fi
# Check that the input file is a regular file and exists
if [ ! -f "$1" & "$2"]; then
    echo "Error: File '$1' not found!"
    exit 1
fi

cat $1 > $3
cat $2 >> $3
echo "Merged File is"
cat $3