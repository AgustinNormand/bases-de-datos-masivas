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

###### Modelo lógico (Copo de nieve)
![modelo_logico](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP03/ejercicio_2/imagenes/ModeloLogico.png)

#### 3. Se cuenta con el siguiente Modelo Conceptual, el cual representa un esquema reducido de una Empresa que se dedica a la venta de artículos de librería por internet: 
![modelo_conceptual](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP03/ejercicio_3/Diagrama_Libreria.png)

La información de entidades que se obtuvo del área de IT son: 

*Clientes*: codigo_cliente, razon_social, CUIT, saldo_cuenta, condición.

*Productos*:  codigo_producto,  descripción,  categoría,  marca,  especificaciones, precio_unitario. 

*DetalleVentas*:  codigo_cliente,  codigo_producto,  dia,  mes,  anio,  cant_vendida, total_monto. 

Utilizando  una  herramienta  gráfica  de  diseño,  genere  el  Modelo  Conceptual Ampliado, Lógico y Físico del Data Warehouse.

###### Modelo conceptual ampliado (Estrella)
![modelo_conceptual_ampliado](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP03/ejercicio_3/imagenes/ModeloConceptualAmpliado.png)

###### Modelo lógico
![modelo_logico](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP03/ejercicio_3/imagenes/ModeloLogico.png)


#### 4. Se  hace  notar  que  la  estructura  de  la  Base  de  Datos  del  Punto  1  del  “TP01 Definición de Procesos ETL”  corresponde  a  uno  de  los  posibles  esquemas  de DW. ¿A cuál? ¿Por qué? 

* Medios(id, nombre, id_especialidad, id_tipo_medio, dirección, id_ciudad), 
* Especialidades(id, descripción), 
* Tipos_medio(id, descripción), 
* Ciudades(id, nombre, id_provincia). 
* Provincias(id, nombre). 

Corresponde al esquema de *Copo de nieve*, y a que hay una tabla que se encuentra normalizada. Es decir, hay una dimension que se explica mediante otra dimension.

Porque la tabla de *Ciudades*, tiene una *Foreign Key* a la tabla de *Provincias*, esto hace que el esquema corresponda a *Copo de nieve*.

#### 5. Implemente los cubos de los esquemas de los enunciados 2) y 4) a partir de la herramienta Mondrian Schema Workbench.

En la carpeta *ejercicio_4*, con el nombre de *schema_rendimiento_academico.xml* se encuentra el cubo implementado, del esquema enunciado en el punto 2.

###### Cubo de Rendimiento Academico
![cubo_esquema_2](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP03/ejercicio_4/imagenes/schema_rendimiento_academico.png)

Con respecto al siguiente item de este ejercicio, también en la carpeta *ejercicio_4*, con el nombre de *schema_medios.xml* se encuentra definido el cubo, del esquema enunciado en el punto 4.

###### Cubo de Medios
![cubo_esquema_4](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP03/ejercicio_4/imagenes/schema_medios.png)