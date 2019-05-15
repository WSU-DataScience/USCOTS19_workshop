LiverTox = read.csv("http://course1.winona.edu/bdeppa/DSCI%20415/Data/Liver%20Toxicity%20Study.csv")
dim(LiverTox)
names(LiverTox)[1:20]
gene.mat = LiverTox[,-c(1:4)]
gene.cor = cor(gene.mat)
gene.cor2 = apply(gene.cor,2,rev)
par(pty="s")
image(1:3126,1:3126,gene.cor2)
gene.mat = scale(gene.mat)
gene.PCA = prcomp(gene.mat)
summary(gene.PCA)
PC1 = gene.PCA$x[,1]
PC2 = gene.PCA$x[,2]
PC3 = gene.PCA$x[,3]
plot(PC1,PC2,type="n")
text(PC1,PC2,as.character(LiverTox$Treatment.Group),col=as.numeric(LiverTox$Dose.Group)+1,cex=.8)
par(mfrow=c(3,1))
plot(gene.PCA$rotation[,1],type="h",col="blue",xlab="Variable",ylab="PC1 Loadings")
plot(gene.PCA$rotation[,2],type="h",col="mediumblue",xlab="Variable",ylab="PC2 Loadings")
plot(gene.PCA$rotation[,3],type="h",col="darkblue",xlab="Variable",ylab="PC3 Loadings")



