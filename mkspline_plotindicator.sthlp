{smcl}


{title:Title}

{p 4 4 2}
{bf:mkspline_plotindicator} -- Create restricted cubic spline varibles while ignoring plotting data


{title:Syntax}

{p 4 4 2}
{bf:mkspline_plotindicator} {it:varname} [{it:if}] [{it:in}] [, nknots({it:int})]

{space 4}{hline}

{p 4 4 2}
Required:

{p 8 8 2}    {bf:varname} : Name of variable to spline.

{p 8 8 2}    {bf:nknots} ({it:int}): Number of knots.  Can be any integer from 3 to 7.

{space 4}{hline}


{title:Description}

{p 4 4 2}
{bf:mkspline_plotindicator} is used in tandem with the {bf:plotdata} command.  After adding plotting data to the dataset, this command creates restricted cubic splines but ignores plotting data when calculating knots.


{title:Example(s)}

{p 4 4 2}
See {help plotdata:{it:plotdata}}



