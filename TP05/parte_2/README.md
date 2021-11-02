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
Si fuera de 1, se trataría de la distancia de *Manhattan*, si fuera de 2, sería la distancia *Euclideana*, y siendo 3, se trata aproximadamente, del siguiente gráfico:

![minkowski](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP05/parte_2/imagenes/minkowski_consigna_1.png)

Minkowski, es una generalizacion de las dos formulas anteriores mediante el uso del parámetro P, a mayor eleccion de este, la distancia se reduce.

#### 2. A  continuación,  calcule  la  distancia  entre  las  diferentes  variables  de  tipo categóricas con respecto a la instancia {1, lluvioso, templado, alta, fuerte}: 

![tabla](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP05/parte_2/imagenes/tabla_consigna_2.png)

Aplicando las medidas correspondientes para variables categoricas, se logra la siguiente tabla:

![tabla](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP05/parte_2/imagenes/respuesta_consigna_2.png)