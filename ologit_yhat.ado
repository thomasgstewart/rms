/***

Title
======

__ologit_yhat__ -- Generate predictions and associated confidence intervals from an ordered logistic regression model.

Syntax
------

__ologit_yhat__ [, centiles(numlist) stub(str) drop]

- - -

Options:

>    __centiles__ (_numlist_) : A number list between 0 - 100.

>    __stub__ (_str_) : A string which will serve as a prefix for the generated variables.

>    __drop__ : If specified, the command will write over existing variables.

- - -

Description
-----------

__ologit_yhat__ will generate predictions from an ordered logistic regression model.  This command is built on top of the {help predict:{it:predict}} command.

***/


capture program drop ologit_yhat
program ologit_yhat

syntax [if] [in] [, centiles(numlist integer >0 <100) stub(str) drop ]

local cmd = e(cmd)
if "`cmd'" != "ologit" {
  display "This function works for postestimation of ologit"
  error 301
}


local dv =  "`e(depvar)'"

if "`centiles'" == "" {
  local centiles = 50
}

if "`drop'" == "drop" {
  capture fussydrop `stub'`dv'_mean
  foreach j in `centiles' {
    capture fussydrop `stub'`dv'_q`j'
  }
}

capture drop _tgsdrop_*

gen _tgsdrop_cump = 0
gen `stub'`dv'_mean = 0
mat kmat = e(cat)

predict _tgsdrop_p*, p

foreach j in `centiles' {
  quietly gen `stub'`dv'_q`j' = .
  quietly gen _tgsdrop_`stub'`dv'_q`j'_ind = 0
}

forvalues i = 1/`e(k_cat)' {
quietly replace _tgsdrop_cump = _tgsdrop_cump + _tgsdrop_p`i'
quietly replace `stub'`dv'_mean = kmat[1,`i']*_tgsdrop_p`i' + `stub'`dv'_mean
foreach j in `centiles' {
  quietly replace `stub'`dv'_q`j' = kmat[1,`i'] if _tgsdrop_cump >= `j'/100 & _tgsdrop_`stub'`dv'_q`j'_ind == 0
  quietly replace _tgsdrop_`stub'`dv'_q`j'_ind = `i' if _tgsdrop_cump >= `j'/100 & _tgsdrop_`stub'`dv'_q`j'_ind == 0
}
}

quietly drop _tgsdrop*

end
