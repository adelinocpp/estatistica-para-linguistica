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
NSL <- read.table("./NSL.csv", header = TRUE, 
                      sep = ",",dec = ".",quote = "\"")
NSL$Cohort <- as.factor(NSL$Cohort)
levels(NSL$Cohort) <- list("1" = 1, "2" = 2, "3"= 3)

png(file = "./BoxPlot_NSL_00.png",width = 1.5*figWidthPx, height = figHeightPx, units = "px")
p <- ggplot(NSL, aes(x=Cohort, y=MannerPath, fill=Cohort)) + theme_bw(base_size = baseSizeDPI) +
  geom_boxplot()  +
  theme(legend.position= c(0.2, 0.8)) +
  labs(x="Grau Cohort",y="MannerPath", title="") +
  theme(axis.text.x=element_blank()) 
p
dev.off()

# cohenD <- cohen.d(NSL$MannerPath~NSL$Cohort)
flignerVAR <- fligner.test(NSL$MannerPath ~ NSL$Cohort)
# NSL_Cohort_1 <- NSL$MannerPath[NSL$Cohort == "1"]
NSL_Cohort_2 <- NSL$MannerPath[NSL$Cohort == "2"]
NSL_Cohort_3 <- NSL$MannerPath[NSL$Cohort == "3"]
oneway <- aov(NSL$MannerPath ~ NSL$Cohort)
summary(oneway)
tukeyoneway<-TukeyHSD(oneway)
# pwrAnova <- pwr.anova.test(k = 4, n = 2, f = abs(cohenD$estimate), sig.level = 0.05, power = NULL)

A <- as.data.frame(tukeyoneway$`NSL$Cohort`)
ciInf <- A$lwr
ciSup <- A$upr
meanDiff <- A$diff
png(file = "./Diferenca_MannerPath_01.png",width = figWidthPx, height = figHeightPx, units = "px")
cy = rownames(A)
ggplot() + 
  geom_errorbarh(mapping=aes(y=cy, xmin=ciInf, xmax=ciSup), height=0.2, size=1, color="blue") + 
  geom_point(mapping=aes(y=cy, x=meanDiff), size=8, shape=21,fill="blue") +
  geom_vline(xintercept=0, size=1.5,linetype='dashed', color='black') + 
  theme_bw(base_size = baseSizeDPI) +  xlim(-0.5, 1) +  # ylim(-1,1) + 
  labs(x="Diferença média",y="", title="MannerPath")
dev.off()

