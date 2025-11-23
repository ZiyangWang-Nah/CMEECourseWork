# Week1
Unix is a robust, machine-independent operating system, known for its stability, security, and hierarchical file structure. Modern systems like Linux and macOS are Unix-like environments, providing an ideal habitat for programming and data analysis with their text-based philosophy and extensive toolset. Shell scripting allows users to automate sequences of Unix commands by saving them in executable files. While not a full programming language replacement, shell scripts are perfect for creating utility tools for file manipulation, format conversions, backups, and batch processing, enabling efficient automation of everyday tasks without needing additional software dependencies.  

Scripts not for assigned practicals are generally used for giving a taste on certain aspects of Unix language and can be directly run from the Bash terminal, using *bash name-of-the-script.sh*. Example usages of practical scripts will be given if necessary.

## UnixPrac1.txt
Documents command-line operations for exploring DNA sequences including FASTA file analysis, genome length calculation, pattern matching, and nucleotide frequency analysis.

## boilerplate.sh
Demonstrates basic structure with shebang, comments, and echo commands.

## ConcatenateTwoFiles.sh
Merges the contents of two input files into a single output file using cat commands with basic file validation.  
Example usage (in bash terminal): *bash concatenateTwoFiles.sh eg1.txt eg2.txt*

## CountLines.sh
Counts and displays the number of lines

## csvtospace.sh
Converts CSV files to tab-delimited format by replacing commas with tabs, saving as .txt files with input validation.  
Example usage: Even you forget to specify the input argument, error messages will show up as a reminder. Normally in bash terminal, you should type *bash csvtospace.sh eg1.csv*

## MyExampleScript.sh
Demonstrates variable usage in shell scripts by greeting the current user through both stored variables and direct environment variable access.

## tabtocsv.sh
Converts tab-delimited .txt files to CSV format by replacing tabs with commas, with comprehensive file extension and existence checks.  
Example usage: reversed version of csvtospace.sh

## tiff2png.sh
Converts all TIFF images in the current directory to PNG format 

## variables.sh
Demonstrates various variable types including special parameters, user input reading, and command substitution for arithmetic operations.



