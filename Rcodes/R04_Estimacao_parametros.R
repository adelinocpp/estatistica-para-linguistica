cat("\014")
rm(list = setdiff(ls(), lsf.str()))
library(stats)

# --- LEITURA DO ARQUIVO DE DADOS ----------------------------------------------
df_disf <- read.table("../Dados/db_Disfluencia_Ana_Beatriz_v00.csv", header = TRUE, 
                      sep = "\t",dec = ",",quote = "\"")

media_G1 = mean(df_disf$Ges_Total[df_disf$GRUPO == 1])
media_G2 = mean(df_disf$Ges_Total[df_disf$GRUPO == 2])
std_G1 = sd(df_disf$Ges_Total[df_disf$GRUPO == 1])
std_G2 = sd(df_disf$Ges_Total[df_disf$GRUPO == 2])
erro_padrao_G1 = std_G1/sqrt(length(df_disf$Ges_Total[df_disf$GRUPO == 1]))
erro_padrao_G2 = std_G2/sqrt(length(df_disf$Ges_Total[df_disf$GRUPO == 2]))
N = length(df_disf$Ges_Total[df_disf$GRUPO == 1])
sig_alpha = 0.05
paramT = qt(1-sig_alpha/2,N-1)
Sup_g1 = media_G1 + paramT*erro_padrao_G1
Inf_g2 = media_G2 - paramT*erro_padrao_G2