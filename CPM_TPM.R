setwd("E:/omics_data/ml/FF")#���ù���Ŀ¼

countdata<-read.table("37emb.mod.counts",sep="\t",header = T,row.names = 1)

metadata <- countdata[,1:2]#��ȡ������Ϣcount����ǰ�ļ���,��һ����Ϊ��ID��row.names=1�����ڶ��п�ʼ����Ϊ1

countdata <- countdata[,3:ncol(countdata)]#��ȡcounts����counts�������ⲿ��,��metadata������Ϣ����ĵ�һ�п�ʼ

prefix<-"mla-37emb-mod"#��������ļ�ǰ׺��

cpm <- t(t(countdata)/colSums(countdata) * 1000000)#�ο�cpm����

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