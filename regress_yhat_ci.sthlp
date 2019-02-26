{smcl}


{title:Title}

{p 4 4 2}
{bf:regress_yhat_ci} -- Generate predictions and associated confidence intervals from a linear regression model.


{title:Syntax}

{p 4 4 2}
{bf:regress_yhat_ci} [, forecast alpha(int) stub(str) drop]

{space 4}{hline}

{p 4 4 2}
Options:

{p 8 8 2}    {bf:forecast} : If specified, the command generates individual forecast intervals instead of population mean intervals (which is the default output).

{p 8 8 2}    {bf:alpha} ({it:int}) : A number; the default is 5 which generates 95% confidence intervals.  If specified, the command will generate  (1-alpha)% confidence intervals.

{p 8 8 2}    {bf:stub} ({it:str}) : A string which will serve as a prefix for the generated variables.

{p 8 8 2}    {bf:drop} : If specified, the command will write over existing variables.

{space 4}{hline}


{title:Description}

{p 4 4 2}
{bf:regress_yhat_ci} will generate predictions and associated confidence intervals from a linear regression model.  This command is built on top of the {help predict:{it:predict}} command.


{title:Note}

{p 4 4 2}
This command will generate population mean intervals from a bootstrapped linear model; however, it will not generate forecast intervals from the bootstrapped model.


{title:Example(s)}

{p 4 4 2}
See {help plotdata:{it:plotdata}}



