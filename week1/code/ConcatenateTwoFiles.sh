#!/bin/bash
#If 2 arguments are not provided, print this 'error' message
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <file1> <file2> <output_file>"
    exit 1
fi

cat $1 > $3
cat $2 >> $3
echo "Merged File is"
cat $3