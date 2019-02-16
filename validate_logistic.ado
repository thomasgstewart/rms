/***

# Title

__validate_logistic__ --- Calculate optimism corrected measures of logistic model performance


## Syntax

__validate_logistic__, [reps(str) seed(str)]

- - -

Options:


> __reps__ (_str_): The number of bootstrap replicates to calculate optimism.  Defaults to 50.

> __seed__ (_str_): The seed for the bootstrap simulation.  Defaults to 1.

- - -

## Description

This command calculates the optimism corrected measures of AUC and the Brier score for a previously estimated logistic regression model.

## Example

    getvdata sex.age.response
    logistic response i.sex age
    validate_logistic

***/

capture program drop validate_logistic
program validate_logistic

syntax , [reps(str) seed(str)]

if inlist("`e(cmd)'", "logistic", "logit") != 1 {
  display "This command is for logistic regression."
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
predict _phat, pr
quietly brier `e(depvar)' _phat
local obs_auc = r(roc_area)
local obs_brier = r(brier)
drop _phat

qui simulate delta_auc = r(delta_auc) delta_brier = r(delta_brier), reps(`reps') seed(`seed'): validate_with_bootstrap, command(`e(cmdline)')

//hist delta_auc

qui summarize delta_auc
local corrected_auc = `obs_auc' - r(mean)

//hist delta_brier
qui summarize delta_brier
local corrected_brier = `obs_brier' - r(mean)

display ""
display "| Measure | Observed | Optimism corrected |"
display "|---------|----------|--------------------|"
display "| AUC     |   " %4.3f `obs_auc' "  |       " %4.3f `corrected_auc' "        |"
display "| Brier   |   " %4.3f `obs_brier' "  |       " %4.3f `corrected_brier' "        |"

clear
qui use `tmpfile'
end

capture program drop validate_with_bootstrap
program validate_with_bootstrap, rclass

syntax, command(str)

tokenize `"`command'"'

//list in 1
preserve
bsample
//list in 1
quietly `command'
predict _phat, pr
quietly brier `e(depvar)' _phat
matrix aaa = (r(brier), r(roc_area))
matrix colnames aaa = Brier AUC

restore

predict _phat, pr
quietly brier `e(depvar)' _phat
matrix bbb = (r(brier), r(roc_area))
matrix colnames bbb = Brier AUC

matrix delta = aaa - bbb
return scalar delta_brier = delta[1,1]
return scalar delta_auc = delta[1,2]
drop _phat
end
