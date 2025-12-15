# EffFront.R
# Creates an efficient frontier
# from Copiolet

# Example: Efficient Frontier with 4 assets in base R

set.seed(123)

# Expected returns (annualized, hypothetical)
mu <- c(0.10, 0.12, 0.08, 0.15)

# Covariance matrix (hypothetical)
Sigma <- matrix(c(
  0.04, 0.01, 0.02, 0.01,
  0.01, 0.05, 0.01, 0.02,
  0.02, 0.01, 0.03, 0.01,
  0.01, 0.02, 0.01, 0.06
), nrow=4, byrow=TRUE)

# Generate random portfolios
n_port <- 5000
weights <- matrix(runif(4 * n_port), nrow=n_port)
weights <- weights / rowSums(weights)   # normalize to sum = 1

# Portfolio returns and risks
port_returns <- weights %*% mu
port_risks <- sqrt(rowSums((weights %*% Sigma) * weights))

# Plot efficient frontier
plot(port_risks, port_returns, 
     xlab="Risk (Std Dev)", ylab="Expected Return", 
     main="Efficient Frontier (4 Assets)", 
     pch=20, col=rgb(0,0,1,0.3))

# Highlight frontier (approximate by upper envelope)
# THat does not work.  
# I do not understand the code below. 
frontier_idx <- which(port_returns == ave(port_returns, port_risks, FUN=max))
points(port_risks[frontier_idx], port_returns[frontier_idx], col="red", pch=20)
lines(port_risks[frontier_idx], port_returns[frontier_idx], col="grey", lwd=2)

#===========================================
# Still working on this and the code above. 
# This will show a particular portfolio of a partcular weights. 
myweights <- c(0.6, 0.2, 0.1, 0.1)
myreturn <- myweights %*% mu
# Need to calculate risk
myrisk <- sqrt(sum(myweights %*% Sigma * myweights))
points(myrisk, myreturn, col = 'yellow', pch = 20)
myrisk
myreturn
#=========================================================
# This comes from Introduction to R for Quantitative Finance 
# Chapter 2: Porfolio Optimisation
minvariance <- function(assets, mu = 0.05){
  return <- log(tail(assets, -1) / head(assets, -1))
  Q <- rbind(cov(return), rep(1, ncol(assets)), colMeans(return))
  Q <- cbind(rbind(t, tail(Q, 2)), matrix(0, 2, 2))
  b <- c(rep(0, ncol(assets)), 1, mu)
  solve(Q, b)
}
#===============================================
# This is the Portfolio Optimisation package vignette
library(PortfolioAnalytics)
returns <- edhec[ ,1:4]
colnames(returns) <- c("CA", "CTAG", "DS", "EM")
head(returns)
fund.names <- colnames(returns)
pspec <- portfolio.spec(assets = fund.names)
pspec
pspec <- add.constraint(portfolio = pspec, 
                        type = "weight_sum", 
                        min_sum = 1, 
                        max_sum = 1)
# short and long cancel.  This is common on hedge fund and market-neutral 
pspec <- add.constraint(portfolio = pspec, 
                        type = "weight_sum", 
                        min_sum = 0, 
                        max_sum = 0)
pspec <- add.constraint(portfolio = pspect,
                        type = "dollar_neutral")
pspec <- add.constraint(portfolio = pspec)
str(pspec)
#=========================================
# Page  30 of the vignette
R <- edhec[, 1:4]
pspec <- portfolio.spec(assets = colnames(R))
pspec <- add.constraint(portfolio = pspec, type = 'leverage', 
                       min_sum = 0.99, max_sum = 1.01)
pspec <- add.constraint(portfolio = pspec, type = "box", min = 0, max = 1)
# Generate random portfolios
rp1 <- random_portfolios(portfolio = pspec, permutations = 5000, 
                         rp_method = 'sample')
rp2 <- random_portfolios(portfolio = pspec, permutations = 5000, 
                         rp_method = 'simplex')
rp3 <- random_portfolios(portfolio = pspec, permutations = 5000, 
                          rp_method = 'grid')
tmp1.mean <- apply(rp1, 1, function(x) mean(R %*% x))
tmp2.mean <- apply(rp2, 1, function(x) mean(R %*% x))
tmp3.mean <- apply(rp3, 1, function(x) mean(R %*% x))
tmp1.StDev <- apply(rp1, 1, function(x) StdDev(R = R, weights = x))
tmp2.StDev <- apply(rp2, 1, function(x) StdDev(R = R, weights = x))
tmp3.StDev <- apply(rp3, 1, function(x) StdDev(R = R, weights = x))
#==================================
plot(x = tmp1.StDev, tmp1.mean, col = 'gray', main = 
       "Random Portfolio", ylab = "Mean", xlab = "StDev")
