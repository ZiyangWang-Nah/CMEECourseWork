#!/bin/sh
# Author: zw2425@ic.ac.uk
# Script: csvtospace.sh
# Description: Converts a CSV file to a space-separated file.
# Usage: ./csvtospace.sh <input_csv_file>
# Date: Oct 2025

# Check that exactly one argument is provided
if [ "$#" -ne 1 ]; then
    echo "Error: Missing input file."
    echo "Usage: $0 <input_csv_file>"
    exit 1
fi

#  Cat the input file, replace comma with tab, save to a new file with .txt extension
echo "Creating a space delimited version of $1 ..."
cat $1 | tr -s "," "\t" >> $1.txt
echo "Done! Output saved to $1.txt"
exit 