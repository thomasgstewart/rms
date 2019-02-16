capture program drop logistic_one_delta
program logistic_one_delta, rclass

syntax, command(str)

tokenize `"`command'"'

//list in 1
preserve
bsample
//list in 1
quietly `command'
predict _phat, pr
quietly brier `e(depvar)' _phat
matrix aaa = (r(brier), r(roc_area))
matrix colnames aaa = Brier AUC

restore

predict _phat, pr
quietly brier `e(depvar)' _phat
matrix bbb = (r(brier), r(roc_area))
matrix colnames bbb = Brier AUC

matrix delta = aaa - bbb
return scalar delta_brier = delta[1,1]
return scalar delta_auc = delta[1,2]
drop _phat
end
