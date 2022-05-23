cat("\014")
rm(list = setdiff(ls(), lsf.str()))
library(stats)
library(pwr)

# --- LEITURA DO ARQUIVO DE DADOS ----------------------------------------------
df_disf <- read.table("../Dados/db_Disfluencia_Ana_Beatriz_v00.csv", header = TRUE, 
                      sep = "\t",dec = ",",quote = "\"")

tbProporcao <- table(df_disf$GRUPO,df_disf$SEXO)
prop.test(x=9, n=20, p=0.50, alternative="two.sided")

sdIdade <- sd(df_disf$IDADE)
delta <- 4/sdIdade  # Mínimo efeito (detectável). Exemplo 3 anos na média de idade
alpha <- 0.05 # Significancia
power <- 0.95 # 1-beta

pwr.t.test(n = 40, d = delta, sig.level = alpha, type = "one.sample", alternative = "less")