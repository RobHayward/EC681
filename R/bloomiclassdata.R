#bloomiclassdata.R
#This will bring together students.csv and Bloomberg data to highlight those engaging
# Use sed 's/In progress//g' to remove in progress so that numberic data is created
da1 <- read.csv('Official/2023/students.csv')
head(da1)
str(da1)
da2 <- read.csv('Official/2023/Bloomberg.csv')
head(da2)
str(da2)
barplot(table(da2$Fixed.Income), col = 'lightblue', main = "Fixed income progress")
barplot(table(da2$Equities), col = 'lightblue', main = "Equities progress")
dim(da1)[1]
dim(da2)[2]
da3 <- merge(da1, da2, by = "Last")
head(da3)
da3$Date <- as.Date(da3$Date, format = "%B %d, %Y")
str(da3)
barplot(table(da3$Date), las = 2, col = 'lightblue', main = "Signing up")
