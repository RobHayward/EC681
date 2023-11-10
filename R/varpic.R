# varpic.R
#This will give a picture of VAR
mydata <- rnorm(1000, 0.06, 1)
hist(mydata, prob = TRUE, main = 'Distribution of security returns', cex = 0.4)
plot(density(mydata), main = 'Distribution of security returns', cex = 0.2, 
     ylab = 'Probability', xlab = 'Return')
abline(v = qnorm(0.05, 0.06, 1), col = 'red')
text(x = -1.06, y = 0.35, '5% VaR \n -1.6%', cex = 0.7)
abline(v = qnorm(0.01, 0.06, 1), col = 'red')
text(x = -2.7, y = 0.35, '1% Var \n -2.3%', cex = 0.7)

