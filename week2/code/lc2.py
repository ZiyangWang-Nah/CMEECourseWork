#!/usr/bin/env python3 

"""
lc2.py

Descriptions: 
    Process UK rainfall data to filter months (sometimes together with rainfall) based on rainfall thresholds,
    with (1) and (2) using list comprehensions, and (3) using conventional loops.

Usage:
    python3 lc2.py
"""

# Average UK Rainfall (mm) for 1910 by month
# http://www.metoffice.gov.uk/climate/uk/datasets
rainfall = (('JAN',111.4),
            ('FEB',126.1),
            ('MAR', 49.9),
            ('APR', 95.3),
            ('MAY', 71.8),
            ('JUN', 70.2),
            ('JUL', 97.1),
            ('AUG',140.2),
            ('SEP', 27.0),
            ('OCT', 89.4),
            ('NOV',128.4),
            ('DEC',142.2),
           )

# (1) Use a list comprehension to create a list of month,rainfall tuples where
# the amount of rain was greater than 100 mm.
months_rain_100 = [(month, rain) for month, rain in rainfall if rain > 100]

# (2) Use a list comprehension to create a list of just month names where the
# amount of rain was less than 50 mm. 
months_50 = [month for month, rain in rainfall if rain < 50]

# (3) Now do (1) and (2) using conventional loops (you can choose to do 
# this before 1 and 2 !). 
months_rain_100 = []
months_50 = []
for month, rain in rainfall:
    if rain > 100:
        months_rain_100.append((month, rain))
    if rain < 50:
        months_50.append(month)


# A good example output is:
#
# Step #1:
# Months and rainfall values when the amount of rain was greater than 100mm:
# [('JAN', 111.4), ('FEB', 126.1), ('AUG', 140.2), ('NOV', 128.4), ('DEC', 142.2)]
# ... etc.

