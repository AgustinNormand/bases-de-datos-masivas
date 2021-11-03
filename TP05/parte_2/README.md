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

Podría tratarse de K=3 o K=4, coincidiendo con el analisis realizado de forma empirica.

![grafico_elbow_extendido](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP05/parte_2/imagenes/consigna4/consigna_b_grafico_extendido.png)



##### c. ¿Cuáles  son  las  características  más  distintivas  de  cada  uno  de  los cluters resultantes? 