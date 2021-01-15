library(dplyr)
library(vcd)
library(DescTools)

aaa=read.table("E:/ML/mutation-prone/chapter2/mutation-test/all.gene.dis.txt",header=T)
Table.Z=as.data.frame(aaa[,c(1,2,3,4)])
colnames(Table.Z)=c("Location","CMH.p","Woolf.p","BD.p")

III=c("FF","FF","FF","FF","FP","FP","FP","FP")
TTT=c("Mutation","Regular","Mutation","Regular","Mutation","Regular","Mutation","Regular")
LLL=c("in","in","out","out","in","in","out","out")

for(i in 1:1310){
CCC=c(aaa$FF[i],1,aaa$FFm[i],1309,aaa$FP[i],1,aaa$FPm[i],1309)
bbb=as.data.frame(cbind(III,TTT,LLL,CCC))
colnames(bbb)=c("Ind","Typ","Location","Count")

bbb =  mutate(bbb,  Ind= factor(Ind, levels=unique(Ind)),
              Typ = factor(Typ, levels=unique(Typ)),
              Location = factor(Location, levels=unique(Location)))

Data.xtabs = xtabs(CCC ~ Location + Typ + Ind, data=bbb)

Table.Z$CMH.p[i]=round(mantelhaen.test(Data.xtabs)$p.value,2)
Table.Z$Woolf.p[i]=round(woolf_test(Data.xtabs)$p.value,2)
Table.Z$BD.p[i]=round(BreslowDayTest(Data.xtabs)$p.value,2)
}

i=1310

aaa=read.table("E:/ML/mutation-prone/chapter2/mutation-test/all.gene.dis.txt",header=T)

Table.Z=as.data.frame(aaa[,c(1,2)])
colnames(Table.Z)=c("Location","CMH.p")
III=c("FF","FF","FFm","FFm")
TTT=c("Mutation","Regular","Mutation","Regular")
LLL=c("in","in","out","out")
for(i in 1:1427){
  CCC=c(aaa$FF[i],1,aaa$FFm[i],1426)
  bbb=as.data.frame(cbind(III,TTT,LLL,CCC))
  colnames(bbb)=c("Ind","Typ","Location","Count")
  
  bbb =  mutate(bbb,  Ind= factor(Ind, levels=unique(Ind)),
                Typ = factor(Typ, levels=unique(Typ)),
                Location = factor(Location, levels=unique(Location)))
  
  Data.xtabs = xtabs(CCC ~ Location + Typ + Ind, data=bbb)
  
  Table.Z$CMH.p[i]=round(mantelhaen.test(Data.xtabs)$p.value,2)
  #Table.Z$Woolf.p[i]=round(woolf_test(Data.xtabs)$p.value,2)
  #Table.Z$BD.p[i]=round(BreslowDayTest(Data.xtabs)$p.value,2)
}
setwd("E:/ML/mutation-prone/chapter2/mutation-test/")
write.table(Table.Z,file = "all.gene.PS.test")
