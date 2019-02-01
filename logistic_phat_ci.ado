/***

Title
======

__logistic_phat_ci__ -- Generate predictions and associated confidence intervals from a logistic regression model.

Syntax
------

__logistic_phat_ci__ [,xb alpha(_int_) stub(_str_) drop]

- - -

Options:

>    __xb__ : If specified, the command generates predictions on the log odds scale.  If not specified, the command generates predictions on the probability scale.

>    __alpha__ (_int_) : A number; the default is 5 which generates 95% confidence intervals.  If specified, the command will generate  (1-alpha)% confidence intervals.

>    __stub__ (_str_) : A string which will serve as a prefix for the generated variables.

>    __drop__ : If specified, the command will write over existing variables.

- - -

Description
-----------

__logistic_phat_ci__ will generate predictions and associated confidence intervals from a logistic regression model.  This command is built on top of the {help predict:{it:predict}} command.

Example(s)
----------

See {help plotdata:{it:plotdata}}

***/

*capture program drop logistic_phat_ci
program logistic_phat_ci
//http://www.stata.com/statalist/archive/2007-03/msg00372.html

syntax [,xb alpha(str) stub(str) drop]


local cmd = e(cmd)
if "`cmd'" != "logistic" {
  display "This function only works for logistic regression."
  error 301
}

	if "`alpha'" == "" {
	  local alpha = 0.05
	}
	local z = invnorm(1 - `alpha'/2)

	if "`xb'" == "" {
	  local xb = "p"
	}


	predict _xbhat, xb
	predict _xbhatse, stdp

	generate _xbhat_lb = _xbhat - `z' * _xbhatse
	generate _xbhat_ub = _xbhat + `z' * _xbhatse

	local dv = e(depvar)
	if "`drop'" == "drop" {
		capture fussydrop `stub'`dv'_`xb'hat
		capture fussydrop `stub'`dv'_`xb'hat_lb
		capture fussydrop `stub'`dv'_`xb'hat_ub
	}

	if "`xb'" == "xb" {
		generate `stub'`dv'_`xb'hat = _xbhat
		generate `stub'`dv'_`xb'hat_lb = _xbhat_lb
		generate `stub'`dv'_`xb'hat_ub = _xbhat_ub
	}
	if "`xb'" == "p" {
		generate `stub'`dv'_`xb'hat = 1 / ( 1 + exp(-_xbhat))
		generate `stub'`dv'_`xb'hat_lb = 1 / ( 1 + exp(-_xbhat_lb))
		generate `stub'`dv'_`xb'hat_ub = 1 / ( 1 + exp(-_xbhat_ub))
	}

	drop _xbhat _xbhatse _xbhat_lb _xbhat_ub

end
