rm(list = setdiff(ls(), lsf.str()))
library("yarrr")
# -----------------------------------------------------------------------------
data_lemas <- read.table("../Dados/lexporbr_alfa_lemas_txt.txt", header = TRUE, 
                        sep = "\t",dec = ",",quote = "\"")
head(data_lemas)
dim(data_lemas)
summary(data_lemas)
# -----------------------------------------------------------------------------
vec_nb_letras = data_lemas$nb_letras
vec_cat_gram = data_lemas$cat_gram
cat_gram_unique = unique(vec_cat_gram)

n_data = length(vec_nb_letras)
std_data = sd(vec_nb_letras)
# n_scott = round(3.5*std_data/(n_data^(1/3)))

png(file = "histograma.png")
hist(vec_nb_letras,main="Histograma do numero de letras em cada ocorrência",
     breaks=40,xlab = "número de letras", ylab="Ocorrências",col = "blue2",
     border="white")
dev.off()

png(file = "Box_plot.png")
boxplot(data_lemas$nb_letras ~ cat_gram, data = data_lemas, ylab = "Número de letras", col = "blue2",
        border="black")
dev.off()

yarrr::pirateplot(formula = nb_letras ~ cat_gram, # dv is weight, iv is Diet
                  data = data_lemas,
                  main = "Numero letras por categoria",
                  xlab = "Categoria",
                  ylab = "Numero de letras")

# pirateplot(dv.name = nb_letras,
#            iv.name = cat_gram,
#            data = data_lemas,
#            main = "Numero letras por categoria"
# )