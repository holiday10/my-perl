library(dplyr)
library(vcd)
library(DescTools)
setwd("e:/ML/mutation-prone/chapter2/mutation-test/9.25cmh/")

svdata=read.table("snv-7ind.txt",header=T)
Table.Z=as.data.frame(svdata[,c(1,2,3,4)])
colnames(Table.Z)=c("Location","CMH.p","Woolf.p","BD.p")

#III=c("FF","FF","FF","FF","FP","FP","FP","FP")
IIINDV=c(rep("F2-1",4),rep("F3fp",4),rep("F3mp",4),rep("F3-12",4),rep("F4-1",4),rep("F4-2",4),rep("F4-6",4))
#TTT=c("Mutation","Regular","Mutation","Regular","Mutation","Regular","Mutation","Regular")
TTTmu=c(rep(c("Mutation","Regular"),14))
#LLLoca=c("in","in","out","out","in","in","out","out")
LLLoca=c(rep(c("in","in","out","out"),7))

for(i in 1:length(svdata$bin)){
  CCC=c(svdata[i,2]+0.01,1,svdata[i,3],length(svdata$bin)-1, 
        svdata[i,4]+0.01,1,svdata[i,5],length(svdata$bin)-1, 
        svdata[i,6]+0.01,1,svdata[i,7],length(svdata$bin)-1, 
        svdata[i,8]+0.01,1,svdata[i,9],length(svdata$bin)-1, 
        svdata[i,10]+0.01,1,svdata[i,11],length(svdata$bin)-1, 
        svdata[i,12]+0.01,1,svdata[i,13],length(svdata$bin)-1,
        svdata[i,14]+0.01,1,svdata[i,15],length(svdata$bin)-1)
  bbb=as.data.frame(cbind(IIINDV,TTTmu,LLLoca,CCC))
  colnames(bbb)=c("Ind","Typ","Location","Count")
  
  bbb =  mutate(bbb,  Ind= factor(Ind, levels=unique(Ind)),
                Typ = factor(Typ, levels=unique(Typ)),
                Location = factor(Location, levels=unique(Location)))
  
  Data.xtabs = xtabs(CCC ~ Location + Typ + Ind, data=bbb)
  
  Table.Z$CMH.p[i]=round(mantelhaen.test(Data.xtabs)$p.value,4)
  Table.Z$Woolf.p[i]=round(woolf_test(Data.xtabs)$p.value,4)
  Table.Z$BD.p[i]=round(BreslowDayTest(Data.xtabs)$p.value,4)
}


write.table(Table.Z,"7snv.cmh.result.txt",sep = "\t",row.names = T)
