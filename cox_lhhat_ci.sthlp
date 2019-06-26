{smcl}


{title:Title}

{p 4 4 2}
{bf:cox_lhhat_ci} -- Generate predictions and associated confidence intervals from a Cox logistic regression model.


{title:Syntax}

{p 4 4 2}
{bf:cox_lhhat_ci} [,xb rh sp alpha(str) stub(str) qt(numlist integer >0 <100) spt(numlist integer >0) drop]

{space 4}{hline}

{p 4 4 2}
Options:

{p 8 8 2}    {bf:xb} : Calculate the log relative hazard

{p 8 8 2}    {bf:rh} : Calculate the relative hazard

{p 8 8 2}    {bf:sp} : Calculate survival probability at observed time

{p 8 8 2}    {bf:alpha} ({it:str}) : Alpha level for confidence intervals

{p 8 8 2}    {bf:stub} ({it:str}) : A string which will serve as a prefix for the generated variables.

{p 8 8 2}    {bf:spt} ({it:numlist}) : Generate the conditional survival probabilities at the times specified in the number list.

{p 8 8 2}    {bf:qt} ({it:numlist}) : Generate the quantile survival time for the quantiles specified in the number list.

{p 8 8 2}    {bf:drop} : If specified, the command will write over existing variables.

{space 4}{hline}


{title:Description}

{p 4 4 2}
{bf:cox_lhhat_ci} will generate predictions from a Cox regression model.  This command is built on top of the {help predict:{it:predict}} command.



