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

Rojo: Cluster 0

Verde: Cluster 1

Azul: Cluster 2

![scatter](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP05/parte_2/imagenes/consigna4/scatter.png)

Si vemos el *area* y el *perimetro* se puede ver una correlacion entre estas variables, y que son significativas los clusters resultantes.
Como también, se puede ver una correlación menor en *long_kernel* y *ancho_kernel*.

Las superposiciones en los scatter, denota que evidentemente hay otra u otras variables que hacen que tales observaciones pertenezcan a un cluster o a otro.

Por lo tanto, las caracteristicas distintivas del cada uno de los clusters resultantes son *Area* y *Perimetro*, y en menor medida, *Ancho Kernel* y *Long Kernel*.


#### 5. Ahora, trabaje sobre el dataset abandono_cuantitativo.csv:

##### a. Escoja los features que a su entender permitan un mejor agrupamiento,  pre-procese  los  mismos  y  entrene  un  modelo  a  partir de K-Means. 



##### b. Analice  y  describa  las  características  más  salientes  de  cada  uno  de los grupos encontrados por el algoritmo. 

##### c. Encuentre  la  cantidad  de  grupos  que  logran  el  mejor  agrupamiento para  los  datos.  Justifique  la  elección  a  partir  de  métricas  y  gráficas de los conglomerados resultantes. 

##### d. Ahora  aplique  algún  algoritmo  jerárquico  a  efectos  de  agrupar  los datos. ¿Cuál nivel se corresponde con el agrupamiento realizado por k-medias en el punto 6) a)? 

##### e. ¿El  agrupamiento  jerárquico  permite  encontrar  una  mejor  forma  de agrupar los datos? Si fuera así, ¿Cuál es ese agrupamiento? 
