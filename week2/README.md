# Biological Computing in Python
Python is a contemporary, user-friendly, interpreted (partially compiled) programming language designed with code readability as a priority. It offers a wide range of robust packages suitable for diverse biological applications and analyses. Python scripts in week2 help users in learning scientific programming for biology with Python.

## align_seqs.py
This script align two DNA sequences read from a CSV file and save the best alignment and score to a text file.

## basic_csv.py
This script import a csv file containing species taxonomic, distribution and body mass information. After indexing all species names and their corresponding body mass in a loop, they are written as a new csv file.

## basic_io1.py
This script opens a .txt and prints all lines within it in a loop.

## basic_io2.py
This script also opens a .txt and append new 100 elements separated by lines.

## basic_io3.py
This script pickles a dictionary and saves it to a binary file and unpickles it.

## boilerplate.py
A fresh trial to give a taste on writing a python program.

## cfexercises1.py
This script contains a collection of functions for basic mathematical operations which can be called and tested.

## cfexercises2.py
This script uses different ways (six functions) to say hello (X) to test how many times “hello” will be printed when meeting specific conditions.

## control_flow.py
This script generates a python program containing a set of basic numerical functions.

## debugme.py
The first try on python debugging with command %pdb in terminal.

## dictionary.py
This script creates a dictionary (`taxa_dic`) mapping taxonomic orders to sets of species names. It demonstrates two approaches:(1) Using conventional loops; (2) Using a dictionary comprehension

## lc1.py
This script extract latin names, common names, and mean body masses from bird data, with (1) using list comprehensions, and (2) using conventional loops.

## lc2.py
Process UK rainfall data to filter months (sometimes together with rainfall) based on rainfall thresholds, with (1) and (2) using list comprehensions, and (3) using conventional loops.

## loops.py
This script tests different loops like **for-in** and **while**.

## MyExampleScript.py
This script defines a simple function in outputing the squared input parameter to test running the script in Unix and (i)python shell.

## oaks_debugme.py
Filter oak species from a CSV file and save them to a new CSV file. Additionally, it can identify oak species even with minor typos in the genus name. Docstring includes examples and can be tested with doctest set in the key function is_an_oak(name).  

## oaks.py
This scripts finds species names started with 'quercus' (both lower and upper case) using two methods: (1) 'traditional' loops, and (2) list comprehensions

## sysargv.py
This script prints the argument variables in Python which hold the arguments I pass to my Python script.

## test_control_flow.py
A python program that contains a function called even_or_odd() to identify whether an input (number) is even or odd and prints two example usages with this function in **main** function. A doctest is also applied to check some simple tests incluced in the docstring for that function.

## tuple.py
This script print bird species data (latin name, common name, mass) in a formatted manner.

## using_name.py
This script additionally can be treated as an importable module and prints out messages either when being run byself 'Python3 using_name.py' in the bash shell or when being imported from another script/program/module.

## bodymass.csv & testcsv.csv
The latter one is a .csv data file containing information of 'Species','Infraorder','Family','Distribution','Body mass male (Kg)' and **bodymass.csv** extracts only the 'Species' and 'Body mass male(kg)' information.

## DNAseq.csv
A simple .csv file contains the two DNA sequences used for align_seq.py

## JustOaksData.csv & TestOaksData.csv
The latter .csv file contains 5 records of tree(?) species with their genus also listed. The first .csv file is the filter result of **oaks_debugme.py** from the latter one which only contains genus and species names of oak trees with genus = 'Quercus' with certain extents of flexibility to accept both lower and upper case and similar spellings.

## best_alignment.txt
The output best match DNA sequences and match score from **align_seqs.py**.



