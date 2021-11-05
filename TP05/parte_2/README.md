## TP05 - Minería de datos
## Parte 02 - Clustering (K-Medias y algoritmos jerárquicos)
## Agustín normand
#### 1 Noviembre 2021

#### Introducción:

En  este  trabajo  se  abordarán  los  algoritmos  de  agrupamiento  o  clustering  y  las medidas de distancia asociadas a efectos de determinar la similitud de los datos. 
En  primer  lugar,  se  trabajará  con  algunas  de  las  medidas  de  distancia  clásicas  para variables numéricas como la euclídea, Manhattan y la distancia de Minkowski y otras medidas relacionadas a calcular distancias en variables binarias y categóricas. 
Luego,  se  utilizará  el  lenguaje  Python  con  el  paquete  Scikit-Learn  con  el  objetivo  de resolver problemas de  la  disciplina,  los  cuales son  una combinación  ejercicios  clásicos de minería de datos complementados con ejercicios propuestos por el equipo docente. 


#### 1. Medidas  de  distancia.  Calcule  la  distancia  entre  los  siguientes  puntos  y  el centroide  (2,  4)  utilizando  las  medidas:  euclídea,  Manhattan  y  Minkowski (con p = 3): 

![tabla](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP05/parte_2/imagenes/tabla_consigna_1.png)

¿Encuentra diferencias relativas entre las diferentes métricas utilizadas y el resultado  obtenido?  Explique  el  comportamiento  de  cada  una  utilizando gráficas.

![medidas](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP05/parte_2/imagenes/medidas_consigna_1.png)

Como se puede observar, los resultados varían, pero sin embargo, la distancia minima y maxima, siguen siendo las mismas.
La diferencia en los resultados se explica porque la distancia *Eculídea* mide en linea recta la distancia, de la siguiente manera:

![euclidea](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP05/parte_2/imagenes/euclidea_consigna_1.png)

Sin embargo, cuando utilizo distancia de *Manhattan*, tomo la distancia en lineas verticales u horizontales, resultando en:

![manhattan](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP05/parte_2/imagenes/manhattan_consigna_1.png)

Mientras tanto, Minkowski es la generalizacion de las dos mencionadas anteriormente. 
En este caso el valor P es de 3.
Si fuera de 1, se trataría de la distancia de *Manhattan*, si fuera de 2, sería la distancia *Euclideana*, y siendo 3, reduce mas que la *Euclidiana* las distancias. Es decir, a mayor eleccion del parametro P, la distancia se reduce.


#### 2. A  continuación,  calcule  la  distancia  entre  las  diferentes  variables  de  tipo categóricas con respecto a la instancia {1, lluvioso, templado, alta, fuerte}: 

![tabla](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP05/parte_2/imagenes/tabla_consigna_2.png)

#### ¿Cuáles son las instancias más cercanas a la instancia #1?

Aplicando las medidas correspondientes para variables categoricas, se logra la siguiente tabla:

![tabla](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP05/parte_2/imagenes/respuesta_consigna_2.png)

La instancia mas cercana a la #1 es la #10. Ya que los valores son los mismos. 
Seguido de la instancia numero #8, que coincide en 3 de los 4 valores.
Luego las numero #2, #4, #6, #7, coinciden en 2 de 4 valores.
Por otro lado, la correspondiente a #3 coincide en un único valor. 
Y por ultimo, las instancias #5 y #9, no coinciden en ningún valor.

#### 3. Ahora,  y  a  partir  de  los  datos  de  la  siguiente  tabla,  agrupe  los  datos  de acuerdo  al  algoritmo  k-medias  utilizando  la  medida  euclídea  y  con  los puntos A1, A2 y A7 como centroides iniciales. 

![tabla](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP05/parte_2/imagenes/tabla_consigna_3.png)

Luego de asignar de manera aleatoria cada observación a uno de los K clusters, obtengo el siguiente gráfico.
(Los centroides de cada cluster están distinguidos con un punto gris)

![paso_1](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP05/parte_2/imagenes/paso_1_consigna_3.png)

Calculando la distancia *Euclidiana* de cada uno de las observaciones, con respecto a los centroides, resaltados en *negrita*, se encuentran las menores distancias.

![distancia](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP05/parte_2/imagenes/distancia_centroides_consigna_3.png)

Luego de la asignar de los puntos al cluster mas cercano y recalcular los centroides, el gráfico queda de la siguiente manera:

