# Week1
The ***../week1*** contains 4 directories which are **'data'**, **'code'**, **'results'** and **'sandbox'**. **'data'** contains all data files used to support practice files in the **'code'** directory. **'results'** dir is empty and **'sandbox'** dir is under .gitignore so that both folders do not appear under ***../week1***. Here are some comments made on these exercises.
## Chap1 ***FASTA Exercise***
#1 '-l' after 'wc' counts lines of a certain file or specific file(s) under a designated directory

#2 'tail -n +2' prints everything from the second line

#3 After extracting the whole genome, 'wc -m' counts characters which in this case character length = genome sequence length

#4 After removing the first info line in Fasta.file and newlines, 'grep -o' matches only "ATGC" and 'wc -l' counts line of the 'filtered' E.coli fasta

#5 for i from 1 to the length of the genome sequence, each base out of 4 is counted corrspondingly and then stored in 'b' when looped ith time
## Chap2 ***Improving Scripts***
Let's take **tabtocsv.sh** and **ConcatenateTwoFiles.sh** as examples of robust scripts that offer users error messages if right inputs are not provided
### tabtocsv.sh
Three 'pairs' of 'if, then, fi' are applied to improve scripts:

["$#" -ne 1] means the number of input argument is not equal to 1;

[ ! -f "$1" ] means the input argument is not (!) a regular file (-f), and

["$1" != *.txt ] means first input argument is not a txt.extension file
### ConcatenateTwoFiles.sh
Quite similar to the previous exercise but the the number of input arguments are 2 ($1 and $2) as the $3 is output argument. 

## ***A new shell script***
I suppose **csvtospace.sh** is just a reversed version of **tabtocsv.sh**
