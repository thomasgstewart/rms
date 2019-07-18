/***

# Title

__[plotdata](https://github.com/thomasgstewart/rms)__ --- create and append a dataset for the purposes of generating partial effect plots


## Syntax

__plotdata__ [if] [in] [, at(_str_) ]

- - -

Options:


> __at__ (_str_): a list of variable names and values separated by a semicolon; for example, at(bmi=19.5(1)32.5; sex=1/2; age=45).   There is a limit for the length of STATA numlists, depending on the release and version.  I believe a limit of 1600 elements is the smallest limit.  (You may have a version that allows more.)  Generally speaking, this limit should not impact this function because most plots will not require such a dense set of covariate values.

- - -

## Description

This command creates a dataset by creating all possible combinations of variable values listed in the _at_ option.  The dataset is appended to the current dataset.  The first time the command is used, it creates the variable __#underscore#plotindicator__ to mark which observations are the original data (marked as 0) and which is the newly appended data for the plot (marked as 1).  The second time the command is executed, the newly appended dataset is marked as 2 in the __#underscore#plotindicator__ variable, and so forth.

## Example

    Generate a dataset for plotting where age ranges from 30 to 60 by .5 year increments for level of sex.
        . getvdata sex.age.response
	. plotdata, at(age=30(.5)60; sex=1/2)
	. mkspline_plotindicator age, nknots(3)
	. logistic response i.sex#c.rcs_*
	. logistic_phat_ci, xb
	. twoway (rarea response_xbhat_lb response_xbhat_ub age if sex==2, sort fcolor(blue%70)) ///
	    (line response_xbhat age if sex==2, sort lcolor(blue) lwidth(thick)) ///
	    (rarea response_xbhat_lb response_xbhat_ub age if sex==1, sort fcolor(orange%70)) ///
	    (line response_xbhat age if sex==1, sort lcolor(orange) lwidth(thick)) ///
	    if #underscore#plotindicator==1, ///
	    ytitle(Log relative odds) ///
	    xtitle(Age (years)) ///
	    legend(order(1 "Male" 3 "Female"))

## Author

  Thomas G. Stewart
    thomas.stewart@vanderbilt.edu
    Department of Biostatistics
    Vanderbilt University School of Medicine
***/


capture program drop plotdata
program plotdata
//http://www.stata.com/statalist/archive/2007-03/msg00372.html

syntax [if] [in] [, at(str) ]

local varlist = ""
local counter = 1
if "`at'" != "" {

local at : subinstr local at " " "", all
local at : subinstr local at ";" " ", all

 	foreach p of local at {
 		local whereq = strpos("`p'", "=")
 		if `whereq' == 0 {
 			di as err "invalid syntax in at()"
 			exit 198
 		}
 		else {
 			local varname = substr("`p'",1,`whereq'-1)
			capture confirm variable `varname'
 			if _rc {
 				di as err "`varname'" " not a variable in at()"
 				exit
 			}
 			local spec = substr("`p'",`whereq'+1,.)
 			local spec : subinstr local spec "&" " ", all
 			*display "`spec'"
			numlist "`spec'"
			*display "`spec'"
			local spec "`r(numlist)'"
			*display "`spec'"
 			local spec`counter' = "`spec'"
			local var`counter' = "`varname'"


			local numlistcounter = 0
			foreach j of numlist `spec'{
			  local numlistcounter = `numlistcounter' + 1
			  }
			local Nspec`counter' = `numlistcounter'
			local varlist = "`varlist'" + " " + "`varname'"
			local counter = `counter' + 1
 		}
 	}
 }
 else {
 display "Use this function to add extra data to your dataset for for plotting."
 display "Example syntax: "
 display "  plotdata, at(bmi=19.5(1)32.5 sex=1/2 age=45)"
 display "Within the at() function, specify the values of the variables at which"
 display "you want predict the outcome."
 exit
 }

local plotindicator = "_plotindicator"
capture confirm variable `plotindicator'
if _rc {
  generate `plotindicator' = 0
  gen _maxplot = 0
}
else{
  egen _maxplot = max(`plotindicator')
}

tempfile temp1
quietly save "`temp1'"

quietly drop if _n > 0

local numvars = `counter' - 1
local oldN = _N
local moreN = 0
foreach j of numlist 1/`numvars'{
  if `Nspec`j'' > `moreN' {
    local addN = `Nspec`j'' - `moreN'
    quietly moreobs `addN'
    local moreN = `Nspec`j''
  }
  local startN = `oldN' + 1

  foreach jj of numlist `spec`j''{
    quietly replace `var`j'' = `jj' in `startN'/`startN'
    local startN = `startN' + 1
*    display "`startN'"
  }
}

keep `varlist'
all_combos _all

tempfile temp2
local addedN = _N
quietly save "`temp2'"

use "`temp1'"
append using "`temp2'"
gen _maxplotj = 1
quietly gen _maxplotnext = _maxplot + _maxplotj
quietly replace `plotindicator' = `=_maxplotnext' if `plotindicator' == .
quietly drop _maxplot*
display "`addedN'" " observations added"
end

capture program drop moreobs
program def moreobs
*! 1.0.1 NJC 9 August 1999
* 1.0.0 NJC 22 January 1998
    version 5.0
    if "`2'" != "" {
        di in r "invalid syntax"
        exit 198
    }
    if "`1'" == "" { local newN = _N + 1 }
    else {
        confirm integer number `1'
        local newN = _N + `1'
    }
    set obs `newN'
end