![segunda_iteracion](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP05/parte_2/imagenes/segunda_iteracion_consigna_3.png)


Luego de calcular nuevamente la distancia *Euclidiana* a cada uno de los centroides, relizar la asignacion y recalcular los centroides, el grafico resultante es:

![tercera_iteracion](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP05/parte_2/imagenes/tercera_iteracion_consigna_3.png)

Por ultimo, la tabla final con las distancias *Euclidianas* y los clusters correspondientes a cada observacion:

![tabla_final](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP05/parte_2/imagenes/tabla_final_consigna_3.png)

#### 4. K-means. Se provee un dataset1 sobre las características internas del núcleo de tres clases de trigo diferentes. Cargue el dataset en una de las herramientas de minería de datos provistas y resuelva:

##### a. Utilice  el  algoritmo  k-medias  variando  la  cantidad  de  centroides  a efectos de agrupar los datos de la manera más eficiente. 

En primer lugar se realizó una prueba empirica, y detecté que el valor de cantidad de centroides, que agrupaba los datos de manera mas eficiente se encontraba entre 2 y 4, ya que al aumentar por encima de 4, se creaban clusters que no me parecian correctos.

A continuacion un gráfico con K=5:

![5_clusters](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP05/parte_2/imagenes/consigna4/consigna_a_5_cluster.png)

Se puede ver en la parte inferior dos clusters bastante juntos, poco marcados, podría tratarse de un exceso de clusters. Se utilizarán medidas para verificarlo.

##### b. ¿Cuál  es  la  cantidad  de  grupos  que  permite  un  mejor  agrupamiento de los datos? ¿Mediante cual métrica puede verificar esto? 

Una de las medidas que se utilizan es la suma de cuadrados, es decir, la suma de las diferencias entre los elementos del cluster con respecto al centroide.

Uno de los metodos para establecer cual es la cantidad de clusters que son optimos, es el metodo *Elbow*. El cual realiza muchos agrupamientos con diferentes valores de K y verificar donde la metrica de *suma de cuadrados* empieza a tener una variación muy baja.
El mejor K va a estar donde la metrica de Elbow no ofrezca cambios. Aunque se debe contemplar que si tenemos una cantidad excesiva de clusters, no es util ya que son dificiles de interpretar, de darles sentido.

![grafico_elbow](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP05/parte_2/imagenes/consigna4/consigna_b_grafico.png)

Observando este gráfico, podemos considerar los puntos donde la pendiente se asemeje a 0 y elegirlos como la mejor opción. 
Ya que cuanto más pronunciada es la pendiente, mayor error pierde el agrupamiento con ese numero de clusters.

Valores optimos podrían tratarse de K=3 o K=4, coincidiendo con el analisis realizado de forma empirica.

![grafico_elbow_extendido](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP05/parte_2/imagenes/consigna4/consigna_b_grafico_extendido.png)

Si bien se puede observar que en realidad la variabilidad entre un K y otro, tiende a ser baja, en valores superiores a 20, y muy baja en valores superiores a 40, quedan clusters muy ruidosos dificiles de interpretar.


Gráfico de agrupamiento con K=2

![2_clusters](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP05/parte_2/imagenes/consigna4/consigna_a_2_cluster.png)

Gráfico de agrupamiento con K=3

![3_clusters](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP05/parte_2/imagenes/consigna4/consigna_a_3_cluster.png)

Gráfico de agrupamiento con K=4

![4_clusters](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP05/parte_2/imagenes/consigna4/consigna_a_4_cluster.png)


##### c. ¿Cuáles  son  las  características  más  distintivas  de  cada  uno  de  los cluters resultantes? 

El grupo examinado comprendió granos pertenecientes a tres variedades diferentes de trigo: Kama, Rosa y Canadian, de 70 elementos cada uno, seleccionados al azar para el experimento.
Se detectó una visualizacion e alta calidad de la estructura interna del grano utilizando una técnica de rayos X suaves.
Los estudio se llevaron a cabo utilizando granes de trigo cosechados combinados procedentes de campos experimentales.

Los atributos son:
Area
Perimetro
Compacidad 4*pi*A/P^2
Longitud del grano
Ancho del grano
Coeficiente de asimetria
Longitud de la ranura del grano
Continuos con valores reales.

Para realizar un analisis exploratorio, usamos R.

