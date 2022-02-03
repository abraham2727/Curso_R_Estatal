##################################################################
###############  PRACTICA 3 VECTORES DE DATOS #######################
##################################################################
# Descripción: Un vector sirve para almacenar una colección del mismo tipo de datos
# Autor:  Alan García Zambrano


#Vector de Tipo Numerico
vector_edades <- c(1L,20L,50L,30L,89L)

#Acceder al vector
vector_edades[5:11]
vector_edades[8:10]

vector_edades[c(1,7,9)]

#Vector de Tipo Caracter
vector_nombres <- c("Alan", 
                    'Agustin', 
                    "Sofía", 
                    "Pedro", 
                    "Angela") 

#Vector de Tipo Character (Fechas)
vector_fechas <- as.Date(c("2020/01/22"),  "1989/01/02",  "1990/11/01","1990/01/01", "1890/12/01")

vector_fechas <- as.Date(vector_fechas)

#Vector de Peso
vector_peso <- c(70.8, 89.8, 75.2, 56.1, 63.5)

#Vector de Resultados
vector_resultado <- c(T,F,T,T,F)

# Creamos nuestro DataFrame
pacientes <- data.frame(vector_fechas, 
                        vector_nombres, 
                        vector_edades, 
                        vector_peso, 
                        vector_resultado)




