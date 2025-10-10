#!/bin/sh
# Author: zw2425@imperial.ac.uk
# Script: csvtospace.sh
# Description: substitute the commas in the files with tabs
#
# Saves the output into a .txt file
# Arguments: 1 -> comma delimited file
# Date: Oct 2025

# Check that exactly one argument is provided
if [ "$#" -ne 1 ]; then
    echo "Error: Missing input file."
    echo "Usage: $0 <input_csv_file>"
    exit 1
fi
# Check that the input file is a regular file and exists
if [ ! -f "$1" ]; then
    echo "Error: File '$1' not found!"
    exit 1
fi
#  Cat the input file, replace comma with tab, save to a new file with .txt extension
echo "Creating a space delimited version of $1 ..."
cat $1 | tr -s "," "\t" >> $1.txt
echo "Done! Output saved to $1.txt"
exit 