################################################################################
################ PRÁCTICA 4 DATAFRAMES Y GGPLOT ################################
#Descripción: 
#Autor: Alan Gracia Zambrano
################################################################################

#Construimos dos vectores de fechas ne formato Character
FECHA_REGISTRO <- c("2020/01/01", "2020/02/01", "2020/03/01", "2020/04/01", "2020/05/01")
FECHA_NACIMIENTO <- c("2020.01.01", "2020.02.01", "2020.03.01", "2020.04.01", "2020.05.01")

#Transformando los vectores a Fechas (Date)
FECHA_REGISTRO <- as.Date(FECHA_REGISTRO)
FECHA_NACIMIENTO <- as.Date(FECHA_NACIMIENTO, format = "%Y.%m.%d")

ENTIDAD <- c("CHIHUAHUA", "DURANGO", "AGUASCALIENTES", "QUERETARO", "BAJA CALIFORNIA")
CASOS <- c(807,960,150,330,254)
SEXO <- c("MUJERES", "MUJERES","MUJERES","MUJERES","MUJERES")

#Construimos el dataframe con datos de mujeres
MUJERES <- data.frame(FECHA_REGISTRO, FECHA_NACIMIENTO, ENTIDAD, CASOS, SEXO )

################################################################################

#Construimos dos vectores de fechas ne formato Character
FECHA_REGISTRO <- c("2020/01/01", "2020/02/01", "2020/03/01", "2020/04/01", "2020/05/01")
FECHA_NACIMIENTO <- c("1989.01.01", "1980.02.01", "1900.03.01", "2001.04.01", "1970.05.01")

#Transformando los vectores a Fechas (Date)
FECHA_REGISTRO <- as.Date(FECHA_REGISTRO)
FECHA_NACIMIENTO <- as.Date(FECHA_NACIMIENTO, format = "%Y.%m.%d")

ENTIDAD <- c("COLIMA", "AGUASCALIENTES", "CIUDAD DE MEXICO", "MEXICO", "DURANGO")
CASOS <- c(560,941,782,360,898)
SEXO <- c("HOMBRES", "HOMBRES","HOMBRES","HOMBRES","HOMBRES")

#Construimos el dataframe con datos de hombres
HOMBRES <- data.frame(FECHA_REGISTRO, FECHA_NACIMIENTO, ENTIDAD, CASOS, SEXO )

#Unimos los DataFrames
# rbind Sirve para mezclar tablas o dataframes con la misma cantidad de variables
PACIENTES <- rbind(HOMBRES, MUJERES)

#Transformar la variable SEXO a Factor para categorizar
PACIENTES$SEXO <- factor(PACIENTES$SEXO, levels = c("HOMBRES", "MUJERES"))



library(tidyverse)

ggplot(data = PACIENTES)+
  geom_line(mapping = aes(x=FECHA_REGISTRO, y= CASOS, color = SEXO ))





