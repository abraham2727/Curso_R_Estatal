###############################################################################
################## PRACTICA 5: LECTURA Y ESCRITURA DE DOCUMENTOS CSV ###########
# Descripción: Cargamos, escribimos y leemos documentos csv
# Autor: Alan García Zambrano 
################################################################################

# PASO 1: GUARDAR EL DATAFRAME EN UN DOCUMENTO CSV  
write.csv(PACIENTES, "pacientes.csv", row.names = FALSE )

# PASO 2: LECTURA Y ALMACENAMIENTO DE DOCUMENTO CSV
PACIENTES <- read.csv("pacientes.csv", stringsAsFactors = TRUE) 

PACIENTES$FECHA_REGISTRO <- as.Date(PACIENTES$FECHA_REGISTRO, format = "%Y-%m-%d")
PACIENTES$FECHA_NACIMIENTO <- as.Date(PACIENTES$FECHA_NACIMIENTO, format = "%Y-%m-%d")

library(tidyverse)

ggplot(data = PACIENTES)+
  geom_bar(aes(x=FECHA_REGISTRO, y=CASOS, fill = SEXO), stat = "identity", position = "dodge")+
  
  #CAMBIAR COLORES
  scale_fill_manual(values = c("MUJERES" = "orange", "HOMBRES" = "black"))+
  
  #ETIQUETAS DEL GRÁFICO
  labs(title = "Distribución de casos en Hombres y Mujeres por fecha de registro",
       subtitle = "¿Qué mes de 2020 fue el peor para los hombres?",
       y = "Casos de COVID-19", 
       x = "Fecha de Registro 2020", 
       fill = "Género", caption = "Fuente: Curso de Introducción a R y visualización de datos")+
  
  #CAMBIAMOS DE TEMA
  theme_minimal()