Si calculamos la media el *area* agrupada por cada cluster

![area_mean](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP05/parte_2/imagenes/consigna4/area_mean.png)

Obtenemos valores que a simple vista se ven bastante variados entre si, se encuentra bien marcada la diferencia de cada cluster.

Para comprobar esto, si calculamos la varianza del *area* dentro de cada cluster

![area_var](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP05/parte_2/imagenes/consigna4/area_var.png)

Obtenemos valores bajos, quiere decir que se está cumpliendo el objetivo de minimizar la varianza de los elementos del cluster, por lo tanto, vamos a comprobar si se está maximizando la varianza entre los diferentes clusters.

![area_var_clusters](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP05/parte_2/imagenes/consigna4/area_var_clusters.png)

Efectivamente, los elementos de los diferentes clusters, son muy diferentes entre si.


Realizando un analisis similar a este, determinamos que pasaba lo mismo con el *perimetro*

Sin embargo, con *compact*, *long_kernel*, *ancho_kernel*, *coef_asimetrima*, *long_ranura* las medias agrupadas por cada cluster son valores muy similares, cuya varianza con respecto a los elementos del cluster es chica, pero con respecto a los diferentes clusters, tambien es chica. Por lo tanto, se trata de atributos que no aportan en definir el cluster.

Se puede observar como las cajas del *boxplot* de *area* y *perimetro* no se superponen.

![referencias](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP05/parte_2/imagenes/consigna4/referencias.png)

Area:

![area_boxplot](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP05/parte_2/imagenes/consigna4/boxplot/area_boxplot.png)

Perimetro: 

![perimetro_boxplot](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP05/parte_2/imagenes/consigna4/boxplot/perimetro_boxplot.png)


Y sin embargo, todos los demás, o se superponen, la gran mayoría, notablemente.

Ancho Kernel (Superposición baja, poca varianza escala 0.2):

![ancho_kernel_boxplot](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP05/parte_2/imagenes/consigna4/boxplot/ancho_kernel_boxplot.png)

Long Kernel:

![long_kernel_boxplot](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP05/parte_2/imagenes/consigna4/boxplot/long_kernel_boxplot.png)

Coef Asimetria:

![coef_asimetrima_boxplot](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP05/parte_2/imagenes/consigna4/boxplot/coef_asimetrima_boxplot.png)

Compact:

![compact_boxplot](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP05/parte_2/imagenes/consigna4/boxplot/compact_boxplot.png)

Long Ranura:

![long_ranura_boxplot](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP05/parte_2/imagenes/consigna4/boxplot/long_ranura_boxplot.png)


Por ultimo si vemos el Scatterplot, con cada uno de los puntos con un color que representa a su cluster


![referencias](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP05/parte_2/imagenes/consigna4/referencias.png)

![scatter](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP05/parte_2/imagenes/consigna4/scatter_plot.png)

Si vemos el *area* y el *perimetro* se puede ver una correlacion entre estas variables, y que son significativas los clusters resultantes.
Como también, se puede ver una correlación menor en *long_kernel* y *ancho_kernel*.

Las superposiciones en los scatter, denota que evidentemente hay otra u otras variables que hacen que tales observaciones pertenezcan a un cluster o a otro.

Por lo tanto, las caracteristicas distintivas del cada uno de los clusters resultantes son *Area* y *Perimetro*, y en menor medida, *Ancho Kernel* y *Long Kernel*.

Un ultimo analisis, el scatter, podríamos sacar las siguientes conclusiones, (que también fueron obtenidas de forma analitica)

* Los elementos del cluster 0 (verde), se distingue por tener el mayor area, perimetro, longitud del grano y ancho del grano.

* Los elementos del cluster 1 (azul), se distingue por tener el menor area, perimetro, longitud del grano y ancho del grano.

* Los elementos del cluster 2 (rojo), se distingue por tener un tamaño intermedio de area, perimetro, longitud del grano y ancho del grano.

Componentes Principales

![pca](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP05/parte_2/imagenes/consigna4/pca.png)

![autovectores](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP05/parte_2/imagenes/consigna4/autovectores.png)



#### 5. Ahora, trabaje sobre el dataset abandono_cuantitativo.csv:

##### a. Escoja los features que a su entender permitan un mejor agrupamiento,  pre-procese  los  mismos  y  entrene  un  modelo  a  partir de K-Means. 

