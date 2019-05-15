
if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")
BiocManager::install("mixOmics")

require(cluster)
require(corrplot)
require(MASS)
require(proxy)
require(mixOmics)
require(FactoMineR)
require(factoextra)

# Read in genetic data
GeneMajor = read.csv("http://course1.winona.edu/bdeppa/DSCI%20415/Data/GeneMajor.csv")
names(GeneMajor)
GeneMajor = na.omit(GeneMajor)
gene.mat = scale(GeneMajor[,-c(1:2)])

# Find correlation matrix and plot it
gene.cor = cor(gene.mat)
corrplot(gene.cor,order="hclust",tl.cex=.5)

# Turn correlations into distances between variables
var.dist = sqrt(2*(1-gene.cor))
var.dist = as.dist(var.dist)
fviz_dist(var.dist,lab_size=6)

# Perform hierarchical clustering using the between variable distances
var.hclust = hclust(var.dist,method="ward.D")
plot(var.hclust,cex=0.6)
var.clusters = cutree(var.hclust,k=8)
var.clusters

# Function to display observations in each cluster
clust.grps2 = function(X,grps,parcoord=F,suppress=F) {
  k = length(unique(grps))
  p = dim(X)[[2]]
  X = as.data.frame(X)
  for (i in 1:k){
    cat("\n")
    cat(paste("Cluster",i,"\n"))
    cat("=======================================================================\n")
    cat(row.names(X)[grps==i])
    cat("\n\n")}
}


# View variables in each cluster
clust.grps2(t(gene.mat),var.clusters)

# Determine number of clusters for variables and use K-means to cluster
fviz_nbclust(t(gene.mat),kmeans,"gap_stat",k.max=15)
var.kmeans = kmeans(t(gene.mat),centers=8,nstart=25)
fviz_cluster(var.kmeans,data=t(gene.mat),geom="text")
# Examine WSS and the Silhouette statistic to find "optimal" cluster number
fviz_nbclust(t(gene.mat),kmeans,"wss",k.max=20)
fviz_nbclust(t(gene.mat),kmeans,"silhouette",k.max=20)
var.kmeans12 = kmeans(t(gene.mat),centers=12,nstart=25)
fviz_cluster(var.kmeans12,data=t(gene.mat),geom="text")
var.kmeans17 = kmeans(t(gene.mat),centers=17,nstart=25)
fviz_cluster(var.kmeans17,data=t(gene.mat),geom="text")

GeneMajor[1:4,1:2]
summary(GeneMajor[,2])

# Determine number of clusters for observations and use K-means to cluster
fviz_nbclust(gene.mat,kmeans,"gap_stat",k.max=20)
fviz_nbclust(gene.mat,kmeans,"wss",k.max=20)
fviz_nbclust(gene.mat,kmeans,"silhouette",k.max=20)
obs.kmeans = kmeans(gene.mat,2,nstart=25)
obs.kmeans12 = kmeans(gene.mat,12,nstart=25)
obs.kmeans16 = kmeans(gene.mat,16,nstart=25)
fviz_cluster(obs.kmeans,data=gene.mat,geom="text",cex=.5)
fviz_cluster(obs.kmeans12,data=gene.mat,geom="text",cex=.5)
fviz_cluster(obs.kmeans16,data=gene.mat,geom="text",cex=.5)

# Two-way clustering using the cim() function in mixOmics package
dim(gene.mat) # rows are genes and columns are measurements
dim(t(gene.mat)) # rows are measurements and columns are genes
cim(gene.mat,col.cex=.4,color=rainbow(100))
cim(t(gene.mat),col.cex=.25,color=rainbow(100))


# Sports Diffficulty 
portDiff = read.csv(file="http://course1.winona.edu/bdeppa/DSCI%20415/Data/SportsDifficulty.txt",header=T)
names(SportDiff)
head(SportDiff)
summary(SportDiff)
# View(SportDiff)
sport.mat = scale(SportDiff[,-c(1,12,13)])

