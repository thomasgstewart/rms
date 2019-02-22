{smcl}


{title:Title}

{p 4 4 2}
{bf:ologit_yhat} -- Generate predictions and associated confidence intervals from an ordered logistic regression model.


{title:Syntax}

{p 4 4 2}
{bf:ologit_yhat} [, centiles(numlist) stub(str) drop]

{space 4}{hline}

{p 4 4 2}
Options:

{p 8 8 2}    {bf:centiles} ({it:numlist}) : A number list between 0 - 100.

{p 8 8 2}    {bf:stub} ({it:str}) : A string which will serve as a prefix for the generated variables.

{p 8 8 2}    {bf:drop} : If specified, the command will write over existing variables.

{space 4}{hline}


{title:Description}

{p 4 4 2}
{bf:ologit_yhat} will generate predictions from an ordered logistic regression model.  This command is built on top of the {help predict:{it:predict}} command.



