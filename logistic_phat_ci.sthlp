{smcl}


{title:Title}

{p 4 4 2}
{bf:logistic_phat_ci} -- Generate predictions and associated confidence intervals from a logistic regression model.


{title:Syntax}

{p 4 4 2}
{bf:logistic_phat_ci} [,xb alpha({it:int}) stub({it:str}) drop]

{space 4}{hline}

{p 4 4 2}
Options:

{p 8 8 2}    {bf:xb} : If specified, the command generates predictions on the log odds scale.  If not specified, the command generates predictions on the probability scale.

{p 8 8 2}    {bf:alpha} ({it:int}) : A number; the default is 5 which generates 95% confidence intervals.  If specified, the command will generate  (1-alpha)% confidence intervals.

{p 8 8 2}    {bf:stub} ({it:str}) : A string which will serve as a prefix for the generated variables.

{p 8 8 2}    {bf:drop} : If specified, the command will write over existing variables.

{space 4}{hline}


{title:Description}

{p 4 4 2}
{bf:logistic_phat_ci} will generate predictions and associated confidence intervals from a logistic regression model.  This command is built on top of the {help predict:{it:predict}} command.


{title:Example(s)}

{p 4 4 2}
See {help plotdata:{it:plotdata}}



