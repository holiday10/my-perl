#set.seed(1)
#draws <- rnorm(100)^2
#

setwd("E:/海湾扇贝群体分析文章/3pop/sweep/")
library(dplyr)
library(ggplot2)
draws <- read.table("jn-zkh-2b.density1Ratio.txt",header = T)
ratio <- log2(draws$Ratio)

#dens <- density(draws$Ratio)
dens <- density(ratio)
##plot density line
plot(dens)
#plot(dens,xlim = c(0, 20))

Ne_right     <- -0.71312
Ne_left    <- -5
Po_right   <- 10
Po_left   <- 2.20789

x1 <- min(which(dens$x >= Ne_right))  
x2 <- max(which(dens$x <  Ne_left))
x3 <- min(which(dens$x >= Po_left))  
x4 <- max(which(dens$x <  Po_right))

with(dens, polygon(x=c(x[c(x1,x1:x2,x2)]), y= c(0, y[x1:x2], 0), col="blue"))
with(dens, polygon(x=c(x[c(x3,x3:x4,x4)]), y= c(0, y[x3:x4], 0), col="green"))
##plot cumlative line
plot(ecdf(ratio))


##plot 散点图
ggplot(draws, aes(x = log2(Ratio), y = Fst, colour = Type))+ geom_point() + xlim(-7, 7) +ylim (0,1) + scale_color_manual(breaks = c("A","B","C"),values=c("green","darkblue","black")) + xlab("log2(Theta Pi Ratio)") + ylab("Fst distance")