points(x = tmp2.StDev, tmp2.mean, col = 'red', pch = 2)
points(x = tmp3.StDev, tmp3.mean, col = 'lightgreen', pch = 5)
legend('bottomright', legend = c('sample', 'simple', 'grid'), 
       col = c('gray', 'red', 'lightgreen'), 
       pch = c(1, 3, 5), bty = "n")
#================================================
# Fev Controls the Dirichlet distrubtion used to control random we
fev <- 0:5
par(mfrow = c(2, 3))
for(i in 1:length(fev)){
  rp <- rp_simplex(portfolio = pspec, permutations = 2000, 
                   fev = fev[i])
  tmp.mean  <- apply(rp, 1, function(x) mean(R %*% x))
  tmp.StdDev <- apply(rp, 1, function(x) StdDev(R = R, weights = x))
  plot(x = tmp.StdDev, y = tmp.mean, main = paste("FEV = ", fev[i]), 
       ylab = "mean", xlab = "StdDev", col = rgb(0, 0, 100, 50, 
       maxColorValue = 255))
}
par(mfrow = c(1,2))
#=============================================================
# Simplex
rp_simplex <- random_portfolios(portfolio = pspec, permutations = 2000, 
                               rp_methods = "simplex")
tmp.mean <- apply(rp_simplex, 1, function(x) mean(R %*% x))
tmp.StdDev <- apply(rp_simplex, 1, function(x) StdDev(R = R, weights = x))
plot(x = tmp.StdDev, y = tmp.mean, main = "rp_method = simplex fev = 0.5", 
     ylab = "mean", xlab = "StdDev", col = rgb(0, 0, 100, 50, 
                                               maxColorValue = 255))
# sample
rp_sample <- random_portfolios(portfolio = pspec, permutations = 2000, 
                               rp_methods = "sample")
tmp.mean <- apply(rp_sample, 1, function(x) mean(R %*% x))
tmp.StdDev <- apply(rp_sample, 1, function(x) StdDev(R = R, weights = x))
plot(x = tmp.StdDev, y = tmp.mean, main = "rp_method = sample fev = 0.5", 
     ylab = "mean", xlab = "StdDev", col = rgb(0, 0, 100, 50, 
                                               maxColorValue = 255))
#===========================================================
# These are using the optimisation package
library(DEoptimR)
library(ROI)
require(ROI.plugin.glpk)
require(ROI.plugin.quadprog)
R <- edhec[, 1:6]
colnames <- c("CA", "CTAG", "DS", "EM", "EQMN", "ED")
funds <- colnames(R)
init <- portfolio.spec(assets = funds)
init <- add.constraint(portfolio = init, type = 'leverage', 
                       min_sum  = 0.99, max_sum = 1.01)
init <- add.constraint(portfolio = init, type = 'box', min = 0.05, max = 0.65)
# Maximise mean return
maxret <- add.objective(portfolio = init, 
                        type = 'return', 
                        name = 'mean')
opt_maxret <- optimize.portfolio(R = R, 
                                 portfolio = maxret, 
                                 optimize_method = "ROI", 
                                 trace = TRUE)
print(opt_maxret)
par(mfrow = c(1, 1))
plot(opt_maxret, risk.col = "StdDev", return.col = "mean", 
     main = "Maximum Return Optimisation", chart.assets = TRUE, 
     xlim = c(0, 0.05), ylim = c(0, 0.0085))
#===============================================
minvar <- add.objective(portfolio = init, type = 'risk', name = 'var')
opt_minvar <- optimize.portfolio(R = R, portfolio = minvar, 
                                 optimize_method = "ROI", trace = TRUE)
print(opt_minvar)
plot(opt_minvar, risk.col = "StdDev", retrun.col = "mean", 
     main = "Minimum Variance Optimixation", chart.assets = TRUE, 
     xlim = c(0, 0.05), ylim = c(0, 0.0085))
#=================================================
qu <- add.objective(portfolio = init, type = 'return', name = 'mean')
qu <- add.objective(portfolio = qu, type = 'risk', name = 'var', 
                   risk_aversion = 0.25)
opt_qu <- optimize.portfolio(R = R, portfolio = qu, 
                             optimize_method = "ROI",
                             trace = TRUE)
print(opt_qu)
plot(opt_qu, risk.col = "StdDev", return.col = 'mean', 
     main = "Quadratic Utillity Optimisation", chart.assets = TRUE, 
     xlim = c(0, 0.05), ylim = c(0, 0085))
par(mfrow = c(1,1))
