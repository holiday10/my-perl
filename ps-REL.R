library(myTAI)
#phyloexample <- data(PhyloExpressionSetExample)
#PlotRE(PhyloExpressionSetExample,
#       Groups = list(c(1:3), c(4:12)), 
 #      legendName = "PS",
  #     adjust.range = TRUE)
setwd("E:/ML/mutation-prone/chapter2/mutation-test/snv-REL/")
conserv <- read.table("snv-111REL.txt",header = T)
# Test Statistic : Flat Line Test (default)
PlotSignature( ExpressionSet = conserv,
               measure       = "TAI", 
               TestStatistic = "FlatLineTest",
               xlab          = "Ontogeny", 
               ylab          = "TAI" )
PlotRE(conserv,
       Groups = list(c(1),c(2)), 
       legendName = "PS",
       adjust.range = TRUE)
PlotRE(conserv,
       Groups = list(c(3),c(4)), 
       legendName = "PS",
       adjust.range = TRUE)
PlotRE(conserv,
       Groups = list(c(5),c(6)), 
       legendName = "PS",
       adjust.range = TRUE)
PlotRE(conserv,
       Groups = list(c(7),c(8)), 
       legendName = "PS",
       adjust.range = TRUE)
PlotRE(conserv,
       Groups = list(c(9),c(10)), 
       legendName = "PS",
       adjust.range = TRUE)
PlotRE(conserv,
       Groups = list(c(11),c(12)), 
       legendName = "PS",
       adjust.range = TRUE)
