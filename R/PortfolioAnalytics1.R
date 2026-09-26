# First vignette
# https://cran.r-project.org/web/packages/PortfolioAnalytics/vignettes/cvxrPortfolioAnalytics.pdf
# There are comments about constraints in the LeChat link above. 
# This is the second vignette
# This is more about the weights
# https://cran.r-project.org/web/packages/PortfolioAnalytics/vignettes/portfolio_vignette.pdf

require(PortfolioAnalytics)
data(edhec)
class(edhec)
# take the last 5 years of data
ret_edhec <- tail(edhec, 60)
# create a portfolio object
fund_edhec <- colnames(edhec)
pspec_maxret <- portfolio.spec(assets = fund_edhec)
# add constraints to portfolio object
pspec_maxret <- add.constraint(pspec_maxret, type = "full_investment")
pspec_maxret <- add.constraint(pspec_maxret, type = 'box', 
                               min = rep(0.02, 13), 
                               max = c(rep(0.15, 8), rep(0.1, 5)))
# add objective to portfolio objective
pspec_maxret <- add.objective(portfolio = pspec_maxret, 
                              type = 'return', name = 'mean')
pspec_maxret
#=========================================
# Optimization
opt_maxret <- optimize.portfolio(R = ret_edhec, 
                                 portfolio = pspec_maxret, 
                                 optimize_method = "CVXR")
opt_maxret
# There is more of this to be completed.
#=====================================
# This is the final example
R <- edhec[, 1:4]
pspec <- portfolio.spec(assets = colnames(R))
pspec <- add.constraint(portfolio = pspec, type = 'leverage', 
                      min_sum = 0.99, max_sum = 1.01)
pspec <- add.constraint(portfolio = pspec, type = 'box', 
                        min = 0, max = 1)
# Details for the above constaint are in the second vignette
rp1 <- random_portfolios(portfolio = pspec, permutations = 5000, 
                         rp_method = 'sample')
rp2 <- random_portfolios(portfolio = pspec, permutations = 5000, 
                         rp_method = 'simplex')
rp3 <- random_portfolios(portfolio = pspec, permutations = 5000, 
                         rp_method = 'grip')
tmp1.mean <- apply(rp1, 1, function(x) mean(R %*% x))
tmp1.StDev <- apply(rp1, 1, function(x) StdDev(R = R, weights = x))
tmp2.mean <- apply(rp2, 1, function(x) mean(R %*% x))
tmp2.StDev <- apply(rp2, 1, function(x) StdDev(R = R, weights = x))
tmp3.mean <- apply(rp3, 1, function(x) mean(R %*% x))
tmp3.StDev <- apply(rp3, 1, function(x) StdDev(R = R, weights = x))
plot(x = tmp1.StDev, y = tmp1.mean, col = 'gray', main = 
       "Random Portfolio Method", ylab = "Mean", xlab = "Stdev")
points(x = tmp2.StDev, y = tmp2.mean, col = 'red', pch = 2)
points(x = tmp3.StDev, y = tmp3.mean, col = 'lightgreen', pch = 2)
