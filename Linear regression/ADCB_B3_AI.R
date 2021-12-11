#Instalar tidyverse, boot, car, QuantPsyc, ggplot2, dplyr
install.packages("tidyverse")
install.packages("boot")
install.packages("car")
install.packages("QuantPsyc")
install.packages("ggplot2")
install.packages("dplyr")
#Cargar librerias
library(tidyverse)
library(boot)
library(car)
library(QuantPsyc)
library(ggplot2)
#Importar base de datos
library(readxl)
Datos <- read_excel("Datos.xlsx", sheet = "Datos", 
                    +     col_types = c("numeric", "numeric", "numeric", 
                                        +         "numeric", "numeric", "numeric"))
View(Datos)
DatosTransformados <- read_excel("DatosTransformados.xlsx", 
                                 col_types = c("numeric", "numeric", "numeric", 
                                               "numeric", "numeric", "numeric"))
View(DatosTransformados)
#Ver los nombres de las variables
names(Datos)
names(DatosTransformados)
#Instalar pastecs
install.packages("pastecs")
#Cargar libreria pastecs
library(pastecs)
#Estad韘ticas descriptivas
stat.desc(Datos)
#Comprobar el tipo de variable
str(Datos)
#Ruta que sigue R para buscar objetos
attach(Datos)
attach(DatosTransformados)
#Gr醘icos de dispersi髇
plot(Sup,Prod)
plot(Temp,Prod)
plot(Precip, Prod)
plot(Pob,Prod)
## Se quiere conocer el tipo de distribuci贸n que tiene cada variable
#Instalar psych
install.packages("psych")
library(psych)
multi.hist(x = Prod, dcol = c("blue", "red"), dlty = c("dotted", "solid"),
           main = "")
multi.hist(x = Prodln, dcol = c("blue", "red"), dlty = c("dotted", "solid"),
           main = "")
multi.hist(x = Sup, dcol = c("blue", "red"), dlty = c("dotted", "solid"),
           main = "")
multi.hist(x = Supln, dcol = c("blue", "red"), dlty = c("dotted", "solid"),
           main = "")
multi.hist(x = Temp, dcol = c("blue", "red"), dlty = c("dotted", "solid"),
           main = "")
multi.hist(x = Templn, dcol = c("blue", "red"), dlty = c("dotted", "solid"),
           main = "")
multi.hist(x = Precip, dcol = c("blue", "red"), dlty = c("dotted", "solid"),
           main = "")
multi.hist(x = Precipln, dcol = c("blue", "red"), dlty = c("dotted", "solid"),
           main = "")
multi.hist(x = Pob, dcol = c("blue", "red"), dlty = c("dotted", "solid"),
           main = "")
multi.hist(x = Pobln, dcol = c("blue", "red"), dlty = c("dotted", "solid"),
           main = "")
##Otros paquetes permiten representar los diagramas de dispersi贸n, los valores de correlaci贸n para cada par de variables y la distribuci贸n de cada una de las variables.
#Instalar GGally
install.packages("GGally")
#Cargar libreria "GGally"
library(GGally)
ggpairs(Datos, lower = list(continuous = "smooth"),
        diag = list(continuous = "barDiag"), axisLabels = "none")
#Generar el modelo, hay diferentes formas de llegar al modelo final m谩s adecuado. 
##En este caso se va a emplear el m茅todo mixto iniciando el modelo con todas las variables como predictores y realizando la selecci贸n de los mejores predictores con la medici贸n Akaike(AIC).
#Modelo de regresi贸n lineal m煤ltiple
modelo <- lm(Prodln ~ Supln + Pobln, data = Datos)
summary(modelo)
modelo <- lm(Prodln ~ Precipln + Templn, data = Datos)
summary(modelo)
