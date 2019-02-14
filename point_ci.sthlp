{smcl}


{title:Title}

{p 4 4 2}
{bf:point_ci} -- Create plot of point estimates and confidence intervals


{title:Syntax}

{p 4 4 2}
{bf:point_ci} pointest pointest_lb pointest_ub axisvar [{it:if}] [{it:in}] [, vertical labelvar(str) plot_options(str) ci_options(str) point_options(str) ytitle(str)]

{space 4}{hline}


{p 8 8 2}    {bf:pointest} : Name of variable with point estimates.

{p 8 8 2}    {bf:pointest_lb} : Name of variable with point estimate lower bound.

{p 8 8 2}    {bf:pointest_ub} : Name of variable with point estimate upper bound.

{p 8 8 2}    {bf:axisvar} : Name of y-axis (usually) variable.

{p 8 8 2}    {bf:vertical} : Optional.  Plots the CIs vertically instead of horizontally.

{p 8 8 2}    {bf:labelvar(str)} : Name of variable with estimate labels.

{p 8 8 2}    {bf:plot_options(str)} : Optional. STATA commands to customize the plot.

{p 8 8 2}    {bf:ci_options(str)} : STATA commands to customize the confidence intervals.  (Commands are included in a twoway line command.)

{p 8 8 2}    {bf:point_options(str)} : STATA commands to customize the points.  (Commands are included in a twoway scatter command.)

{space 4}{hline}


{title:Description}

{p 4 4 2}
Creates a plot of point estimates and confidence intervals.


{title:Example}

    getvdata nhgh
    regress ht i.re##i.sex
    plotdata, at(sex = 1/2; re = 1/5)
    regress_yhat_ci
    decode(sex), generate(s_sex)
    decode(re), generate(s_re)
    gen label = s_re + " " + s_sex
    egen float row = rank(-10*re+sex) if _plotindicator == 1
    point_ci ht_hat ht_hat_lb ht_hat_ub row if _plotindicator == 1 & sex == 1,  ///
     labelvar(label) ///
     point_options(mcolor(magenta)) ///
     ci_options(lwidth(thick)) ///
     plot_options(title(Mean heights NHANES) xtitle(Height (cm)))



