/***

Title
======

__spearman2__ -- Calculate generalized Spearman rho for a set of predictors and countinous outcome.

Syntax
------

__spearman2__ yvar varlist

- - -

Options:

>    __yvar__ : Continuous variable

>    __varlist__ : Variable list.

- - -

Description
-----------

__spearman2__ calculates the generalized Spearman's rho of the _yvar_ with each of the variables in _varlist_.

***/

*capture program drop spearman2
program spearman2
* REQUIRES egenmore

syntax varlist(fv) [if] [in]
display `"`varlist'"'

quietly{

preserve

local nvars : word count `varlist'
tokenize `"`varlist'"'
egen _spearman2_ranky = rank(`1')

generate _spearman2_varname = " "
replace _spearman2_varname = "Y = "+"`1'" in 1
label variable _spearman2_varname "Variable"
generate _spearman2_rho2 = .
label variable _spearman2_rho2 "Adjusted rho^2"
generate _spearman2_N = .
label variable _spearman2_N "N"
generate _spearman2_r2 = .
label variable _spearman2_r2 "rho^2"


forvalues i=2/`nvars' {
display "``i''"
display "Got here"
  if substr("``i''",1,2) == "i."{
    quietly regress _spearman2_ranky ``i'' `if' `in'
  }
  else {
    egen _rank_``i'' = rank(``i'')
    quietly regress _spearman2_ranky _rank_``i'' c._rank_``i''#c._rank_``i'' `if' `in'
  }
  replace _spearman2_varname = "``i''" in `i'
  local r2adj = (1 - (1 - e(r2)) * (e(N) - 1) / e(df_r))
  replace _spearman2_rho2 = `r2adj' in `i'
  replace _spearman2_N = e(N) in `i'
   replace _spearman2_r2 = e(r2) in `i'
  }


keep in 1/`nvars'
keep _spearman2_*
generate _spearman2_forsort = -1*_spearman2_rho2
sort _spearman2_forsort in 2/`=_N'
generate _spearman2_row = `=_N' - _n
}

tabdisp _spearman2_varname, cell(_spearman2_rho2 _spearman2_r2 _spearman2_N)

quietly egen _spearman2_plotaxis = axis(_spearman2_forsort), label(_spearman2_varname)

graph dot (asis) _spearman2_rho2 in 2/`=_N', ///
 over(_spearman2_plotaxis) ///
 title(Potential Predictive Power) ///
 ytitle(Spearman's {&rho}{superscript:2} (adjusted))
restore

end
