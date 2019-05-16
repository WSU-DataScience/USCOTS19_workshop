require(arules)
require(arulesViz)
Mushrooms = read.csv(file="http://course1.winona.edu/bdeppa/DSCI%20415/Data/Mushrooms.csv",header=T)
names(Mushrooms)
Mushsub = Mushrooms[,-c(12,17)]
Mush.trans = as(Mushsub,"transactions")
itemFrequencyPlot(Mush.trans,topN=25)
itemFrequencyPlot(Mush.trans,support=.4)
Mushrules = apriori(Mush.trans)
mush.quality = quality(Mushrules)
mush.subset = Mushrules[mush.quality$lift>2.5 & mush.quality$supp>.2]
summary(mush.subset)
# Highlight rectangular region in the upper right corner
sel = plot(mush.subset,interactive=T)
inspect(sort(Mushrules,by="lift")[1:10]) 
Poison.rules = apriori(Mush.trans,appearance=list(default="lhs",rhs="Poisonous=p"))
Poison.rules = sort(Poison.rules,by="lift")
inspect(Poison.rules[1:20])
sel2 = plot(Poison.rules,engine='interactive')




