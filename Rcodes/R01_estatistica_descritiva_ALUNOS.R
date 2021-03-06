cat("\014")
rm(list = setdiff(ls(), lsf.str()))
# library(moments)
# -----------------------------------------------------------------------------
data_lemas <- read.table("../Dados/lexporbr_alfa_lemas_txt.txt", header = TRUE, 
                        sep = "\t",dec = ",",quote = "\"")
# -----------------------------------------------------------------------------
# hist(data_lemas$nb_letras)
png(file = "histograma.png",width = 864, height = 486, units = "px")
hist(data_lemas$nb_letras,main="Histograma do numero de letras em cada ocorrência",
     breaks=100,xlab = "número de letras", ylab="Ocorrências",col = "blue2",
     border="white")
dev.off()



