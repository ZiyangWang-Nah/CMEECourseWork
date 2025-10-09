#!/bin/sh
# Author: zw2425@imperial.ac.uk
# Script: tabtocsv.sh
# Description: substitute the tabs in the files with commas
#
# Saves the output into a .csv file
# Arguments: 1 -> tab delimited file
# Date: Oct 2019



# Check that exactly one argument is provided
if [ "$#" -ne 1 ]; then
    echo "Error: Missing input file."
    echo "Usage: $0 <input_file>"
    exit 1
fi

# Cat the input file, replace tab with comma, save to a new file with .csv extension
echo "Creating a comma delimited version of $1 ..."
cat $1 | tr -s "\t" "," >> $1.csv
echo "Done!"
exit
