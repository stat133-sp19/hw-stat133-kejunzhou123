
## Overview

`binomial` is a minimal package that provides functions to get the
probability given trials, success time and provides the functions to get
summary measures like mean, variance, etc. It also generates some plots
to show the probability and cumulative probability.

# Usage

``` r
library(binomial)
#> 
#> Attaching package: 'binomial'
#> The following object is masked from 'package:graphics':
#> 
#>     plot
#> The following objects are masked from 'package:base':
#> 
#>     print, summary
# get the total combination number
bin_choose(5, 1:3)
#> [1]  5 10 10
#get the probability
s=bin_probability(5,trials = 10, prob = 0.5)
s
#> [1] 0.2460938
# get the distribution and plot the distribution
b=bin_distribution(trials = 5, prob = 0.5)
b
#>   success probability
#> 1       0     0.03125
#> 2       1     0.15625
#> 3       2     0.31250
#> 4       3     0.31250
#> 5       4     0.15625
#> 6       5     0.03125

# get the cumulative probabilities
a=bin_cumulative(trials = 5, prob = 0.5)
a
#>   success probability cumulative
#> 1       0     0.03125    0.03125
#> 2       1     0.15625    0.18750
#> 3       2     0.31250    0.50000
#> 4       3     0.31250    0.81250
#> 5       4     0.15625    0.96875
#> 6       5     0.03125    1.00000

# get the variable and print the summary thing
bin1 <- bin_variable(trials = 10, p = 0.3)
bin1
#> $prob
#> [1] 0.3
#> 
#> $trials
#> [1] 10
#> 
#> attr(,"class")
#> [1] "binvar"
binsum1 <- summary(bin1)
binsum1
#>        Length Class  Mode   
#> prob   1      -none- numeric
#> trials 1      -none- numeric

# get functions of measures
bin_mean(10, 0.3)
#> [1] 3
bin_variance(10, 0.3)
#> [1] 2.1
bin_mode(10, 0.3)
#> [1] 3
bin_skewness(10, 0.3)
#> [1] 0.2760262
bin_kurtosis(10, 0.3)
#> [1] -0.1238095
```
