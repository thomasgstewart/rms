/***

Title
======

__cox_lhhat_ci__ -- Generate predictions and associated confidence intervals from a Cox logistic regression model.

Syntax
------

__cox_lhhat_ci__ [,xb rh sp alpha(str) stub(str) qt(numlist integer >0 <100) spt(numlist integer >0) drop]

- - -

Options:

>    __xb__ : Calculate the log relative hazard

>    __rh__ : Calculate the relative hazard

>    __sp__ : Calculate survival probability at observed time

>    __alpha__ (_str_) : Alpha level for confidence intervals

>    __stub__ (_str_) : A string which will serve as a prefix for the generated variables.

>    __spt__ (_numlist_) : Generate the conditional survival probabilities at the times specified in the number list.

>    __qt__ (_numlist_) : Generate the quantile survival time for the quantiles specified in the number list.

>    __drop__ : If specified, the command will write over existing variables.

- - -

Description
-----------

__cox_lhhat_ci__ will generate predictions from a Cox regression model.  This command is built on top of the {help predict:{it:predict}} command.

***/

capture program drop cox_lhhat_ci
program cox_lhhat_ci

syntax [,xb rh sp alpha(str) stub(str) qt(numlist integer >0 <100) spt(numlist integer >0) drop]

local cmd = e(cmd)
if "`cmd'" != "cox" {
  display "This function is for cox regression"
  error 301
}

	capture drop _tgsdrop*

	if "`alpha'" == "" {
	  local alpha = 0.05
	}
	local z = invnorm(1 - `alpha'/2)
	
	if "`xb'" == "" & "`sp'" == "" & "`rh'" == "" & "`qt'" == "" & "`spt'" == ""{
	  local rh = "rh"
	}
	
	predict _tgsdrop_xbhat, xb
	predict _tgsdrop_xbhatse, stdp

	generate _tgsdrop_xbhat_lb = _tgsdrop_xbhat - `z' * _tgsdrop_xbhatse
	generate _tgsdrop_xbhat_ub = _tgsdrop_xbhat + `z' * _tgsdrop_xbhatse

	local dv = "time"

	if "`xb'" == "xb" {
		if "`drop'" == "drop" {
			capture fussydrop `stub'`dv'_xbhat
			capture fussydrop `stub'`dv'_xbhat_lb
			capture fussydrop `stub'`dv'_xbhat_ub
		}
		generate `stub'`dv'_xbhat = _tgsdrop_xbhat
		generate `stub'`dv'_xbhat_lb = _tgsdrop_xbhat_lb
		generate `stub'`dv'_xbhat_ub = _tgsdrop_xbhat_ub
	}
	if "`rh'" == "rh" {
		if "`drop'" == "drop" {
			capture fussydrop `stub'`dv'_rhhat
			capture fussydrop `stub'`dv'_rhhat_lb
			capture fussydrop `stub'`dv'_rhhat_ub
		}
		generate `stub'`dv'_rhhat = exp(_tgsdrop_xbhat)
		generate `stub'`dv'_rhhat_lb = exp(_tgsdrop_xbhat_lb)
		generate `stub'`dv'_rhhat_ub = exp(_tgsdrop_xbhat_ub)
	}
	if "`sp'" == "sp" {
	*http://www.stata.com/statalist/archive/2012-05/msg00271.html
		if "`drop'" == "drop" {
			capture fussydrop `stub'Sp_`dv'
		}
		capture confirm variable _basesurv
		if _rc{
			capture predict double _basesurv, basesurv
			if _rc != 0 {
				display "Survival probabilities are only calculated for e(sample) data"
			}
		}
		capture predict double _tgsdrop_relhaz, hr
		capture gen double `stub'sp_`dv' = _basesurv^_tgsdrop_relhaz
	}
	if "`spt'" != "" {
		foreach j in `spt'{
			if "`drop'" == "drop" {
				capture fussydrop `stub'sp_`j'
			}
			quietly sp_survival, sp(`j') stub(`stub')
		}
	}
	if "`qt'" != "" {
		foreach j in `qt' {
			if "`drop'" == "drop" {
				capture fussydrop `stub'q`j'_time
			}
			quietly q_survival, q(`j') stub(`stub')
		}
	}
	

	capture drop _tgsdrop*
end


capture program drop q_survival
program q_survival

syntax, q(real) [stub(str)]

local cmd = e(cmd)
if "`cmd'" != "cox" {
  display "This function is for cox regression"
  error 301
}

gen _tgsdrop_id = _n

capture confirm variable _basesurv
if _rc{
  predict double _basesurv, basesurv
}

tempfile tmp1
save tmp1, replace

predict xb, xb
gen lmls = log(-log(_basesurv))
gen rhs = log(-log(`q'/100)) - xb
stack _t lmls _tgsdrop_id rhs, into(a b) clear
gsort -b
gen qtime = a if _stack == 1 
replace qtime = qtime[_n-1] if _n > 1 & qtime[_n] == .
drop if _stack == 1
gen _tgsdrop_id = a
drop a b _stack

sort _tgsdrop_id
tempfile tmp2
save tmp2, replace

use tmp1
merge 1:1 _tgsdrop_id using "tmp2"
drop _tgsdrop*
drop _merge

rename qtime `stub'q`q'_time

end

capture program drop sp_survival
program sp_survival

syntax, sp(numlist integer max=1 >0) [stub(str)]

local cmd = e(cmd)
if "`cmd'" != "cox" {
  display "This function is for cox regression"
  error 301
}

capture confirm variable _basesurv
if _rc{
  predict double _basesurv, basesurv
}


gen _tgsdrop_t = _t if _t <= `sp'
egen _tgsdrop_max_t = max(_tgsdrop_t)

gen long _tgsdrop_id = _n 
sum _tgsdrop_id if _t == _tgsdrop_max_t, meanonly 
gen double _tgsdrop_basesurv = _basesurv[`r(min)']

predict _tgsdrop_xb, xb
gen double `stub'sp_`sp' = _tgsdrop_basesurv^exp(_tgsdrop_xb)

drop _tgsdrop*
end
