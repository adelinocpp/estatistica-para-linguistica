cat("\014")
rm(list = setdiff(ls(), lsf.str()))
# -----------------------------------------------------------------------------
n <-2
p <-1/2
x <-0:2
p <- dbinom(x,size=n,prob=p)
png(file = "../Imagens/prob-discreta-00.png",width = 864, height = 486, 
    units = "px", bg = "transparent")
plot(x,p,type="h",xlim=c(-1,3),ylim=c(0,0.5),lwd=2,col="black",ylab="probabilidade",xlab="combinações",xaxt='n')
axis(1, at=0:2, labels=c("cara-cara","cara-coroa","coroa-coroa"))
points(x,p,pch=16,cex=2,col="dark red")
grid(10,lwd =2)
dev.off()
# -----------------------------------------------------------------------------
x <- seq(from = 0, to = 8, by = 0.01)
p <- dexp(x, rate = 1.2)
png(file = "../Imagens/prob-continua-00.png",width = 864, height = 486, 
    units = "px", bg = "transparent")
plot(x,p,type="l",lwd=2,col="black",ylab="probabilidade",xlab="x")
grid(10,lwd =2)
dev.off()
# -----------------------------------------------------------------------------
x <- seq(from = -4, to = 12, by = 0.01)
y1 <- dnorm(x) 
y2 <- dnorm(x,mean = 2)
y3 <- dnorm(x,mean = 4, sd = 1.75)
y4 <- dnorm(x,mean = 6, sd = 0.75)
png(file = "../Imagens/prob-normal-00.png",width = 864, height = 486,
units = "px", bg = "transparent")
plot(x,y4,type="l",lwd=4,col="red",ylab="probabilidade",xlab="x")
lines(x,y2,type="l",lwd=4,col="orange",ylab="probabilidade",xlab="x")
lines(x,y3,type="l",lwd=4,col="black",ylab="probabilidade",xlab="x")
lines(x,y1,type="l",lwd=4,col="blue",ylab="probabilidade",xlab="x")
legend(x = "topright",          # Position
       legend = c("N(0,1)","N(2,1)","N(4,1.75)", "N(6,0,75)"),  # Legend texts
       lty = c(1,1,1,1),           # Line types
       col = c("blue", "orange","black","red"),           # Line colors
       lwd = 4)   
grid(10,lwd =2)
dev.off()
# -----------------------------------------------------------------------------
x <- seq(from = -4, to = 12, by = 0.01)
y1 <- pnorm(x) 
y2 <- pnorm(x,mean = 2)
y3 <- pnorm(x,mean = 4, sd = 1.75)
y4 <- pnorm(x,mean = 6, sd = 0.75)
png(file = "../Imagens/prob-normal-acum-00.png",width = 864, height = 486,
    units = "px", bg = "transparent")
plot(x,y4,type="l",lwd=4,col="red",ylab="probabilidade",xlab="x")
lines(x,y2,type="l",lwd=4,col="orange",ylab="probabilidade",xlab="x")
lines(x,y3,type="l",lwd=4,col="black",ylab="probabilidade",xlab="x")
lines(x,y1,type="l",lwd=4,col="blue",ylab="probabilidade",xlab="x")
legend(x = "bottomright",          # Position
       legend = c("N(0,1)","N(2,1)","N(4,1.75)", "N(6,0,75)"),  # Legend texts
       lty = c(1,1,1,1),           # Line types
       col = c("blue", "orange","black","red"),           # Line colors
       lwd = 4)   
grid(10,lwd =2)
dev.off()
# -----------------------------------------------------------------------------
nSamples = c(4,64,256,1024)
nRep <- 32
png(file = "../Imagens/erro-padrao-media-00.png",width = 864, height = 486,
    units = "px", bg = "transparent")
par(mfrow=c(2,2))
for (n in nSamples) {
  mp1 <- rep(0, nRep)
  mp2 <- rep(0, nRep)
  mp3 <- rep(0, nRep)
  mp4 <- rep(0, nRep)
  for (k in 1:nRep){  
    p1 <- rnorm(n, mean = 4, sd = 3)
    mp1[k] <- mean(p1)
    p2 <- rexp(n,rate = 2)
    mp2[k] <- mean(p2)
    p3 <- rbeta(n, 2,5)
    mp3[k] <- mean(p3)
    p4 <- rchisq(n, 4)
    mp4[k] <- mean(p4)
  }
  if (n == 4){
    xp4 = c(min(mp4),max(mp4))
  }
  
  hist(mp4,main=sprintf("Mumero amostras n = %d",n), xlim=xp4,
       breaks=8,col = "blue2",ylab="",xlab="valor média",
       border="white")
  grid(10,lwd =2)
}
dev.off()
png(file = "../Imagens/dist-erro-padrao-media-00.png",width = 864, height = 486,
    units = "px", bg = "transparent")
par(mfrow=c(1,1))
hist(p4,main="Distribuição",freq = FALSE,
     breaks=40,col = "blue2",ylab="",xlab="",
     border="white")
grid(10,lwd =2)
dev.off()