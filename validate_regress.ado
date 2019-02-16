/***

# Title

__validate_regress__ --- Calculate optimism corrected measures of linear regression model performance


## Syntax

__validate_regress__, [reps(str) seed(str)]

- - -

Options:


> __reps__ (_str_): The number of bootstrap replicates to calculate optimism.  Defaults to 50.

> __seed__ (_str_): The seed for the bootstrap simulation.  Defaults to 1.

- - -

## Description

This command calculates the optimism corrected measures of R-squared for a previously estimated linear regression model.

## Example

    getvdata support
    regress totcst i.dzgroup slos
    validate_regress
***/


capture program drop validate_regress
program validate_regress

syntax , [reps(str) seed(str)]

if inlist("`e(cmd)'", "regress") != 1 {
  display "This command is for linear regression."
  display "The most recent estimation command was " "`e(cmd)'"
  exit
}

if "`reps'" == "" {
local reps = "50"
display "setting reps(" "`reps'" ")"
}

if "`seed'" == "" {
local seed = "1"
display "setting seed(" "`seed'" ")"
}


qui tempfile tmpfile
qui save `tmpfile'

tokenize `"`e(cmdline)'"'
local obs_r2 = e(r2)

qui simulate optim = r(optim), reps(`reps') seed(`seed'): regress_one_delta, command(`e(cmdline)')

qui summarize optim
local corrected = `obs_r2' - r(mean)

label variable optim "Bootstrap Optimism"
// hist optim, xline(`r(mean)')

display ""
display "| Measure | Observed | Optimism corrected |"
display "|---------|----------|--------------------|"
display "| R^2     |   " %4.3f `obs_r2' "  |       " %4.3f `corrected' "        |"

clear
qui use `tmpfile'
end

capture program drop optimism_one_rep
program optimism_one_rep, eclass

syntax, [obs cmdline(str)]

preserve
if "`obs'" != "obs" {
bsample
}

if "`cmdline'" != "" {
  local command = "`cmdline'"
}
else {
  local command = e(cmdline)
  estimates store original
}

tokenize `"`command'"'

if "`1'" == "regress" {
quietly `command'
restore
predict _yhat, xb
quietly corr _yhat `2'
drop _yhat
matrix optimism = (r(rho)^2)
matrix colnames optimism = R2
matrix rownames optimism = optimism
}
else if inlist("`1'", "logistic", "logit") == 1 {
quietly `command'
restore
predict _phat, pr
quietly brier `e(depvar)' _phat
matrix optimism = (r(brier), r(roc_area))
matrix colnames optimism = Brier AUC
drop _phat
}
else if inlist("`1'", "stcox") == 1 {
quietly `command'
restore
quietly estat concordance, all
matrix optimism = (r(C), r(D))
matrix colnames optimism = Harrells_C Somers_D
}

if "`cmdline'" != "" {

}
else {
  quietly estimates restore original
}

ereturn post optimism
end


capture program drop optimism
program optimism

syntax , [reps(str) seed(str)]

if "`reps'" == "" {
local reps = "100"
display "setting reps(" "`reps'" ")"
}

if "`seed'" == "" {
local seed = "1"
display "setting seed(" "`seed'" ")"
}

if inlist("`e(cmd)'", "logistic", "logit", "regress", "stcox", "cox") != 1 {
  display "This command is for linear, logistic, and cox regression at the moment."
  display "The most recent estimation command was " "`e(cmd)'"
  exit
}

local cmdline = "`e(cmdline)'"

estimates store original
preserve
quietly drop if _est_original != 1

optimism_one_rep, cmdline(`cmdline') obs
matrix o = e(b)
matrix rownames o = Observed
display " "
display "Observed discrimination measures: "
matrix list o, noheader
quietly simulate _b, reps(`reps') seed(`seed'): optimism_one_rep, cmdline(`cmdline')
rename _b_*  *
display " "
display "Optimism corrected measures: "
summarize


*use `tmpfile'
restore
quietly estimates restore original

end
