library(arules)
library(arulesViz)
library(datasets)


data('Groceries') #different format - transaction format
arules::inspect(Groceries[1:5])
df<-read.csv("Cosmetics.csv",header=TRUE, sep=",")
head(df)



# Few quick definitions -
#   
# Support - number of times(or percent of times) the antecedent(if) and the consequent(then) occur together. 
#            Can be used to consider only the combinations which occur atleast a certain number of times or with higher frequency.
# Confidence - percent of antecedent(if) transactions that also have the consequent(then) item set or P(C|A) = p(C and A)/P(A) or 
#            number of transactions with both antecedent and consequent/number of transactions with antecedent items
# Lift ratio - We can get higher confidence numbers just because of items which are essentially just picked up without any relevance with other items being picked e.g. milk, bread etc. 
#            Lift ratio is defined as lift(x->y) = support(x and y)/(support(x) * support(y))
# Lift ratio greater than 1 is a good sign of association.

rules = apriori(as.matrix(df[,2:15]), parameter=list(support=0.15, confidence=0.65,minlen=2))
rulesc <- sort (rules, by="confidence", decreasing=TRUE)
inspect(rulesc[1:5])

frequentItems = eclat (Groceries, parameter = list(supp = 0.01, minlen= 2, maxlen = 5))
inspect(sort (frequentItems, by="count", decreasing=TRUE)[1:25])
dev.off()
itemFrequencyPlot(Groceries,topN = 15,type = 'absolute')
rules2 = apriori (Groceries, parameter = list (supp = 0.001, conf = 0.5, minlen=2, maxlen=3)) 
rules2
rules
inspect(rules2[1:15])

subset1 = subset(rules2, subset=rhs %in% "whole milk")
inspect(subset1[1:10]) # rhs has milk
subset1 = subset(rules2, subset=rhs %in% 'bottled beer' )
inspect(subset1) #rhs has beer
subset2 = subset(rules2, subset=lhs %ain% c('baking powder','soda') )
inspect(subset2) # all items  %ain%
subset2a = subset(rules2, subset=lhs %in% c('baking powder','soda') )
inspect(subset2a[1:10]) # any of the items %in%
subset3 = subset(rules2, subset=rhs %in% 'bottled beer' & confidence > .5, by = 'lift', decreasing = T)
inspect(subset3)  #sometimes there may be no rules, change few parameters
subset4 = subset(rules2, subset=lhs %in% 'bottled beer' & rhs %in% 'whole milk' )
inspect(subset4)
subset4b = subset(rules2, subset=rhs %in% 'bottled beer'  )
inspect(subset4b) #no such rules

?itemFrequencyPlot

#?read.transactions
## read demo data (skip comment line)
#tr <- read.transactions("fintransactions.csv", format = "single", sep=",",cols = c(1,2))

# library(arulesViz)
# plot(rules)
# plot(rules,method = "graph")
# inspect(rules)
