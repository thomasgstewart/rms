/***

Title
======

__mkspline_plotindicator__ -- Create restricted cubic spline varibles while ignoring plotting data

Syntax
------

__mkspline_plotindicator__ _varname_ [_if_] [_in_] [, nknots(_int_)]

- - -

Required:

>    __varname__ : Name of variable to spline.

>    __nknots__ (_int_): Number of knots.  Can be any integer from 3 to 7.

- - -

Description
-----------

__mkspline_plotindicator__ is used in tandem with the __plotdata__ command.  After adding plotting data to the dataset, this command creates restricted cubic splines but ignores plotting data when calculating knots.

Example(s)
----------

See {help plotdata:{it:plotdata}}

***/

*capture program drop mkspline_plotindicator
program def mkspline_plotindicator
syntax varlist(max=1) [if] [in] , nknots(integer)


local com2 = "rcs_" + "`varlist'" + "_1"
capture confirm variable `com2'
	if _rc {

	}
	else{
		di as err "`com2'" " already exists in dataset"
		exit
	}


marksample touse

if `nknots' == 3 {
  qui `f'centile `varlist' if _plotindicator == 0, ///
  centile(10 50 90)
}
else if `nknots'== 4 {
  qui `f'centile `varlist' if _plotindicator == 0, ///
  centile(5 35 65 95)
}
else if `nknots'== 5 {
  qui `f'centile `varlist' if _plotindicator == 0, ///
  centile(5 27.5 50 72.5 95)
}
else if `nknots'== 6 {
  qui `f'centile `varlist' if _plotindicator == 0, ///
  centile(5 23 41 59 77 95)
}
else if `nknots'== 7 {
  qui `f'centile `varlist' if _plotindicator == 0, ///
  centile(2.5 18.33 34.17 50 65.83 81.67 97.5)
}
else {
  display as error ///
  "Restricted cubic splines with `nk' knots at default values not implemented."
  display as error ///
  "Number of knots specified in nknots() must be between 3 and 7."
  error 498
}

gen crapola = .

forvalues i=1 / `nknots' {
  local t`i' = r(c_`i')
  quietly replace crapola = r(c_`i') in `i'
}

quietly levelsof crapola

local com1 = "rcs_" + "`varlist'" + "_ = " + "`varlist'"

mkspline `com1' if `touse', cubic knots(`r(levels)') displayknots

quietly drop crapola

end
