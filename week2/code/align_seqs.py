#!/usr/bin/env python3
"""
Description:
    Align two DNA sequences read from a CSV file
    and save the best alignment and score to a text file.

Usage:
    python align_seqs.py
"""

__appname__ = 'DNA sequence alignment'
__author__ = 'Ziyang Wang-Nah (zw2425@ic.ac.uk)'
__version__ = '1.0.0'
__license__ = "MIT"

import sys
import pandas as pd
import os

# Function to compute score
def calculate_score(s1, s2, l1, l2, startpoint):
    matched = ""
    score = 0
    for i in range(l2):
        if (i + startpoint) < l1:
            if s1[i + startpoint] == s2[i]:
                matched += "*"
                score += 1
            else:
                matched += "-"
    return score, matched


def main(argv):
    # Read sequences from CSV
    data = pd.read_csv("../data/DNAseq.csv")
    seq1 = data["sequence"][0]
    seq2 = data["sequence"][1]

    # Assign longer to s1
    l1 = len(seq1)
    l2 = len(seq2)
    if l1 >= l2:
        s1, s2 = seq1, seq2
    else:
        s1, s2 = seq2, seq1
        l1, l2 = l2, l1  # swap lengths

    # Compute best alignment
    my_best_align = None
    my_best_score = -1

    for i in range(l1):
        score, matched = calculate_score(s1, s2, l1, l2, i)
        if score > my_best_score:
            my_best_align = "." * i + s2
            my_best_score = score

    # Create results directory if missing
    os.makedirs("../results", exist_ok=True)

    # Save results to file
    out_path = "../results/best_alignment.txt"
    with open(out_path, "w") as out:
        out.write("Best alignment:\n")
        out.write(my_best_align + "\n")
        out.write(s1 + "\n")
        out.write(f"Best score: {my_best_score}\n")

    print(f"Best alignment and score saved to {out_path}")
    return 0


if __name__ == "__main__":
    status = main(sys.argv)
    sys.exit(status)
