/***
# Title

__gini_mean_difference__ --- Compute the Gini mean difference.

## Syntax

__gini_mean_difference__ varname [if] [in]

## Description

This command computes the Gini mean difference.

## Example

    getvdata nhgh
    gini_mean_difference gh


## Acknowledgment

This funtion is a wrapper of the _lmoments_ command written by  Nicholas J. Cox.
***/


*capture program drop gini_mean_difference
program gini_mean_difference, rclass
* Based on NICK COX'S lmoments

syntax varname [if] [in]

quietly lmoments `1' `if' `in'
local gmd = 2 * `r(l_2)'
display "Gini mean difference: " "`gmd'"
return local gmd = `gmd'
end
