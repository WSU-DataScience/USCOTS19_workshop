temp1 = "http://course1.winona.edu/bdeppa/DSCI%20Workshop/Temp%20Files/Image1.jpg"
z1 = tempfile()
download.file(temp1,z1,mode="wb")
i1 = readJPEG(z1)
I1 = .21*i1[,,1]+.71*i1[,,2]+.07*i1[,,3]
file.remove(z1)
# Read in Image 2
temp2 = "http://course1.winona.edu/bdeppa/DSCI%20Workshop/Temp%20Files/Image2.jpg"
z2 = tempfile()
download.file(temp2,z2,mode="wb")
i2 = readJPEG(z2)
I2 = .21*i2[,,1]+.71*i2[,,2]+.07*i2[,,3]
file.remove(z2)
# Read in Image 3
temp3 = "http://course1.winona.edu/bdeppa/DSCI%20Workshop/Temp%20Files/Image3.jpg"
z3 = tempfile()
download.file(temp3,z3,mode="wb")
i3 = readJPEG(z3)
I3 = .21*i3[,,1]+.71*i3[,,2]+.07*i3[,,3]
file.remove(z3)
# Read in Image 4
temp4 = "http://course1.winona.edu/bdeppa/DSCI%20Workshop/Temp%20Files/Image4.jpg"
z4 = tempfile()
download.file(temp4,z4,mode="wb")
i4 = readJPEG(z4)
I4 = .21*i4[,,1]+.71*i4[,,2]+.07*i4[,,3]
file.remove(z4)
# Read in Image 5
temp5 = "http://course1.winona.edu/bdeppa/DSCI%20Workshop/Temp%20Files/Image5.jpg"
z5 = tempfile()
download.file(temp5,z5,mode="wb")
i5 = readJPEG(z5)
I5 = .21*i5[,,1]+.71*i5[,,2]+.07*i5[,,3]
file.remove(z5)
# Read in Image 6
temp6 = "http://course1.winona.edu/bdeppa/DSCI%20Workshop/Temp%20Files/Image6.jpg"
z6 = tempfile()
download.file(temp6,z6,mode="wb")
i6 = readJPEG(z6)
I6 = .21*i6[,,1]+.71*i6[,,2]+.07*i6[,,3]
file.remove(z6)

I1.temp = apply(I1,2,rev)
I1 = t(I1.temp)
I2.temp = apply(I2,2,rev)
I2 = t(I2.temp)
I3.temp = apply(I3,2,rev)
I3 = t(I3.temp)
I4.temp = apply(I4,2,rev)
I4 = t(I4.temp)
I5.temp = apply(I5,2,rev)
I5 = t(I5.temp)
I6.temp = apply(I6,2,rev)
I6 = t(I6.temp)

#
# Function to Mix Images
#
ImageMixer = function(k=6,e=0.5,wl=.05,wu=.15) {
  mix.array = array(0,c(225,225,k))
  for (i in 1:k) {
    a = runif(6,wl,wu)
    a = a/sum(a)
    mix = a[1]*as.vector(I1) + a[2]*as.vector(I2) + a[3]*as.vector(I3) + a[4]*as.vector(I4)+a[5]*as.vector(I5)+a[6]*as.vector(I6)
    err = runif(50625,0,.5)
    mix.array[,,i] = matrix(mix,225,225)+e*matrix(err,225,225)
  }
  X = matrix(0,50625,k)
  for (i in 1:k) {
    X[,i] = as.vector(mix.array[,,i])
  }
  X
}

Y = ImageMixer(k=1000,e=2)
par(mfrow=c(2,2),pty="s",mar=c(0,0,0,0))
for (i in 1:4) {
  image(1:225,1:225,matrix(Y[,i],225,225),xlab="",ylab="",col=gray((0:225)/225))
}

#
# Y is your observed data, now see if you can use ICA to find the underlying signals! 
# The two component solution is shown below.
#
require(fastICA)
results = fastICA(Y,n.comp=2)
attributes(results)
par(pty="s",mfrow=c(1,2),mar=c(0,0,0,0))
# Examine first estimated source
image(1:225,1:225,matrix(1-results$S[,1],225,225),col=gray((0:225)/225),xlab="",ylab="")
image(1:225,1:225,matrix(results$S[,1],225,225),col=gray((0:225)/225),xlab="",ylab="")
# Examine second estimated source
image(1:225,1:225,matrix(1-results$S[,2],225,225),col=gray((0:225)/225),xlab="",ylab="")
image(1:225,1:225,matrix(results$S[,2],225,225),col=gray((0:225)/225),xlab="",ylab="")


