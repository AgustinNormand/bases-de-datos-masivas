## TP05 - Minería de datos
## Parte 03 - Reglas de Asociación
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

**Todas las reglas resultantes**
![all_rules](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP05/parte_3/imagenes/all_rules.png)

Reglas resultantes considerando soporte minimo de 0.3

**Reglas con umbral 0.3**
![rules_minsup_03](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP05/parte_3/imagenes/rules_minsup_03.png)

#### c. ¿Cuál es el soporte de A? ¿Cómo es el soporte de AB, AC y ABC  con respecto al de A? ¿Por qué?

El soporte de A es 0,7. Y el soporte de AB, AC y ABC respecto de A son mas chicos.

Porque le suman nuevas condiciones al itemset,  le agregan que esté presente el item B, o el item C, o ambos items.

Y estos dos items, el B y el C, tienen soporte 0,05 y 0,06 respectivamente, por lo tanto podemos afirmar que el soporte de A junto con cualquiera de dichos items, va a ser menor al soporte de A.

#### d. ¿Cuáles son las reglas de asociación resultantes si establecemos una confianza mínima de 0,7?

La única regla de asociación resultante si establecemos una confianza mínima de 0,7 es A -> C.
![confident_rule](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP05/parte_3/imagenes/confident_rule.png)

### 2. Apriori. Incorpore  en  una  herramienta  de  data  mining  el  dataset  sobre  la cesta de compras y responda: 
#### a. ¿Qué  parámetros  puedo  modificar  previo  a  ejecutar  el  algoritmo sobre el dataset? ¿Qué permite cada uno? 

Los parametros que pude modificar previo a ejecutar el algoritmo sobre el dataset son
* Soporte minimo que debe tener un itemset para ser considerado frecuente (Support). Default 0.1
* Número minimo de items que debe tener un itemset para ser incluido en los resultados (Minlen). Default 1
* Número maximo de items que puede tener un itemset para ser incluido en los resultados (Maxlen). Default 10
* Tipo de resultados que debe generar el algoritmo: "frequent itemsets", "maximally frequent itemsets", "closed frequent itemsets", "rules" o "hyperedgesets". (Target)
* Confianza minima que debe tener una regla para ser incluida en los resultados (Confidence). Default 0.8
* Tiempo maximo que puede estar el algoritmo buscando subsets (Maxtime). Default 5 segs.


* Presencia de elementos (Appearance)

target vistos en clase: "frequent itemsets", "maximally frequent itemsets", "closed frequent itemsets", "rules"


#### b. ¿Es  posible  ejecutar  el  algoritmo  apriori  con  el  dataset  tal  como  se encuentra? Realice las operaciones necesarias para permitirlo. 

Si, es posible.
Es necesario instalar la librería "arules".

``` r
install.packages("arules")
library(arules)
```

Luego incorporar el dataset "Groceries".
``` r
data("Groceries")
```

Y ejecutar el algorimo "apriori".
``` r
reglas <- apriori(Groceries, parameter = list(support=0.01, confidence=0.01, target = "rules"))
```

#### c. Ejecute  el  algoritmo  Apriori  sobre  los  datos  y  detalle  cuáles  son  las mejores reglas encontradas. ¿Cómo determina cuales son las mejores? 

Las ordeno de forma descendente, por la columna "lift".

``` r 
inspect(head(sort(reglas, by="lift", decreasing = TRUE),10))
```

**Top 10 reglas**
![best_rules](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP05/parte_3/imagenes/best_rules.png)

#### d. ¿Qué nota al ejecutar el algoritmo con el dataset actual? ¿Cuál es la complejidad computacional del mismo? ¿Cómo puede resolverse? 

Al utilizar valores de soporte muy bajos, el tiempo de ejecución del algoritmo es muy alto. Hay una demora para obtener los resultados.

Esto se debe a que la complejidad computacional del algoritmo es exponencial O(2^N). Siendo N la cantidad de transacciones.

Si bien Apriori intenta reducir la complejidad computacional podando el numero de items candidatos. Utilizando el principio de antimonotnoía del soporte, el cual sostiene que si un itemset es frecuente, todos los subsets tambien deben serlo.

Podemos evitar los tiempos largos de ejecución definiendo umbrales altos para el soporte y la confianza, lo cual generará menos itemsets frecuentes, lo que resultará en menos iteraciones a lo largo de todo el dataset.

#### e. Si  tuviera  que  analizar  los resultados desde  el  punto de  vista de  un analista  especializado  en  marketing,  ¿Cuáles  son  las  asociaciones encontradas  que  le  parecen  más  interesantes?  ¿Qué  políticas  podría implementar a partir de estas? 

Hay muchas reglas que son intuitivas, o poco novedosas. Es bastante comun que se compre carne junto con vegetales, o que además de frutas, las personas compren tambien vegetales, o distintas combinaciones de lacteos.

* {Hortalizas de raíz, figacitas} => {"otros" vegetales}
Podría poner una mini gondola cerca de los vegetales con este tipo de panes, me pareció lo más novedoso, en estas primeras reglas de asociación.

Dado que hay muchas reglas, muy marcadas, pero que resultan intuitivas, verificaría estar aprovechandolas.
Por ejemplo, armaría packs de productos comunes, Leche Entera, Yogurt y Ricota. Canasta de frutas con crema chantillí.
Además, verificaría de estar ubicando cerca productos que es muy obvio que se venden juntos. 

#### f. Explore  alguna  visualización  para  el  análisis  de  reglas  generadas, explique brevemente. 

Para generar un scatterplot en R, ejecutamos:
``` r
data("Groceries")
rules <- apriori(Groceries, parameter = list(support=0.01, confidence=0.01, target = "rules"))
plot(rules)
```

Resultando en el gráfico:

![scatter_rules](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP05/parte_3/imagenes/scatter_rules.png)

#### g. Utilizando el mismo punto de vista, ¿Cuáles son los ítems marcan la presencia de cerveza? ¿Encuentra una relación lógica en estas asociaciones?
#### h. ¿Qué  parámetros  ajustaría  a  efectos  de  modificar  la  cantidad  de cantidad  de  reglas  de  asociación  generadas?  ¿Qué  efecto  generan esos parámetros? Ejemplifique en función del dataset actual. 
#### i. Documente todas las actividades desarrolladas y exprese sus conclusiones en cada caso. 

### 3. Incorpore el dataset del  Banco de Portugal utilizado en el TP de árboles de decisión y realice las siguientes operaciones: 
#### a. Aplique  las  transformaciones  necesarias  a  efectos de poder  correr  el algoritmo apriori sobre el dataset. 
#### b. Ejecute el algoritmo apriori y explique los resultados más importantes. 
#### c. ¿Cuáles  son  las  asociaciones  más  importantes  para  determinar  si  el cliente aceptó o no el producto bancario? 
#### d. Compare  los  resultados  obtenidos  en  este  punto  con  respecto  a  los resultados obtenidos a través de la aplicación de árboles de decisión. 
#### e. Documente todas las actividades desarrolladas y exprese sus conclusiones en cada caso. 
