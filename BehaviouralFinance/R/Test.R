library(vcd)
library(RColorBrewer)
colours <- brewer.pal(n = 4, "Greens")
GreenCab <- rep("Green", 20*17)
BlueCab <- rep("Blue", 3*20)
da1 <- (c(GreenCab, BlueCab))
x <- table(da1)
# off will determine the split between the two categories
mosaicplot(x, color = colours, xlab = "", 
           main = "Proportion of cars in town", off = 0)
ID <- rep(1, length(da1))
da2 <- data.frame(da1, ID)
head(da2)
for(i in 1:51){
  da2$ID[i] <- 0
} 
for(i in 341:349){
  da2$ID[i] <- 0
}
x2 <- table(da2)
x2
length(da2$ID)
da2$ID
mosaicplot(x2, main = "Blue and Green Cabs correct and incorrect identification", 
             xlab = "Cab colour", ylab = "Identification", color = colours)
# set the text positioin as a percentage of the plot space for x and y. 
text(x = 0.1, y = 0.5, label = 0.12)
text(x = 0.1, y = 0.9, label = 0.03)
text(x = 0.6, y = 0.5, label = 0.68)
text(x = 0.6, y = 0.9, label = 0.17)
text(x = 15, y = 16, labels = "12.5", pos = 4)
