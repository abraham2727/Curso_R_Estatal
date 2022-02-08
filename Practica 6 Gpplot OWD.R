################################################################################
############### PRACTICA 6 DPLYR Y GGPLOT ######################################
################################################################################

#Cargar librerías
library(tidyverse)

# Cargamos el dataset de OWD (actualizado) 
OWD <- read.csv("https://covid.ourworldindata.org/data/owid-covid-data.csv", encoding = "UTF-8")

#Para obtener el PIPE, utilizamos la combinación de teclas  
#ctr + shift + m
# cmd + shift + m

#Creando un nuevo Dataset con un rango de fechas y tres columnas
OWD_filtro <- OWD %>% 
  select(Fecha=date, Continente=continent, Nuevos_casos_millon = new_cases_smoothed_per_million) %>% 
  filter(Fecha >= "2021-12-01" & Fecha <= "2022-02-05") %>% 
  mutate(Fecha = as.Date(Fecha)) %>% 
  
  group_by(Fecha, Continente) %>% 
  summarise(Nuevos_casos_millon = mean(Nuevos_casos_millon, na.rm = TRUE))





ggplot(data = OWD_filtro)+
  geom_line(mapping = aes(x = Fecha, y = Nuevos_casos_millon, color = Continente))
  