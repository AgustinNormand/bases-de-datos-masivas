## TP05 - Minería de datos
## Parte 03 - Clustering (K-Medias y algoritmos jerárquicos)
## Agustín normand
#### 18 Noviembre 2021

#### Introducción:

En este trabajo se abordará el aprendizaje de reglas de asociación, las cuales permiten encontrar patrones de comportamiento dentro de un conjunto de datos. En particular, se trabajará con el algoritmo Apriori y los conceptos de soporte y confianza, relacionados a este algoritmo. 
Para  ello,  se  utilizará  el  software  R1  con  el  objetivo  de  resolver  problemas  de  la disciplina,  los  cuales  son  una  combinación  ejercicios  clásicos  de  minería  de  datos complementados con ejercicios propuestos por el equipo docente.

#### Consignas:

1. Soporte & Confianza. Calcule el soporte y la confianza (cuando corresponda) de los ítemsets del siguiente fragmento del dataset: 

![tabla](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP05/parte_3/imagenes/tabla_consigna.png)

En función de la tabla anterior, realice las siguientes operaciones: 

##### a. Calcule el soporte para todos los ítemsets del dataset. 

Cantidad de ocurrencias de cada itemset del dataset:

**Support Count (σ)**
![support_count](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP05/parte_3/imagenes/support_count.png)


Fraccion de transacciones que contienen a un determinado itemset, evaluado para todos los itemset del dataset.

**Support (s)**
![support](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP05/parte_3/imagenes/support.png)

#### b. Arme  todas  las  reglas  resultantes  considerando  que  se  solicita  un soporte mínimo de 0,3. 

Itemset frecuentes con umbral de minsup == 0.3

**Frecuent Itemsets**
![frecuent_itemsets](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP05/parte_3/imagenes/frecuent_itemsets.png)

Todas las reglas resultantes
![all_rules](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP05/parte_3/imagenes/all_rules.png)

Reglas resultantes considerando soporte minimo de 0.3
Todas las reglas resultantes
![rules_minsup_03](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP05/parte_3/imagenes/rules_minsup_03.png)

