cat("\014")
rm(list = setdiff(ls(), lsf.str()))
library(moments)
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
# -----------------------------------------------------------------------------
# --- Seleciona o numero de letras dos 'gram'
vec_n_letras_sel <- data_lemas[data_lemas$cat_gram %in% 'gram',]$nb_letras
# -----------------------------------------------------------------------------
# Densidade estimada
data_density <- density(vec_n_letras_sel,n=4096, bw=1.2*bw.nrd(vec_n_letras_sel))
idx_max <- which.max(data_density$y)
moda_data <- data_density$y[idx_max]
x_moda <- data_density$x[idx_max]
mean_data <- mean(vec_n_letras_sel)
idx_mean <- which(data_density$x >= mean_data)[1]
y_mean <- data_density$y[idx_mean]
medi_data <- median(vec_n_letras_sel)
idx_medi <- which(data_density$x >= medi_data)[1]
y_medi <- data_density$y[idx_medi]
stdv_data <- sd(vec_n_letras_sel)
curt_data <- kurtosis(vec_n_letras_sel)
assi_data <- skewness(vec_n_letras_sel)
# -----------------------------------------------------------------------------
png(file = "../Imagens/densidade_plot.png",width = 864, height = 486, units = "px", bg = "transparent")
plot(x=data_density$x,y=data_density$y,type='l',xlab="numero letras",ylab="densidade")
grid(10,lwd =2)
points(x_moda,moda_data,cex = 2, col = "dark red", pch=16)
points(mean_data,y_mean,cex = 2, col = "dark green",pch=16)
points(medi_data,y_medi,cex = 2, col = "dark blue",pch=16)
legend(x = "topright",          # Position
       legend = c("moda","média",'mediana'),  # Legend texts
       lty = c(0,0,0),           # Line types
       col = c("dark red", "dark green","dark blue"),           # Line colors
       lwd = 2,
       pch=c(16,16,16),cex = 1.5)   
dev.off()
# -----------------------------------------------------------------------------
# --- dispersao e correlação
vec_X_sel <- data_lemas[data_lemas$cat_gram %in% 'gram',]$nb_letras
vec_Y_sel <- data_lemas[data_lemas$cat_gram %in% 'gram',]$zipf_escala
png(file = "../Imagens/scatter_plot_02.png",width = 864, height = 486, units = "px", bg = "transparent")
plot(x=vec_X_sel,y=vec_Y_sel,type='p',pch=16,xlab="nb_letras",ylab="zipf_escala")
grid(10,lwd =2)
dev.off()
cor(vec_X_sel,vec_Y_sel)