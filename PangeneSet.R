
setwd("E:/ML/8-pan-ortho/1.11-ortho/1e-10/growth/")

DATA <- read.table("core-pan-growth.txt",header=T) 



file = read.table("pheatmap-10.txt",header=T,sep="\t",row.names = 1)

data <- t(file)#输入文件为RPKM，tab键分隔
library(pheatmap)

pheatmap(data,color = colorRampPalette(c("#77c3ec","#e57c80"))(100),cluster_rows=F,cluster_cols=F,
         ,show_rownames = F, show_colnames = F,fontsize_row=15,fontsize_col=30)
#红-黑-绿过渡，调色板分辨率=100，基因聚类，个体不聚类，基因及个体名字号=15
#不指定颜色则取默认淡红-白-蓝过渡

library(ggplot2)

# Iris dataset is natively provided by R
#head(iris)
DATA <- read.table("core-pan-growth.txt",header=T) 
core <- function(x) 9910+ 12206 * exp(-x/3.12)
#curve(core, 0,8 )
pan <- function(g) 19104 + 918.3 * (g-1) + 9225 * exp(-2/1.47)*((1-exp(-(g-1)/1.47))/(1-exp(-1/1.47)))

# use options!
myplot <- ggplot(DATA, aes(x=x, y=y,color = type, shape = type)) + 
  geom_point(
    #color=c("#77c3ec","#e57c80"),
    #fill=c("#77c3ec","#e57c80"),
    
    alpha=0.5,
    size=6,
   
  )+
  geom_function(fun =core , colour = "#e57c80",size = 1.5)+
  geom_function(fun = pan, colour = "#03c0c4",size = 1.5 ) + scale_x_continuous(limits=c(1,10),
                                                                                breaks = seq(1,10,1))

myplot
myplot + theme(panel.background = element_blank())+theme(axis.line = element_line(colour = "black"))
library(ggThemeAssist)
ggThemeAssistGadget(myplot)


myplot + theme(axis.line = element_line(size = 0.5, 
    linetype = "solid"), axis.ticks = element_line(colour = "black"), 
    axis.title = element_text(size = 15), 
    axis.text = element_text(size = 15), 
    axis.text.x = element_text(colour = "black"), 
    axis.text.y = element_text(colour = "black"), 
    plot.title = element_text(size = 15), 
    legend.text = element_text(size = 15), 
    legend.title = element_text(size = 15), 
    panel.background = element_rect(fill = NA), 
    legend.key = element_rect(fill = NA), 
    legend.background = element_rect(fill = NA)) +labs(x = "Sample Number", y = "Family Number", 
    colour = NULL, shape = NULL)
 ps_type <- read.table("SNP-number.txt",header=T) 

boxplot(ps_type$core ,ps_type$soft,ps_type$dispensable,ps_type$private,
        #main = "Airquality Boxplot",
        #xlab = "Months",
        ylab = "SNP number",
        notch = T,ylim = c(0, 400),
        #las = 1,
        col = c("#ef7571","#e58da2","#5f9dd4","#e6da90"),
        names = c("Core","Softcore","Dispensable","Private")
)

