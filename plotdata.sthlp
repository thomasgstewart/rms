{smcl}

{title:Title}

{p 4 4 2}
{bf: {browse "https://github.com/thomasgstewart/rms":plotdata}} --- create and append a dataset for the purposes of generating partial effect plots


{title:Syntax}

{p 4 4 2}
{bf:plotdata} [if] [in] [, at({it:str}) ]

{space 4}{hline}

{p 4 4 2}
Options:


{p 8 8 2} {bf:at} ({it:str}): a list of variable names and values separated by a semicolon; for example, at(bmi=19.5(1)32.5; sex=1/2; age=45).

{space 4}{hline}

{title:Description}

{p 4 4 2}
This command creates a dataset by creating all possible combinations of variable values listed in the {it:at} option.  The dataset is appended to the current dataset.  The first time the command is used, it creates the variable {bf:_plotindicator} to mark which observations are the original data (marked as 0) and which is the newly appended data for the plot (marked as 1).  The second time the command is executed, the newly appended dataset is marked as 2 in the {bf:_plotindicator} variable, and so forth.

{title:Example}

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
	    if _plotindicator==1, ///
	    ytitle(Log relative odds) ///
	    xtitle(Age (years)) ///
	    legend(order(1 "Male" 3 "Female"))

{title:Author}

{space 2}Thomas G. Stewart
    thomas.stewart@vanderbilt.edu
    Department of Biostatistics
    Vanderbilt University School of Medicine


