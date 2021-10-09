## TP04 - Herramientas para en Análisis de Información
## Agustín normand
#### 9 Octubre 2021

#### Introducción:

En  esta  actividad  se  avanza  sobre  el  análisis de  la  información  almacenada en  Bases de Datos Masivas. Para ello, se utilizarán herramientas de la suite Pentaho (Reporting, SAIKU y Dashboards) con el objetivo de analizar la información generada en los Trabajos Prácticos sobre ETL y diseño de Data Warehouse. 

#### 1. A partir de la DB Medios, genere los siguientes reportes con la herramienta Pentaho Reporting:
##### a. Reporte con todos los medios gráficos.

Archivo correspondiente en el path "ejercicio_1/ejercicio_a" con el nombre "reporte.pdf"

O en el [repositorio](https://github.com/AgustinNormand/bases-de-datos-masivas/blob/main/TP04/ejercicio_1/ejercicio_a/reporte.pdf)

Gráfico resultante 

![grafico_ejercicio_a](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP04/ejercicio_1/ejercicio_a/grafico.png)

##### b. Reporte con todos los medios gráficos de la provincia de Córdoba. 

Archivo correspondiente en el path "ejercicio_1/ejercicio_b" con el nombre "reporte.pdf"

O en el [repositorio](https://github.com/AgustinNormand/bases-de-datos-masivas/blob/main/TP04/ejercicio_1/ejercicio_b/reporte.pdf)

Gráfico resultante 

![grafico_ejercicio_b](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP04/ejercicio_1/ejercicio_b/grafico.png)

##### c. Reporte  con  los  datos  de  los  medios  que  comiencen  con  la  letra ‘M’.

Archivo correspondiente en el path "ejercicio_1/ejercicio_c" con el nombre "reporte.pdf"

O en el [repositorio](https://github.com/AgustinNormand/bases-de-datos-masivas/blob/main/TP04/ejercicio_1/ejercicio_c/reporte.pdf)

Gráfico resultante 

![grafico_ejercicio_c](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP04/ejercicio_1/ejercicio_c/grafico.png)

#### 2. Ahora, inicie SAIKU y a partir del cubo Medios, genere y exporte a PDF la siguiente información:

Para realizar este ejercicio fué necesario modificar el esquema del cubo de Medios, pasando a un esquema de estrella y no de copo de nieve.

Se eliminó la normalizacion entre Ciudades y Provincias, y se pasó la foreign key de Provincias a la tabla de Medios.

Se modificaron las Transformaciones de Mondrian y se realizó nuevamente la migración de datos.

Debido a que Saiku para habilitar el analisis del cubo, requería un esquema de estrella.

##### a. Cantidad  de  medios  de  la  provincia  de  Córdoba,  separados  por ciudad. 

Archivo correspondiente en el path "ejercicio_2/ejercicio_a" con el nombre "tabla.pdf"

O en el [repositorio](https://github.com/AgustinNormand/bases-de-datos-masivas/blob/main/TP04/ejercicio_2/ejercicio_a/tabla.pdf)

Gráfico resultante

![grafico_ejercicio_a](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP04/ejercicio_2/ejercicio_a/grafico.png)


##### b. Cantidad de medios por especialidad y provincia.

Archivo correspondiente en el path "ejercicio_2/ejercicio_b" con el nombre "tabla.pdf"

O en el [repositorio](https://github.com/AgustinNormand/bases-de-datos-masivas/blob/main/TP04/ejercicio_2/ejercicio_b/tabla.pdf)

Gráfico resultante

![grafico_ejercicio_b](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP04/ejercicio_2/ejercicio_b/grafico.png)

##### c. Ranking de las 10 provincias con mayor cantidad de medios.

Archivo correspondiente en el path "ejercicio_2/ejercicio_c" con el nombre "tabla.pdf"

O en el [repositorio](https://github.com/AgustinNormand/bases-de-datos-masivas/blob/main/TP04/ejercicio_2/ejercicio_c/tabla.pdf)

Gráfico resultante

![grafico_ejercicio_c](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP04/ejercicio_2/ejercicio_c/grafico.png)

##### d. Exportar a .csv los datos de los medios gráficos de la provincia de Buenos Aires.

Archivo correspondiente en el path "ejercicio_2/ejercicio_d" con el nombre "medios_buenos_aires.csv"

#### 3.Elija  uno  de  los  cubos  trabajados  en  el  Trabajo  Práctico  sobre  Data Warehouse y defina cinco indicadores para el mismo. Luego genere, con la herramienta Pentaho Dashboards, el tablero de comando que permita monitorear esos indicadores. 