Preprocesamiento:
* Numerizar con LabelEnconder *estado_civil*, *carrera*, *sede* y *estado*
* Eliminar los signos "-" de *promedio_1er_anio*.
* Imputar 8 valores faltantes en *promedio_1er_anio*.
* Eliminar *horas_trabajadas* superiores a 72hs
* Realizar un *scale* de los valores.

Analisis exploratorio:

Los atributos mas variados del dataset son *horas_trabajadas* y *carrera*.
* "Carrera" Varianza 135.72778315498857
* Horas_Trabajadas Varianza 331.26768517702567

Histogramas de cada uno de estos atributos

![hist_carreras](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP05/parte_2/imagenes/consigna5/hist_carreras.png)

![hist_horas_trabajadas](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP05/parte_2/imagenes/consigna5/hist_horas_trabajadas.png)

Si realizamos un agrupamiento mediante estos dos atributos, con un K variando de 1 a 5, el menor SSE obtenido es de 7464.88

Podría resultar aceptable un K = 3, determinado mediante el metodo de Elbow.

![elbow_2attr](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP05/parte_2/imagenes/consigna5/elbow_2attr.png)

Resultando en el gráfico:

![cluster_2attr](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP05/parte_2/imagenes/consigna5/cluster_2attr.png)

Pero analizando los resultados en R, se realizaba un agrupamiento unicamente utilizando las *horas_trabajadas* debido a su gran varianza, sin utilizar la *carrera*.

Dejando de lado el enfoque de analisis exploratorio, a mi entender, para explicar el abandono universitario, es necesario: Estado Civil, Carrera, Horas Trabajadas, Edad_ingreso y Estado.

Vemos que con 2 componentes principales se puede cubrir el 89% de la varianza

![PCA](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP05/parte_2/imagenes/consigna5/PCA.png)

De estas componentes, la primera corresponde con las features *edad_ingreso* y *horas_trabajadas*

Y la segunda con *estado*

![auto_vectores](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP05/parte_2/imagenes/consigna5/auto_vectores.png)

Grafico PCA

![grafico_pca](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP05/parte_2/imagenes/consigna5/grafico_PCA.png)

##### b. Analice  y  describa  las  características  más  salientes  de  cada  uno  de los grupos encontrados por el algoritmo. 

Estado Civil:

* El cluster 0 esta formado por mayormente (1096) casados.
* El cluster 1 esta formado por mayormente (3577) solteros.
* El cluster 2 esta formado por mayormente (7856) solteros.
* El cluster 3 esta formado por mayormente (3209) solteros.

Carrera:

Cluster 0
* (326)LICENCIATURA EN TRABAJO SOCIAL

Cluster 1
* (793)LICENCIATURA EN ADMINISTRACION  
* (591)CONTADOR PUBLICO
* (586)LICENCIATURA EN TRABAJO SOCIAL  
* (366)PROFESORADO EN EDUCACION FISICA

Cluster 2 
* (2513)CONTADOR PUBLICO
* (287)INGENIERIA AGRONOMICA
* (309)INGENIERIA EN ALIMENTOS
* (419)INGENIERIA INDUSTRIAL
* (155)LIC. EN CIENCIAS BIOLOGICAS
* (749)LIC. EN COMERCIO INTERNACIONAL

Cluster 3 
* (622) CONTADOR PUBLICO
* (578) LICENCIATURA EN ADMINISTRACION  
* (452) LICENCIATURA EN TRABAJO SOCIAL
* (375) PROFESORADO EN EDUCACION FISICA

Horas Trabajadas:

Cluster 0
* Media: 23.56horas
* Mediana: 40

Cluster 1 
* Media: 39.94horas
* Mediana: 24

Cluster 2 
* Media: 2.8horas
* Mediana: 0

Cluster 3
* Media: 5.88horas
* Mediana: 0


Edad Ingreso:

Cluster 0
* Media: 38

Cluster 1
* Media: 25

Cluster 2
* Media: 19

Cluster 3
* Media: 20


Estado:

Cluster 0
* (68) INHABILITADO
* (422) LIBRE
* (271) INHABILITADO
* (539) REGULAR

Cluster 1
* (169) INHABILITADO
* (1024) LIBRE
* (1010) INHABILITADO
* (1584) REGULAR

Cluster 2
* (2229) INHABILITADO
* (5734) REGULAR

