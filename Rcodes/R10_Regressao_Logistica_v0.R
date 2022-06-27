cat("\014")
rm(list = setdiff(ls(), lsf.str()))
library(stats)
library(pwr)
library(effsize)
library(ggcorrplot)
library(GGally)
library(ggplot2)
library(car)
library(stats)
library(plyr)     # Calculo de medidas nos grupos
library(dplyr)    # alternatively, this also loads %>%
library(pwr)
library(effsize)
library(RColorBrewer)
library(pROC)
library(rms)
# library(relaimpo)

# --- configurações das figuras ------------------------------------------------
FIG_MODE <- 'ARTIGO'
cm2in <- 0.393701
figDPI <- 300
figWidthCM = 7
figHeightCM = 5.25
baseSizeDPI <- 0.1*figDPI
if (FIG_MODE == 'ARTIGO') {
  figWidthPx <- figWidthCM*cm2in*figDPI
  figHeightPx <- figHeightCM*cm2in*figDPI
} else {
  figWidthPx <- 15*cm2in*figDPI
  figHeightPx <- figHeightCM*cm2in*figDPI
}  

# --- Exemplo 1 
# --- LEITURA DO ARQUIVO DE DADOS ----------------------------------------------
df_disf <- read.table("../Dados/db_Disfluencia_Ana_Beatriz_v00.csv", header = TRUE, 
                      sep = "\t",dec = ",",quote = "\"")

df_disf$GRUPO <- as.factor(df_disf$GRUPO)
levels(df_disf$GRUPO) <- list("G1" = 1, "G2" = 2)

disf_lrm <- lrm(GRUPO~Ges_Total, data = df_disf)
roc_m1 <- roc(GRUPO~Ges_Total, data = df_disf)
auc <- round(auc(roc_m1),4)

png(file = "./R10_ROC_Gestos_Grupo_00.png",width = figWidthPx, height = figHeightPx, units = "px")
ggroc(roc_m1, colour = 'steelblue', size = 2) +
theme_bw(base_size = baseSizeDPI) + 
  geom_segment(aes(x = 0, y = 0, xend = 1, yend = 1),linetype="dashed",color="dark green",size=1.5) + 
labs(x="Especificidade (1-TFP)",y="Sentividade (TVP) ",title=paste0('Curva ROC ', '(AUC = ', auc, ')'))
dev.off()


m1=glm(GRUPO~Ges_Total, family = binomial(link="logit"), data = df_disf)
summary(m1)
NUM_GESTOS<-data.frame(Ges_Total=seq(0,35,by=0.125))
# Criando campo de predição para cada idade dos indivíduos 
NUM_GESTOS$PRED=predict(m1, newdata=NUM_GESTOS, type="response")

png(file = "./R10_Logistica_Gestos_Grupo_00.png",width = 1.5*figWidthPx, height = figHeightPx, units = "px")
ggplot(df_disf, aes(x=Ges_Total, y=GRUPO, color=GRUPO)) + 
  geom_point(size=5) +
  theme_bw(base_size = baseSizeDPI) + xlim(0, 35) + 
  geom_line(data=NUM_GESTOS, aes(x=Ges_Total, y=PRED+1), color="dark green",size=2.5) +
  # geom_vline(aes(xintercept=8.875),linetype="dashed",color="green",size=2.5) +
  geom_segment(aes(x = 8.875, y = 1, xend = 8.875, yend = 2),linetype="dashed",color="dark green",size=1.5) + 
  theme(panel.grid = element_line(color = "gray",
                              size = 0.5,
                              linetype = 2),) +
  theme(legend.position= c(0.8, 0.45)) + 
  labs(x="Número total de gestos",y="",title="Regressão logística para o número de gestos")
dev.off()

mu <- ddply(df_disf, "GRUPO", summarise, grp.mean=mean(Ges_Total))
png(file = "./R10_Gaussianas_Gestos_Grupo_00.png",width = figWidthPx, height = figHeightPx, units = "px")
ggplot(df_disf, aes(x=Ges_Total, color=GRUPO)) + 
  geom_density(adjust = 1, size=2.5)+ geom_point(y = 0, size=5) +
  theme_bw(base_size = baseSizeDPI) + 
  xlim(0, 35) + 
  # geom_vline(data=mu, aes(xintercept=grp.mean, color=GRUPO),
  #            linetype="dashed",size=2.5) +
  # geom_vline(aes(xintercept=8.875),linetype="dashed",color="green",size=2.5) +
  theme(panel.grid = element_line(color = "gray",
                                  size = 0.5,
                                  linetype = 2),) +
  theme(legend.position= c(0.8, 0.45)) + 
  labs(x="Número total de gestos",y="",title="Densidade para o número de gestos")
dev.off()
