# Biological computing in R & Data management and visualization
R is a powerful, freely available statistical programming language that has become the standard tool for data analysis and visualization in biological sciences. Originally based on commercial statistical software, R has evolved into a comprehensive environment for statistical computing, data mining, and mathematical modeling in biology.

Scripts not for assigned practicals are generally used for giving a taste on certain aspects of R language and can be directly run from the Bash terminal in VScode, using *source name-of-the-script.R* or from Rstudio (my preference). Example usages of practical scripts will be given if necessary.

## apply1.R
This script creates a 10×10 matrix M filled with 100 random normal values, then uses ***apply()*** to compute and print the mean of each row ***(apply(M, 1, mean))***, the variance of each row ***(apply(M, 1, var))***, and the mean of each column ***(apply(M, 2, mean))***.

## apply2.R
Defines ***SomeOperation()*** which multiplies a vector by 100 if its sum > 0, otherwise returns it unchanged. Creates a 10×10 random matrix M (seed=1) and applies this function to each row, printing the results.

## break.R
Demonstrates the **break** statement: initializes i=0, runs a while loop that prints i from 0 to 9 and breaks when i==10, preventing infinite execution.

## browse.R
Defines ***Exponential()*** to simulate exponential growth ***(N[t] = N[t-1] * exp(r))*** over 10 generations with ***browser()*** pauses for debugging, then plots it. Also defines an unused ***buggy_function()*** referencing undefined unknown_variable.

## basic_io.R
Imports **trees.csv** from ../data/ into MyData with headers.
Exports multiple versions to ../results/MyData.csv:

    Full dataset (overwrites)
    First row appended
    Full dataset with row names
    Full dataset without column names

## boilerplate.R
A template function ***MyFunction()*** that prints the class/type of its two arguments and returns them as a vector. Tests it with numeric (1,2) and character ("Riki","Tiki") inputs.

## control_flow.R
Demonstrates control structures:

    if-else for boolean a and random z ≤ 0.5
    for loops: 1:10 (squares), species vector, character vector v1
    while loop printing squares 1² to 10²

## Florida.R
Imports **KeyWestAnnualMeanTemperature.RData** from ../data/ and loads it into the workspace as ats. Computes the observed correlation between Year and Temp, then runs a 10,000-iteration permutation test by shuffling temperature values to estimate the p-value of the correlation under the null hypothesis of no relationship.

## Florida.tex
A LaTeX document reporting the results of the permutation test from **Florida.R**. Includes sections on Introduction, Methods, Results (with table), and Interpretation.

## Girko.R
Simulates Girko’s circular law: builds a 250×250 random matrix M, computes its eigenvalues, and plots them in the complex plane. Overlays a theoretical circle of radius sqrt(N) using a custom ***build_ellipse()*** function. Saves the plot as ../results/Girko.pdf.

## DataWrang.R
Imports two files from ../data/:

1. PoundHillData.csv (no headers) → raw species abundance matrix
2. PoundHillMetaData.csv (with headers, semicolon-separated) → metadata
Wrangles the raw data by: transposing, replacing blanks with zeros, converting to data frame, assigning column names, and melting into long format using reshape2::melt(). Converts factors and count to correct types. Explores data with dplyr (group_by, summarise, filter, etc.).

## MyBars.R
Imports **Results.txt** from ../data/ into data frame a. Creates a multi-linerange plot using ggplot2 to visualize three response variables (y1, y2, y3) across x, with custom colors and labels from Label column. Saves the plot as ../results/MyBars.pdf

## plotLin.R
Generates synthetic data: ***y = -4 + 0.25x + noise***, fits a linear regression, and creates a scatterplot with points colored by absolute residual size (black=small, red=large). Adds the regression line, a mathematical annotation using parse=TRUE, and custom axis label with Greek symbols. Saves the plot as ../results/MyLinReg.pdf.

## PP_Regress.R
Imports **EcolArchives-E089-51-D1.csv** from ../data/. For each combination of FeedingType and PredatorStage, fits a linear regression of Prey.mass ~ Predator.mass (on original scale, but plotted log-log). Exports regression results (slope, intercept, R², F-stat, p-value) to ../results/PP_Regress_Results.csv. Creates a faceted log-log scatterplot with regression lines per life stage and saves it as ../results/PP_Regress.pdf.

## R_conditionals.R
Defines three conditional functions:

***is.even()***: checks if n %% 2 == 0

***is.power2():*** checks if log2(n) is integer
is.prime(): checks divisibility from 2 to n-1

Each returns a descriptive string. Tests with example inputs (6, 4, 3).

## preallocate.r
Compares performance of vector growth vs preallocation:

***NoPreallocFun***(): grows vector via c(a, i) → slow (quadratic time)

***PreallocFun***(): preallocates with rep(NA, x) → fast (linear time)

Uses ***system.time()*** to show preallocation is much faster for large x.

## TreeHeight.R
Imports **trees.csv** from ../data/ into Treedata.
Defines ***TreeHeight()*** to compute tree height using trigonometry: ***height = distance × tan(radians)*** from angle (degrees) and distance (m).
Loops through all 120 trees, calculates heights, and stores in Height_results.
Creates TreesHt data frame with original data + computed Tree.Height.m, then exports it as ../results/TreeHts.csv.

## R_conditionals.R
Defines three conditional functions using if-else:

***is.even()***: checks if n %% 2 == 0

***is.power2()***: checks if log2(n) is integer

***is.prime():*** checks divisibility from 2 to n-1

Each returns a descriptive string. Tests with inputs: is.even(6), is.power2(4), is.prime(3).

## Vectorize2.R
Simulates the stochastic Ricker population model with Gaussian noise for 1000 populations over 100 years.
Defines two versions:

***stochrick()***: double for loop (population × year) — slow

***stochrickvect():*** vectorized over populations (only loop over years) — faster

Uses ***system.time()*** to compare performance.

## sample.R
Demonstrates efficiency of sampling and iteration in R.
Defines ***myexperiment()*** to sample n values from popn and return mean.

Compares 5 methods to run 10,000 iterations:

loopy_sample1: c() growth (slow)

loopy_sample2: preallocated vector (fast)

loopy_sample3: preallocated list (medium)

lapply_sample: lapply() (fast)

sapply_sample: sapply() (fastest, returns vector)

Uses ***system.time()*** to show vectorized sapply is most efficient.

## Try.R
Defines doit(): samples x with replacement, computes mean only if >30 unique values, otherwise stop().
lapply(1:15, function(i) try(doit(popn), FALSE)) to catch errors with try(..., silent=FALSE) — prevents crash on failure.
(Commented code shows equivalent for loop with preallocation.)

## SQLinR.R
Demonstrates SQL in R using sqldf and RSQLite.
Installs sqldf, connects to SQLite database Test.sqlite (creates if missing). 
Manually creates table Consumer and inserts 3 rows via SQL.
Imports Resource.csv from ../Data/ into R, then writes it to database as table Resource.
Queries data with ***dbGetQuery()***, lists tables/fields, reads table.
Closes connection and removes data frame.
Creates/modifies Test.sqlite in working directory.

## Vectorize1.R
Compares loop-based vs vectorized matrix summation.
Creates 1000×1000 matrix M of random uniforms.

***SumAllElements():*** nested for loops → slow
***sum(M):*** built-in vectorized function → fast

Uses ***system.time()*** to show vectorization is ~100× faster.

## Ricker.R
Defines Ricker() to simulate the deterministic Ricker population model:
***N[t] = N[t-1] * exp(r * (1 - N[t-1]/K))***

Returns population trajectory over generations.
Plots example with 10 generations.