cat("\014")
rm(list = setdiff(ls(), lsf.str()))
library(stats)
library(pwr)
library(effsize)
library(ggcorrplot)
library(GGally)
library(ggplot2)
# --- LEITURA DO ARQUIVO DE DADOS ----------------------------------------------
reg_bnc <- read.table("./reg_bnc.csv", header = TRUE, 
                      sep = ",",dec = ".",quote = "\"")
png(file = "./Correlacao_01.png",width = 600, height = 450, units = "px")
  ggcorrplot(cor(reg_bnc[3:12]))
dev.off()

png(file = "./Multiplot_01.png",width = 800, height = 600, units = "px")
  ggpairs(reg_bnc[3:12])+ theme_bw()
dev.off()
lm_Data_01 <- lm(Ncomm ~ Adj, data = reg_bnc)

png(file = "./Regressao_01.png",width = 600, height = 450, units = "px")
par(mfrow=c(2,2))
  plot(lm_Data_01)
par(mfrow=c(1,1))
dev.off()


png(file = "./Scater_01.png",width = 600, height = 450, units = "px")
ggplot(reg_bnc, aes(x=Ncomm, y=Adj)) + 
  geom_point(size=5) +
  geom_smooth(method="lm", col="green") + 
  theme(panel.grid = element_line(color = "gray",
                              size = 0.5,
                              linetype = 2),)
dev.off()

lm_Data_02 <- lm(Ncomm ~ P1, data = reg_bnc)
png(file = "./Regressao_02.png",width = 600, height = 450, units = "px")
par(mfrow=c(2,2))
plot(lm_Data_02)
par(mfrow=c(1,1))
dev.off()


png(file = "./Scater_02.png",width = 600, height = 450, units = "px")
ggplot(reg_bnc, aes(x=Ncomm, y=P1)) + 
  geom_point(size=5) +
  geom_smooth(method="lm", col="green") + 
  theme(panel.grid = element_line(color = "gray",
                                  size = 0.5,
                                  linetype = 2),)
  dev.off()

lm_Data_03 <- lm(Adj ~ Nprop, data = reg_bnc)
png(file = "./Regressao_03.png",width = 600, height = 450, units = "px")
par(mfrow=c(2,2))
plot(lm_Data_03)
par(mfrow=c(1,1))
dev.off()


png(file = "./Scater_03.png",width = 600, height = 450, units = "px")
ggplot(reg_bnc, aes(x=Adj, y=Nprop)) + 
  geom_point(size=5) +
  geom_smooth(method="lm", col="green") + 
  theme(panel.grid = element_line(color = "gray",
                                  size = 0.5,
                                  linetype = 2),)
  dev.off()