Cluster 3
* (1112) INHABILITADO
* (2172) LIBRE

El algoritmo encontró un grupo de estudiantes de 20 años en promedio, de las carreras CONTADOR PUBLICO, LICENCIATURA EN ADMINISTRACION, LICENCIATURA EN TRABAJO SOCIAL y PROFESORADO EN EDUCACION FISICA, que son mayormente Solteros y trabajan en promedio 5 horas, que quedan en estado INHABILITADO o LIBRE.

##### c. Encuentre  la  cantidad  de  grupos  que  logran  el  mejor  agrupamiento para  los  datos.  Justifique  la  elección  a  partir  de  métricas  y  gráficas de los conglomerados resultantes. 

Viendo el gráfico de Elbow, se optó por un K=4, ya que equilibraba, una cantidad de clusters manejables, con una pendiente que comenzaba a estabilizarse levemente.

![elbow](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP05/parte_2/imagenes/consigna5/elbow.png)

##### d. Ahora  aplique  algún  algoritmo  jerárquico  a  efectos  de  agrupar  los datos. ¿Cuál nivel se corresponde con el agrupamiento realizado por k-medias en el punto 5) a)? 

Utilizando un algoritmo jerarquico con un linkage completo, utilizando un nivel de 2, se logran 4 clusters, lo cual corresponde con el agrupamiento realizado por k-medias en el punto 5)a).

![complete_linkage](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP05/parte_2/imagenes/consigna6/complete_linkage.png)

##### e. ¿El  agrupamiento  jerárquico  permite  encontrar  una  mejor  forma  de agrupar los datos? Si fuera así, ¿Cuál es ese agrupamiento? 

Permite una forma se ve mas robusta, que se aborda de manera mas simple, que es mediante el uso de un linkage completo, el cual se abordará en el siguiente punto.

Cabe destacar que se utilizó todo el dataset, preprocesado, y el algoritmo encontró grupos bien marcados, equilibrados.

En caso de k-medias, al utilizar todo el dataset, el algoritmo tenía un SSE muy alto, encontraba grupos superpuestos, ruidosos.


#### 6. Algoritmos jerárquicos. Incorpore en Colab nuevamente el dataset del punto 5 y realice las siguientes actividades: 
##### a. Realice el agrupamiento de los datos utilizando diferentes parámetros. 

Del punto anterior, el dataset se encuentra preprocesado de la siguiente manera:
* Numerizar con LabelEnconder *estado_civil*, *carrera*, *sede* y *estado*
* Eliminar los signos "-" de *promedio_1er_anio*.
* Imputar 8 valores faltantes en *promedio_1er_anio*.
* Eliminar *horas_trabajadas* superiores a 72hs
* Realizar un *scale* de los valores.

Se ajustaron los diferentes agrupamientos usando el parametro de Linkage o Distancia entre Clusters. Vemos la repercusión de este parametro en la forma que tiene el Dendrograma.

Agrupamiento utilizando *simple linkage*

![simple_linkage](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP05/parte_2/imagenes/consigna6/simple_linkage.png)

Vemos que es un dendrograma desalineado, sesgado hacia la izquierda.


Agrupamiento utilizando *average linkage*

![average_linkage](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP05/parte_2/imagenes/consigna6/average_linkage.png)

Se ve un arbol equilibrado y balanceado pero compacto en la parte superior, evaluado respecto  a las distancias, tiene mucha distancia al principio y luego compacto, lo cual dificulta la separación en diferentes clusters.


Agrupamiento utilizando *complete linkage*

![complete_linkage](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP05/parte_2/imagenes/consigna6/complete_linkage.png)

En este caso vemos un balance de las ramas, mas equilibrado que los anteriores. Brinda la posibilidad de ver de forma clara en que lugar realizar los cortes


Agrupamiento utilizando *centroid linkage*

![centroid_linkage](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP05/parte_2/imagenes/consigna6/centroid_linkage.png)

En el caso de linkage mediante *centroid* obtenemos como en el caso de linkage *simple* un dendrograma desalineado, sesgado.


##### b. Grafique  el  resultado  y  escoja  cual  es  el  nivel  que  mejor  agrupa  los datos.

Utilizando el *complete linkage*, que resultó ser el mas apropiado, el nivel que agrupa mejor los datos es 2. Que resulta en 4 clusters. Verde, Rojo, Celeste y Violeta.