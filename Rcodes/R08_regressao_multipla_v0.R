cat("\014")
rm(list = setdiff(ls(), lsf.str()))
library(stats)
library(pwr)
library(effsize)
library(ggcorrplot)
library(GGally)
library(ggplot2)
library(stats)
library(car)
# library(relaimpo)

# --- LEITURA DO ARQUIVO DE DADOS ----------------------------------------------
reg_bnc <- read.table("./reg_bnc.csv", header = TRUE, 
                      sep = ",",dec = ".",quote = "\"")

model_01_fit <- lm(P1 ~ P2 + Adj, data=reg_bnc)
model_02_fit <- lm(P1 ~ P2 + Adj + Interject, data=reg_bnc)
summary(model_01_fit)
summary(model_02_fit)

comp_01_02 <- anova(model_01_fit, model_02_fit)


# FUNCOES UTEIS
# Coeficientes do modelo
# coefficients(model_01_fit) 
# Intervalo de confiança dos parâmetro
# confint(model_01_fit, level=0.95) 
# Valores preditos
# fitted(model_01_fit) 
# Resíduos
# residuals(model_01_fit) 
# anova table
# anova(model_01_fit) 
# Matriz de covariância dos parâmetros
# vcov(model_01_fit) 
# Diagnostico da regressao
# influence(model_01_fit)

# diagnostic plots
# outlierTest(model_01_fit) # Bonferonni p-value for most extreme obs
png(file = "./QQPlot_M01.png",width = 600, height = 450, units = "px")
qqPlot(model_01_fit, main="QQ Plot") #qq plot for studentized resid
dev.off()

png(file = "./Leverange_M01.png",width = 600, height = 450, units = "px")
leveragePlots(model_01_fit) # leverage plots
dev.off()


png(file = "./QQPlot_M02.png",width = 600, height = 450, units = "px")
qqPlot(model_02_fit, main="QQ Plot") #qq plot for studentized resid
dev.off()

png(file = "./Leverange_M02.png",width = 600, height = 450, units = "px")
leveragePlots(model_02_fit) # leverage plots
dev.off()
