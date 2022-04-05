Notas de aula de aula do curso de Estatística para Línguística
============

__autor:__ Adelino Pinheiro Silva

__email:__ adelinocpp@yahoo.com

## Disclaimer

Todas as imagens disponibilizadas que foram utilizadas na composição das notas de aula, que não são de autoria própria,  estão devidamente referenciadas aos seus sites de origem no arquivo PDF.

## Gria de instalação do R no windows

**Disclaimer:** não sou usuário de windows, logo podem acontecer alguns imprevistos.

**Atualizado:** 05 de abri de 2022

### Instalação direta

**Observação:** Sempre verifique os links, o do R começa com "https://cran-r.c3sl.ufpr.br/" e do Rstudo começa com "https://download1.rstudio.org/"

Instale primeiro o R e depois o Rstudio. Durante a instalação, o Rstudio  precisa encontrar a instalação do R.

Se seu sistema operacional é windows 9 ou 10 (ou superior) e 64 bits


1. Baixe e instale o pacote [R 4.1.3](https://cran-r.c3sl.ufpr.br/bin/windows/base/R-4.1.3-win.exe) 

2. Em seguida baixe e instal o [Rstudio 2022.02.1.46](https://download1.rstudio.org/desktop/windows/RStudio-2022.02.1-461.exe) 


### Iniciando o Rstudio

No windows inicie o Rstudio através do menu iniciar. O primeiro passo é identificar os paineis, em especial o editor de código e o console.

![Tela Rstudio](./Rtutorial/RStudio_039.png  "Tela do Rstudio indicando os principais paineis")

O **diretório de trabalho** é uma variável importante para o R (ou Rstudio). Para indicar o diretório de trabalho utilize o atalho Ctrl+Shift+H (isso na versão para linux), ou comando (no console) :
```
setwd("CAMINHO DO DIRETORIO")
```

onde "CAMINHO_DO_DIRETORIO" é o endereço, por exemplo, "D:\cursos\estatistica\Rcodes". Ou então acesse o menu Session->Set Working Directory->Chooe Directory como indicado na figura a seguir:

![Menu alterar diretorio](./Rtutorial/RStudio_022.png  "Caminho do menu para indicar o diretŕorio de trabalho")

Caso deseja saber qual o diretŕoio corrente de trabalho utilize o comando
```
getwd()
```

### Exemplo de carga de dados

