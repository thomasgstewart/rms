{smcl}

{title:Title}

{p 4 4 2}
{bf:validate_logistic} --- Calculate optimism corrected measures of logistic model performance


{title:Syntax}

{p 4 4 2}
{bf:validate_logistic}, [reps(str) seed(str)]

{space 4}{hline}

{p 4 4 2}
Options:


{p 8 8 2} {bf:reps} ({it:str}): The number of bootstrap replicates to calculate optimism.  Defaults to 50.

{p 8 8 2} {bf:seed} ({it:str}): The seed for the bootstrap simulation.  Defaults to 1.

{space 4}{hline}

{title:Description}

{p 4 4 2}
This command calculates the optimism corrected measures of AUC and the Brier score for a previously estimated logistic regression model.

{title:Example}

    getvdata sex.age.response
    logistic response i.sex age
    validate_logistic



