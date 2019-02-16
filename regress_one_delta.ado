capture program drop regress_one_delta
program regress_one_delta, rclass

syntax, command(str)

tokenize `"`command'"'

preserve
bsample
quietly `command'
restore
predict _yhat, xb

quietly corr _yhat `2'
return scalar optim = e(r2) - r(rho)^2
drop _yhat
end
