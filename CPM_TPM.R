setwd("E:/omics_data/ml/FF")#设置工作目录

countdata<-read.table("37emb.mod.counts",sep="\t",header = T,row.names = 1)

metadata <- countdata[,1:2]#提取基因信息count数据前的几列,第一列认为是ID（row.names=1），第二列开始索引为1

countdata <- countdata[,3:ncol(countdata)]#提取counts数，counts数据主题部分,从metadata基因信息往后的第一列开始

prefix<-"mla-37emb-mod"#设置输出文件前缀名

cpm <- t(t(countdata)/colSums(countdata) * 1000000)#参考cpm定义

avg_cpm <- data.frame(avg_cpm=rowMeans(cpm))

#-----TPM Calculation------

kb <- metadata$Length / 1000

rpk <- countdata/kb

tpm <- t(t(rpk)/colSums(rpk) * 1000000)

avg_tpm <- data.frame(avg_tpm=rowMeans(tpm))

write.csv(avg_tpm,paste0(prefix,"_avg_tpm.csv"))

write.csv(avg_cpm,paste0(prefix,"_avg_cpm.csv"))

write.csv(tpm,paste0(prefix,"jj_tpm.csv"))

write.csv(cpm,paste0(prefix,"_cpm.csv"))