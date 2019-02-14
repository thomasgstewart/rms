/***

Title
======

__point_ci__ -- Create plot of point estimates and confidence intervals

Syntax
------

__point_ci__ pointest pointest_lb pointest_ub axisvar [_if_] [_in_] [, vertical labelvar(str) plot_options(str) ci_options(str) point_options(str) ytitle(str)]

- - -


>    __pointest__ : Name of variable with point estimates.

>    __pointest_lb__ : Name of variable with point estimate lower bound.

>    __pointest_ub__ : Name of variable with point estimate upper bound.

>    __axisvar__ : Name of y-axis (usually) variable.

>    __vertical__ : Optional.  Plots the CIs vertically instead of horizontally.

>    __labelvar(str)__ : Name of variable with estimate labels.
  
>    __plot_options(str)__ : Optional. STATA commands to customize the plot.
  
>    __ci_options(str)__ : STATA commands to customize the confidence intervals.  (Commands are included in a twoway line command.)
 
>    __point_options(str)__ : STATA commands to customize the points.  (Commands are included in a twoway scatter command.)
  
- - -

Description
-----------

Creates a plot of point estimates and confidence intervals.

Example
-------

    getvdata nhgh
    regress ht i.re##i.sex
    plotdata, at(sex = 1/2; re = 1/5)
    regress_yhat_ci
    decode(sex), generate(s_sex)
    decode(re), generate(s_re)
    gen label = s_re + " " + s_sex
    egen float row = rank(-10*re+sex) if _plotindicator == 1
    point_ci ht_hat ht_hat_lb ht_hat_ub row if _plotindicator == 1 & sex == 1,  ///
     labelvar(label) ///
     point_options(mcolor(magenta)) ///
     ci_options(lwidth(thick)) ///
     plot_options(title(Mean heights NHANES) xtitle(Height (cm)))

***/

capture program drop point_ci
program point_ci

syntax varlist [if] [in] [, vertical labelvar(str) plot_options(str) ci_options(str) point_options(str) ytitle(str)]

tokenize `varlist'

tempfile temp1
quietly save "`temp1'"

marksample _keep

keep if `_keep'

expand 3
sort `4'
gen _row = _n
gen _odd = mod(_row, 3)
gen _bound = `2' * (_odd == 1) + `3' * (_odd == 2)
replace _bound = . if _odd == 0

if("`labelvar'" != ""){
	labmask `4', values(`labelvar')
	
}

label variable `4' ""

levelsof `4', local(values_labelvar)
//display "`values_labelvar'"

if "`plot_options'" != "" {
	local comma = ", "
} 
else {
	local comma = " "
}

// display "Comma: " "`comma'"
// display "plot_options: " "`plot_options'"

if("`point_options'" != ""){
local point_options = " , " + "`point_options'"
}

if("`vertical'" == "") {
	twoway ///
	 (line `4' _bound, cmissing(n) `ci_options') ///
	 (scatter `4' `1' if _odd == 0 `point_options')  ///
	 , ylabel(`values_labelvar', valuelabel angle(horizontal)) ///
	 legend(off) ///
	 `plot_options' 
}
else {
	twoway ///
	 (line _bound `4', cmissing(n)) /// 
	 (scatter `1' `4' if _odd == 0) ///
	 `comma' `plot_options'
}

use "`temp1'", clear

end
