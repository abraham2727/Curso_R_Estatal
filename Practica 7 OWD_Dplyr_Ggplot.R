###############################################################################
#################### PRACTICA 7 DPLYER Y GGPLOT 2 #############################
# Descripción : 
# Autor: Alan García Zambrano 
##############################################################################
library(tidyverse)

#PASO 1
# CARGAMOS EL DATASET DE OWD COVID
OWD <- read.csv(file = "https://covid.ourworldindata.org/data/owid-covid-data.csv", encoding = "UTF-8") 

#CARGAMOS EL DATASET DE LAS POBLACIONES 
poblaciones <- read.csv("https://raw.githubusercontent.com/AllanZamb/Curso_R_Estatal/main/Poblaciones_Paises_2022.csv", encoding = "UTF-8")

#PASO 2 
OWD_filtro <- OWD %>% 
  select(Fecha = date , Pais_ing = location, Clave =iso_code, Nuevos_Casos_Millon = new_cases_smoothed_per_million) %>% 
  mutate(Fecha = as.Date(Fecha)) %>% 
  
  #filter(Pais_ing == "Mexico" %>%  #Casos Individuales
  filter(Pais_ing %in% c("Mexico" , "South Africa" , "United States") ) %>% 
  arrange(desc(Nuevos_Casos_Millon))
  

#PASO 3 MERGE (JOIN) DE INFORMACIÓN
OWD_Esp <- merge(OWD_filtro, poblaciones, by.x = "Clave", by.y = "iso3" ) %>% 
  select(-Codigo_telefono, -Continente, -iso2, -Clave)

#PASO 4 CREAMOS UN GRÁFICO COMBINADO
ggplot(OWD_Esp)+
  geom_line(aes(x = Fecha, y = Nuevos_Casos_Millon, color = Pais_esp), 
            size = .8)+
  geom_bar(aes(x =Fecha, y= Nuevos_Casos_Millon, fill = Pais_esp), 
           stat = "identity", position = "dodge", alpha = 0.2 )
  


  





