cat("\014")
rm(list = setdiff(ls(), lsf.str()))
# -----------------------------------------------------------------------------
data_lemas <- read.table("../Dados/lexporbr_alfa_lemas_txt.txt", header = TRUE, 
                        sep = "\t",dec = ",",quote = "\"")
head(data_lemas)
dim(data_lemas)
summary(data_lemas)
# -----------------------------------------------------------------------------
png(file = "../Imagens/histograma.png",width = 864, height = 486, units = "px")
hist(data_lemas$nb_letras,main="Histograma do numero de letras em cada ocorrência",
     breaks=40,xlab = "número de letras", ylab="Ocorrências",col = "blue2",
     border="white")
dev.off()
# -----------------------------------------------------------------------------
png(file = "../Imagens/Box_plot.png",width = 864, height = 486, units = "px")
boxplot(data_lemas$nb_letras ~ cat_gram, data = data_lemas, ylab = "Número de letras", col = "blue2",
        border="black")
dev.off()
# -----------------------------------------------------------------------------
stem(data_lemas$nb_letras[1:300])
# -----------------------------------------------------------------------------
tab <- table(data_lemas$cat_gram, data_lemas$nb_letras)
