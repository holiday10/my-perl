library(karyoploteR)

setwd("E:/ML/hic-asseem")
custom.genome <- toGRanges("dang.txt")
custom.cytobands <- toGRanges("snv-500k.cmh.kary.txt")

kp <- plotKaryotype(genome = custom.genome)
kp <- plotKaryotype(genome = custom.genome, cytobands = custom.cytobands,plot.type = 1)
kpDataBackground(kp, data.panel = 1)
#kpAddBaseNumbers(kp, tick.dist = 10000000, tick.len = 10, tick.col="red", cex=0.5, minor.tick.dist = 1000000, minor.tick.len = 5, minor.tick.col = "gray")

bed <- read.table("FF2.12fp-12mp-lack.sorted.bam.bedcov",header = T)
snp <- read.table("FF2.12fp12mp-lack.10k.snpden",header = T)

kpLine(kp, chr=bed$chr, x0=bed$x0, x1=bed$x1, y1=bed$y1, col="#00E5EE", border=darker("#00E5EE"))
#kpDataBackground(kp, data.panel = 1, col="#AACBFF")
#traits <- toGRanges("mytraits.txt")
##############points##########
traits <- read.table("snv-traits.txt",sep="\t",header=T)
kpPoints(kp, chr = traits$chr, x = traits$x, y = -log10(traits$p), ymin =0 , ymax = 4, cex = 0.1, col = "red")
kpAxis(kp, data.panel=1,tick.pos = c(0, 250, 500, 750, 1000),ymin=0, ymax=1000)

kp <- plotKaryotype(genome = custom.genome)

kpLines(kp, chr = snp$chr, x = snp$x, y = snp$y2, ymin =0, ymax =1000,lwd = 0.1, col="lightblue")
kpLines(kp, chr = bed$chr, x = bed$x, y = bed$z2, ymin =0, ymax =500,lwd = 0.1, col="red")



kpLines(kp, chr = bed$chr, x = bed$x0, y = bed$a, ymin =0, ymax =1000,lwd = 0.1, col="blue")




##############line#############
traits <- read.table("f3.traits.txt",sep="\t",header=T)
#kpLines(kp, chr="chr1", x=x, y=y+0.1, col="#440000", lwd=1.5)
kpLines(kp, chr = traits$chr, x = traits$x, y = traits$y, ymin =0, ymax =500,lwd = 0.1, col="blue")
kpLines(kp, chr = traits$chr, x = traits$x, y = traits$y2, ymin =0, ymax =135839764,lwd = 0.1, col="blue")


#############area##############
kpArea(kp, chr = traits$chr, x = traits$x, y = traits$y, ymin =0, ymax =60, col="red", r0 = 0, r1 = 0.8)


install.packages("export")
library(export)
graph2ppt(file="I:/air-apu/n3-area.pptx", width=7, height=5)



save(all.aces,all.child,all.parent,all.off,
     bp.level3,cc.level3,mf.level3,
     bp.aces,cc.aces,mf.aces,
     bp.off,cc.off,mf.off,
     bpchild,ccchild,mfchild,
     custom.cytobands, custom.genome,
     goOnto,
     genefreq.mf,genefreq.bp,genefreq.cc,
     sort.data.frame,Fisher.Chi.test,
     EnrichGO, EnrichGOallLevl,
     DiffGOs,GOfreq,file="2MetaGO_20200502.RData",version = 2.0)

library(CMplot)
setwd("E:/ML/hic-asseem/")
mydata<-read.table("SNPden.hetr",header=TRUE,sep="\t")
head(mydata)

CMplot(mydata,plot.type="d",bin.size=1e5
      ,col=c("darkgreen","yellow", "red"),file="jpg",memo="snp_density",dpi=300) 
