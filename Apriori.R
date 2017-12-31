# Apirori

# Data Preprocessing

#Importing the dataset
dataset = read.csv('Market_Basket_optimisation.csv',header = F)


#Creating Sparse Matrix

install.packages("arules")
library(arules)
dataset=read.transactions('Market_Basket_Optimisation.csv',sep = ',',rm.duplicates = T)
summary(dataset)
itemFrequencyPlot(dataset,topN=50)

#Training the apriori on the dataset

rules=apriori(dataset,parameter = list(support= 0.003 ,confidence=0.8))

#Support is calucated by dividing 3*7 numbers of products by 7500 i.e. let us pick a prdouct that is
#bought 3 times a day so since we have a week data here the count of products bought over a week is 3*7
# We choose cofidence =0.8 which is default and gradually decrease it to find rules
#the apriori writes rules and we check for that
# After running rules=apriori(dataset,parameter = list(support= 0.003 ,confidence=0.8)) we found rules is 0
# Since confidence value is high i.e. 0.8, model did not find any rule with 80% cofidence,we will decrease it by half i.e 0.4

rules=apriori(dataset,parameter = list(support= 0.004 ,confidence=0.2))

inspect(sort(rules,by='lift')[1:10])

