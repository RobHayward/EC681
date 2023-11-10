# File to create efficiency charts
x <- seq(-5, 5, 1)
y <- c(0, 0, 0, 0, 0, 0, NA, NA, NA, NA, NA)
plot(x, y, type = 'l', ylim = c(-4, 8), xlab = "Event Days", ylab = "Return", 
     main = "Efficient reaction to good news")
# set up matrix of points for the additional lines
z1 <- matrix(c(0, 4, 4, 4), ncol = 2, byrow = TRUE)
z2 <- matrix(c(0, 0, 0, 4), ncol = 2)
lines(z1)
lines(z2)
#======================================
x <- seq(-5, 5, 1)
y <- c(0, 0, 0, 0, 0, 0, NA, NA, NA, NA, NA)
plot(x, y, type = 'l', ylim = c(-4, 8), xlab = "Event Days", ylab = "Return", 
     main = "Under-reaction to good news")
# set up matrix of points for the additional lines
z1 <- matrix(c(0, 4, 4, 4), ncol = 2, byrow = TRUE)
z2 <- matrix(c(0, 0, 0, 4), ncol = 2)
lines(z1)
lines(z2)
z3 <- matrix(c(0, 0, 2, 4), ncol = 2, byrow = TRUE)
lines(z3, lty = 2)
text(2.8, 2, "Under-reaction")
#=================================================
x <- seq(-5, 5, 1)
y <- c(0, 0, 0, 0, 0, 0, NA, NA, NA, NA, NA)
plot(x, y, type = 'l', ylim = c(-4, 8), xlab = "Event Days", ylab = "Return", 
     main = "Over-reaction to good news")
# set up matrix of points for the additional lines
z1 <- matrix(c(0, 4, 4, 4), ncol = 2, byrow = TRUE)
z2 <- matrix(c(0, 0, 0, 4), ncol = 2)
lines(z1)
lines(z2)
z4 <- matrix(c(0, 4, 0, 7, 2, 4), ncol = 2, byrow = TRUE)
lines(z4, lty = 2)
text(2.8, 6, "Overshooting")
@