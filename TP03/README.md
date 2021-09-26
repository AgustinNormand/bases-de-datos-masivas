## TP03 - Modelado de datos y arquitectura de Data Warehouse
## Agustín normand
#### 24 Septiembre 2021

#### 1. Se  cuenta  con  el  siguiente  Diagrama  Entidad-Relación  que  representa  un esquema reducido de la Base de datos transaccional de una Universidad: 
![diagrama_universidad](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP03/ejercicio_1/DiagramaUniversidad.png)

##### Utilizando una herramienta gráfica de diseño, como por ejemplo DIA, genere el  modelo  conceptual  y  modelo  conceptual  ampliado  del  DW  que  permita contestar las siguientes preguntas: 
##### a. ¿Cuantos estudiantes posee una Carrera C con año de ingreso A? 
##### b. ¿Cuántos estudiantes discriminados por sexo posee el Plan de Estudios P? 
##### c. ¿Cuántos  estudiantes en  la  condición  N posee la Carrera  C por  cada Plan de Estudios en una Sede determinada?


###### Modelo conceptual
![modelo_conceptual](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP03/ejercicio_1/imagenes/ModeloConceptual.png)


###### Modelo conceptual ampliado
![modelo_conceptual_ampliado](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP03/ejercicio_1/imagenes/ModeloConceptualAmpliado.png)

#### 2. Ahora,  analice  la  Base  de  Datos  de  Rendimiento_Académico  del  “TP01 Definición de Procesos ETL”: 
##### a. Su diseño, ¿corresponde a alguno de los esquemas de DW estudiados en clase? ¿A cuál?

El diseño corresponde al esquema de *Estrella* estudiado en clase. Ya que tiene una única tabla de hecho, y dimensiones no normalizadas que la describen. Es decir, dimensiones que no tienen relación con otras dimensiones.

##### b. Realice una  reingeniería  y  define  el  Modelo  Conceptual  y  Modelo Conceptual ampliado que permita ese modelo físico. 

###### Modelo conceptual
![modelo_conceptual](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP03/ejercicio_2/imagenes/ModeloConceptual.png)

###### Modelo conceptual ampliado
![modelo_conceptual](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP03/ejercicio_2/imagenes/ModeloConceptualAmpliado.png)

##### c. Defina  un  modelo  lógico  alternativo  que  le  permita  migrar  a  otro  de los esquemas de DW estudiados en clase. 

###### Modelo conceptual (Copo de nieve)
![modelo_conceptual](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP03/ejercicio_2/imagenes/ModeloConceptual(Copo_de_nieve).png)

###### Modelo conceptual (Constelación)
![modelo_conceptual](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP03/ejercicio_2/imagenes/ModeloConceptual(Constelacion).png)

#### 3. Se cuenta con el siguiente Modelo Conceptual, el cual representa un esquema reducido de una Empresa que se dedica a la venta de artículos de librería por internet: 