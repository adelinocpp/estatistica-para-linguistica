cat("\014")
rm(list = setdiff(ls(), lsf.str()))
library(stats)
library(pwr)
library(effsize)

# --- LEITURA DO ARQUIVO DE DADOS ----------------------------------------------
df_disf <- read.table("../Dados/db_Disfluencia_Ana_Beatriz_v00.csv", header = TRUE, 
                      sep = "\t",dec = ",",quote = "\"")

media_G1 = mean(df_disf$Ges_Total[df_disf$GRUPO == 1])
media_G2 = mean(df_disf$Ges_Total[df_disf$GRUPO == 2])
std_G1 = sd(df_disf$Ges_Total[df_disf$GRUPO == 1])
std_G2 = sd(df_disf$Ges_Total[df_disf$GRUPO == 2])
varTest <- var.test(df_disf$Ges_Total ~df_disf$GRUPO, alternative = "two.sided")
cohenD <- cohen.d(df_disf$Ges_Total,df_disf$GRUPO)
t.test(df_disf$Ges_Total ~df_disf$GRUPO, var.equal = TRUE)
pwr.t.test(n=20, d=cohenD$estimate, type = "two.sample", alternative = "two.sided")

propTest <- prop.test(x=c(13,19), n=c(20,20),p = NULL, alternative = "two.sided",
          correct = TRUE)
pwr.2p.test(h = sqrt(propTest$statistic/20), n = 20, sig.level = 0.05, power = NULL, 
            alternative = "two.sided")

tabABC <- as.table(rbind(c(223,2,75), c(107,170,23)))
dimnames(tabABC) <- list(grupos = c("Tratamento", "Controle"), resultado = c("Melhora","Sem efeito", "Piora"))
tabAB <- as.table(rbind(c(223,77), c(107,193)))
dimnames(tabAB) <- list(grupos = c("Tratamento", "Controle"), resultado = c("Melhora","Outro"))
tabBC <- as.table(rbind(c(225,75), c(277,23)))
dimnames(tabBC) <- list(grupos = c("Tratamento", "Controle"), resultado = c("Outro","Piora"))

chsqtabAB <- chisq.test(tabAB)
chsqtabBC <- chisq.test(tabBC)
contribAB <- 100*chsqtabAB$residuals^2/chsqtabAB$statistic
contribBC <- 100*chsqtabBC$residuals^2/chsqtabBC$statistic
