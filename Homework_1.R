### Mahima Mahajan's SDS HW1 ###


#Creating dataset
Bonds_dataset <- read.csv('Homework_1_Bonds.csv')

### Question 1 ###
#Total bonds carried and defeated 
carriedBonds <- sum(Bonds_dataset$Result == "Carried")
defeatedBonds <- sum(Bonds_dataset$Result == "Defeated")

#Total bonds carried AND in respective government type
WD_approvedBonds <- sum(Bonds_dataset$Result == "Carried" & Bonds_dataset$Type == "WD")
City_approvedBonds <- sum(Bonds_dataset$Result == "Carried" & Bonds_dataset$Type == "CITY")
ISD_approvedBonds <- sum(Bonds_dataset$Result == "Carried" & Bonds_dataset$Type == "ISD")
Cnty_approvedBonds <- sum(Bonds_dataset$Result == "Carried" & Bonds_dataset$Type == "COUNTY")

#Rate of bonds carried for each government type
WD_approvedRate <- WD_approvedBonds / sum(Bonds_dataset$Type == "WD")
City_approvedRate <- City_approvedBonds / sum(Bonds_dataset$Type == "CITY")
ISD_approvedRate <- ISD_approvedBonds / sum(Bonds_dataset$Type == "ISD")
Cnty_approvedRate <- Cnty_approvedBonds / sum(Bonds_dataset$Type == "COUNTY")


### Question 2 ###
#Created a subset containing the sum of VotesFor and VotesAgainst column
Bonds_dataset$Votes_Total <- Bonds_dataset$VotesFor + Bonds_dataset$VotesAgainst
#Found the location of max entry within Votes_Total list
which.max(Bonds_dataset$Votes_Total)


### Question 3 ###
#created a subset with provided limits
votes <- Bonds_dataset[Bonds_dataset$Votes_Total>=100 & Bonds_dataset$Result=="Carried",]
#converted subset to represent percentage
votes$votes_margin <- votes$VotesFor/votes$Votes_Total
#created a horizontal box plot 
boxplot(votes$votes_margin,main='Distribution of Total Votes',xlab='Percentage of Votes', pch=20, horizontal=TRUE)
#found appropriate statistics with five number summary
fivenum(votes_margin)


### Question 4 ###
#created scatterplot with cost and win margin as the axes
plot(votes$Amount,votes$votes_margin,main='Cost vs. Win Margin',xlab='Cost ($USD)',ylab='Win Margin (%)',pch=20,col=c('#01857150'))



