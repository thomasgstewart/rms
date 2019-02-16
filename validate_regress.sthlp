{smcl}

{title:Title}

{p 4 4 2}
{bf:validate_regress} --- Calculate optimism corrected measures of linear regression model performance


{title:Syntax}

{p 4 4 2}
{bf:validate_regress}, [reps(str) seed(str)]

{space 4}{hline}

{p 4 4 2}
Options:


{p 8 8 2} {bf:reps} ({it:str}): The number of bootstrap replicates to calculate optimism.  Defaults to 50.

{p 8 8 2} {bf:seed} ({it:str}): The seed for the bootstrap simulation.  Defaults to 1.

{space 4}{hline}

{title:Description}

{p 4 4 2}
This command calculates the optimism corrected measures of R-squared for a previously estimated linear regression model.

{title:Example}

    getvdata support
    regress totcst i.dzgroup slos
    validate_regress


