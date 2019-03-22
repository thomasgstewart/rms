/***

# Title

__all_combos__ --- create all combinations of non-missing values


## Syntax

__all_combos__ varlist

- - -

Options:


> varlist: a list of variable names

- - -

## Description

This command creates a dataset of all possible combinations of non-missing values in the variable list.  It will destroy all other variables and observations.  Should be used with preserve and restore commands.

## Example

    set obs  3
    gen sex = 1
    replace sex = 2 if _n == 1
    gen race = _n
    all_combos sex race

***/

capture program drop all_combos
program all_combos
//Modified version of STATA fillin function.  This version does not
//treat missing as a valid combination.
syntax varlist
tempfile tmp0 tmp1 tmp2
keep `varlist'
save `"`tmp0'"', replace
gen _tgs20190227 = 1 if _n == 1
keep _tgs20190227
drop if missing(_tgs20190227)
save `"`tmp1'"', replace
use `"`tmp0'"', clear
foreach var of varlist `varlist' {
	use `"`tmp0'"', clear
	keep `var'
	duplicates drop
	drop if missing(`var')
	cross using `"`tmp1'"'
	save `"`tmp1'"', replace
}

drop _tgs20190227
sort `varlist'
end
