#!/usr/bin/env python3

"""Description of this program or application.
You can use several lines"""

__appname__ = '[application name here]'
__author__ = 'ZiyangWang-Nah (zw2425@ic.ac.uk)'
__version__ = '0.0.1'
__license__ = "License for this code/program"

## imports ##
import sys # module to interface our program with the operating system

## constants ##
def foo_1(x):
    return x ** 0.5

def foo_2(x, y):
    if x > y:
        return x
    return y

def foo_3(x, y, z):
    if x > y:
        x, y = y, x
    if x > z:
        x, z = z, x
    if y > z:
        y, z = z, y
    return [x, y, z]

def foo_4(x):
    result = 1
    for i in range(1, x + 1):
        result = result * i
    return result

def foo_5(x): # a recursive function that calculates the factorial of x
    if x == 1:
        return 1
    return x * foo_5(x - 1)
     
def foo_6(x): # Calculate the factorial of x in a different way; no if statement involved
    facto = 1
    while x >= 1:
        facto = facto * x
        x = x - 1
    return facto

def main(argv):
    print("This is the main function")
    return 0

if (__name__ == "__main__"):
    status = main(sys.argv)
    sys.exit(status)