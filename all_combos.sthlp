{smcl}

{title:Title}

{p 4 4 2}
{bf:all_combos} --- create all combinations of non-missing values


{title:Syntax}

{p 4 4 2}
{bf:all_combos} varlist

{space 4}{hline}

{p 4 4 2}
Options:


{p 8 8 2} varlist: a list of variable names

{space 4}{hline}

{title:Description}

{p 4 4 2}
This command creates a dataset of all possible combinations of non-missing values in the variable list.  It will destroy all other variables and observations.  Should be used with preserve and restore commands.

{title:Example}

    set obs  3
    gen sex = 1
    replace sex = 2 if _n == 1
    gen race = _n
    all_combos sex race



