###############################################################################
################## PRACTICA 8 ANÁLISIS DE INCIDENCIA DE CASOS DE COVID ########
# Autor: Alan Garcia Zambrano
###############################################################################
library(tidyverse)
library(plotly)

#PASO 1
#Cargamos la información desde la carpeta de descargas
file.choose()
COVID <- read.csv("C:\\Users\\alan2\\Downloads\\COVID19MEXICO (muestra).csv")

#Cargamos la información desde nuestra carpeta de trabajo
COVID <- read.csv("COVID19MEXICO (muestra).csv")

#PASO 2 ELEGIR UN VECTOR DE ENTIDADES PRIORITARIAS
entidades_prioritarias <- c("ZACATECAS", "COLIMA", "BAJA CALIFORNIA SUR", "CIUDAD DE MEXICO")

INCIDENCIA_COVID <- COVID %>%
  mutate(FECHA_SINTOMAS = as.Date(FECHA_SINTOMAS)) %>% 
  
  group_by(ENTIDAD_RES, FECHA_SINTOMAS, POBLACION) %>% 
  summarise(CASOS = n() ) %>% 
  mutate(INCIDENCIA = (CASOS / POBLACION)*100000) %>% 
  filter(ENTIDAD_RES %in% entidades_prioritarias ) %>% 
  filter(FECHA_SINTOMAS >= "2022-01-22" & FECHA_SINTOMAS <= "2022-02-05")
  

#PASO 3 ESTABLECEMOS LOS COLORES DE NUESTRO VECTOR
colores <- c("BAJA CALIFORNIA SUR" = "#084C61", 
             "CIUDAD DE MEXICO"= "#DB504A", 
             "COLIMA" = "#4F6D7A", 
             "ZACATECAS" = "#4F6D7A")

lineas_color <- c("BAJA CALIFORNIA SUR" = "dotted", 
                  "CIUDAD DE MEXICO"= "dotted", 
                  "COLIMA" = "solid", 
                  "ZACATECAS" = "dotted")

#ORDENAMOS LAS CATEGORIAS DE LOS ESTADOS
factor_entidades <- c("COLIMA", "CIUDAD DE MEXICO", "BAJA CALIFORNIA SUR","ZACATECAS" )


#PASO 3 ELABORAMOS EL GRÁFICO Y ALMACENAMOS EN UN OBJETO DE TIPO GGPLOT

ggplot(data = INCIDENCIA_COVID) +
  geom_line(aes(x = FECHA_SINTOMAS, y = INCIDENCIA, color = ENTIDAD_RES , linetype = ENTIDAD_RES ), size = 1.9) +
  scale_x_date(date_breaks = "2 day", date_labels = "%d-%b-%Y")+
  labs(title = "Incidencia de casos de COVID-19 en Entidades Prioritarias durante SE 4 y 5",
       subtitle = "¿Cuáles son las entidades con mayor atención durante los últimos 14 días?",
       caption = "Fuente: Datos Abiertos de la DGE * Se muestra el 10% de la información y casos positivos",
       y="Incidencia por cada 100,000 habitantes", 
       x = "Fecha de Registro" , 
       color = "Entidades Prioritarias",
       linetype = "Entidades Prioritarias"
       )+
  theme_light() +
  scale_color_manual(values = colores)+
  scale_linetype_manual(values = lineas_color)
  
#PODEMOS UTILIZAR LA LIBRERÍA GGPLOTLY PARA HACER EL GRÁFICO DINÁMICO
ggplotly(grafico_lineas)


Auxiliar<-INCIDENCIA_COVID %>% 
  group_by(ENTIDAD_RES, max(INCIDENCIA)) %>% 
  summarise(INCIDENCIA = sum(INCIDENCIA))


ggplot(data = INCIDENCIA_COVID)+
  geom_bar(aes(x = reorder(ENTIDAD_RES, -INCIDENCIA), y = INCIDENCIA, fill = ENTIDAD_RES ), stat = "identity")+
  #Esta parte nos faltó corregír
  geom_text(aes(x = ENTIDAD_RES, y= INCIDENCIA, label = INCIDENCIA  ))
      




 




