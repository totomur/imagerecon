#Lectura de la base
setwd("/home/tomas/Documentos/ITBA/Especializacion - Master/Técnicas y Algoritmos de Aprendizaje Automático/Tp 1/optical+recognition+of+handwritten+digits")
base = read.table ("optdigits.tra",sep=",")

#Veo como son las variables
head(base,1)
#Para mejor entendimiento uso View
View(base)

#Cantidad de resitros y variables
dim(base) # 3823 y 65, siendo V65 el numero que se esta dibujando en ese registro


#Plot del registro 14

library(jpeg)

vector=base[14,] #tomamos la fila 14 por separado
vector #visualizamos que la fila sigue siendo un data.frame con títulos de columnas
#visualice en la columna V65 qué número se va a dibujar
vector=vector[-65] #sacamos la columna V65 (variable a predecir – valor 5)
vector=as.numeric(vector) #transformamos el data.frame a vector numérico
vector #visualizamos que la fila ahora es un vector sin títulos de columnas
vector=vector/16 #transformamos los valores de (1:16) a (0:1)
vector
imagen=array(vector,dim=c(8,8)) #creamos la imagen de 8x8
imagen=t(imagen) #rotamos la imagen
plot(as.raster(imagen))

#Invierto los colores (normalizados)
vector_invertido = 1 - vector
imagen_invertida = array(vector_invertido , dim = c(8,8))
imagen_invertida = t(imagen_invertida)
plot(as.raster(imagen_invertida))

#Pruebo con otro registro
vector_2 = base [53,]
vector #visualizamos que la fila sigue siendo un data.frame con títulos de columnas
vector_2 = vector_2[-65]
vector_2 = as.numeric(vector_2)
vector_2
vector_2 = vector_2 /16 #transformamos los valores de (1:16) a (0:1)
imagen_2 = array(vector_2,dim=c(8,8)) #creamos la imagen de 8x8
imagen_2 = t(imagen_2)
plot(as.raster(imagen_2))


#Preprocesing

for (i in 1:64){
    var=paste("V",i,sep="")
    nuevo=paste("Pixel",i,sep="")
    names(base)[names(base)==var]=nuevo
    }

#Rewnombro V65 como numero y factorizo
names(base)[names(base)=="V65"]="Numero"
base$Numero = as.factor(base$Numero)

head(base,1)

