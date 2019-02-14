/***

Title
======

__regress_yhat_ci__ -- Generate predictions and associated confidence intervals from a linear regression model.

Syntax
------

__regress_yhat_ci__ [, forecast alpha(int) stub(str) drop]

- - -

Options:

>    __forecast__ : If specified, the command generates individual forecast intervals instead of population mean intervals (which is the default output).

>    __alpha__ (_int_) : A number; the default is 5 which generates 95% confidence intervals.  If specified, the command will generate  (1-alpha)% confidence intervals.

>    __stub__ (_str_) : A string which will serve as a prefix for the generated variables.

>    __drop__ : If specified, the command will write over existing variables.

- - -

Description
-----------

__regress_yhat_ci__ will generate predictions and associated confidence intervals from a linear regression model.  This command is built on top of the {help predict:{it:predict}} command.

Example(s)
----------

See {help plotdata:{it:plotdata}}

***/

*capture program drop regress_yhat_ci
program regress_yhat_ci
//http://www.stata.com/statalist/archive/2007-03/msg00372.html

syntax [, forecast alpha(str) stub(str) drop]


local cmd = e(cmd)
if "`cmd'" != "regress" {
  display "This function only works for linear regression."
  error 301
}


	if "`forecast'" == "forecast" {
	  local type = "stdf"
	}
	else {
	  local type = "stdp"
	}

	if "`alpha'" == "" {
	  local alpha = 0.05
	}


	local dv = e(depvar)

	if strlen("`stub'") > 32-9 {
	  display as error "Your variable stub has too many characters)."
	  exit
	}

	if strlen("`stub'`dv'")+7 > 32 {
	  display as error "NOTE: " as text "Because STATA variable names are limited to 32 characters,"
	  display "the generated variables will have a different name than usual. If you used"
	  display "the drop command, variables may be unintentionally overwritten."
	  display "Short name: " as error "`stub'y_hat"
	  display as text "The usual, but overly long variable name: " as error "`stub'`dv'_hat"
	  local dv = "y"
	}

	if "`drop'" == "drop" {
		capture fussydrop `stub'`dv'_hat
		capture fussydrop `stub'`dv'_hat_lb
		capture fussydrop `stub'`dv'_hat_ub
	}

	predict `stub'`dv'_hat, xb
	predict _yhatse, `type'

	generate `stub'`dv'_hat_lb = `stub'`dv'_hat - invttail(e(df_r),`alpha'/2) * _yhatse
	generate `stub'`dv'_hat_ub = `stub'`dv'_hat + invttail(e(df_r),`alpha'/2) * _yhatse

	drop _yhatse


end
