## TP05 - Minería de datos
## Parte 03 - Reglas de Asociación
## Agustín normand
#### 18 Noviembre 2021

#### Introducción:

En este trabajo se abordará el aprendizaje de reglas de asociación, las cuales permiten encontrar patrones de comportamiento dentro de un conjunto de datos. En particular, se trabajará con el algoritmo Apriori y los conceptos de soporte y confianza, relacionados a este algoritmo.
Para  ello,  se  utilizará  el  software  R1  con  el  objetivo  de  resolver  problemas  de  la disciplina,  los  cuales  son  una  combinación de ejercicios  clásicos  de  minería  de  datos complementados con ejercicios propuestos por el equipo docente.

#### Consignas:

1. Soporte & Confianza. Calcule el soporte y la confianza (cuando corresponda) de los itemsets del siguiente fragmento del dataset:

![tabla](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP05/parte_3/imagenes/tabla_consigna.png)

En función de la tabla anterior, realice las siguientes operaciones:

##### a. Calcule el soporte para todos los itemsets del dataset.

Cantidad de ocurrencias de cada itemset del dataset:

**Support Count (σ)**

![support_count](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP05/parte_3/imagenes/support_count.png)


Fracción de transacciones que contienen a un determinado itemset, evaluado para todos los itemset del dataset.

**Support (s)**

![support](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP05/parte_3/imagenes/support.png)

#### b. Arme  todas  las  reglas  resultantes  considerando  que  se  solicita  un soporte mínimo de 0,3.

Itemset frecuentes con umbral de minsup == 0.3

**Frequent Itemsets**

![frecuent_itemsets](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP05/parte_3/imagenes/frecuent_itemsets.png)

**Todas las reglas resultantes**

![all_rules](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP05/parte_3/imagenes/all_rules.png)

Reglas resultantes considerando soporte mínimo de 0.3

**Reglas con umbral 0.3**

![rules_minsup_03](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP05/parte_3/imagenes/rules_minsup_03.png)

#### c. ¿Cuál es el soporte de A? ¿Cómo es el soporte de AB, AC y ABC  con respecto al de A? ¿Por qué?

El soporte de A es 0,7. Y el soporte de AB, AC y ABC respecto de A son más chicos.

Porque le suman nuevas condiciones al itemset,  le agregan que esté presente el ítem B, o el ítem C, o ambos items.

Y estos dos ítems, el B y el C, tienen soporte 0,05 y 0,06 respectivamente, por lo tanto podemos afirmar que el soporte de A junto con cualquiera de dichos ítems, va a ser menor al soporte de A.

Además, por el principio Apriori, el support de un itemset nunca excede el support de sus subsets.


#### d. ¿Cuáles son las reglas de asociación resultantes si establecemos una confianza mínima de 0,7?

La única regla de asociación resultante si establecemos una confianza mínima de 0,7 es A -> C.

![confident_rule](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP05/parte_3/imagenes/confident_rule.png)

### 2. Apriori. Incorpore  en  una  herramienta  de  data  mining  el  dataset  sobre  la cesta de compras y responda:
#### a. ¿Qué  parámetros  puede  modificar  previo  a  ejecutar  el  algoritmo sobre el dataset? ¿Qué permite cada uno?

Los parámetros que puede modificar previo a ejecutar el algoritmo sobre el dataset son
* Soporte mínimo que debe tener un itemset para ser considerado frecuente (Support). Default 0.1
* Número mínimo de ítems que debe tener un itemset para ser incluido en los resultados (Minlen). Default 1
* Número máximo de items que puede tener un itemset para ser incluido en los resultados (Maxlen). Default 10
* Tipo de resultados que debe generar el algoritmo: "frequent itemsets", "maximally frequent itemsets", "closed frequent itemsets", "rules" o "hyperedgesets". (Target)
* Confianza mínima que debe tener una regla para ser incluida en los resultados (Confidence). Default 0.8
* Tiempo máximo que puede estar el algoritmo buscando subsets (Maxtime). Default 5 segs.


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

Y ejecutar el algoritmo "apriori".
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

Si bien Apriori intenta reducir la complejidad computacional podando el número de ítems candidatos. Utilizando el principio de antimonotonia del soporte, el cual sostiene que si un itemset es frecuente, todos los subsets también deben serlo.

Podemos evitar los tiempos largos de ejecución definiendo umbrales altos para el soporte y la confianza, lo cual generará menos itemsets frecuentes, lo que resultará en menos iteraciones a lo largo de todo el dataset.

#### e. Si  tuviera  que  analizar  los resultados desde  el  punto de  vista de  un analista  especializado  en  marketing,  ¿Cuáles  son  las  asociaciones encontradas  que  le  parecen  más  interesantes?  ¿Qué  políticas  podría implementar a partir de estas?

Hay muchas reglas que son intuitivas, o poco novedosas. Es bastante común que se compre carne junto con vegetales, o que además de frutas, las personas compren también vegetales, o distintas combinaciones de lácteos.

* {Hortalizas de raíz, figacitas} => {"otros" vegetales}
Podría poner una mini gondola cerca de los vegetales con este tipo de panes, me pareció lo más novedoso, en estas primeras reglas de asociación.

Dado que hay muchas reglas, muy marcadas, pero que resultan intuitivas, verificaría estar aprovechandolas.
Por ejemplo, armaría packs de productos comunes, Leche Entera, Yogurt y Ricota. Canasta de frutas con crema chantilly.
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

Este gráfico contiene en el eje de las abscisas el soporte de la regla, y en el eje de las ordenadas la confianza.
Luego, la tonalidad de rojo de cada punto, está asociada con el *lift* de la regla.
Por lo tanto, se trata de un gráfico de 3 dimensiones.

Por lo tanto, se puede ver que el soporte de las reglas es bajo, viendo la tonalidad de rojo de la mayoría de los puntos, podemos decir que el soporte promedio que tienen las reglas es de 0,2.
Lo cual tiene sentido ya que definimos un soporte mínimo de 0,1.

En cuanto al *lift*, con respecto al eje de las abscisas se puede ver que todas las reglas con un *lift* superior a 2.5, tienen un soporte menor que 0.05
Y la grán mayoría de reglas con lift mayor a 2.5, tienen un soporte menor a 0.025.

En cuanto al eje de las ordenadas, se puede ver que la mayor concentración de *lift* superiores a 2.5, tienen un valor de *confianza* que se encuentra entre 0.15 y 4.

Por último, en cuanto a la confianza, se puede observar que toma valores entre 0.05 y 0.6 mayormente, con una concentración más notoria en la sección inferior del intervalo.

Las reglas correspondientes al sector superior izquierdo del gráfico, son las que mostramos en el top 10 de reglas, en puntos anteriores.

#### g. Utilizando el mismo punto de vista, ¿Cuáles son los ítems marcan la presencia de cerveza? ¿Encuentra una relación lógica en estas asociaciones?

Ejecutando el siguiente código para encontrar las reglas que contienen *cerveza* como consecuente:

``` r
reglas_beer <- apriori(Groceries, parameter = list(support=0.01, confidence=0.01, target = "rules"), appearance = list(rhs="bottled beer"))
inspect(head(sort(reglas_beer, by="lift", decreasing = TRUE),10))
```

Obtenemos

![beer_rules](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP05/parte_3/imagenes/beer_rules.png)

De las cuales, las únicas con un valor de *lift* aceptable es:
{Agua Embotellada} => {Cerveza Embotellada}
{Soda} => {Cerveza Embotellada}

La cual tiene una relación lógica, todas son bebidas, solo una de ellas con alcohol y las otras 2 no, se trata de una compra común.

#### h. ¿Qué  parámetros  ajustaría  a  efectos  de  modificar  la  cantidad  de cantidad  de  reglas  de  asociación  generadas?  ¿Qué  efecto  generan esos parámetros? Ejemplifique en función del dataset actual.

Para aumentar la cantidad de reglas de asociación generadas, ajustaría el parámetro de umbral de soporte.
De esta manera, pasándolo de 0.01 a 0.0001
Obtenemos 10 reglas, muy novedosas.

{Pollo congelado, Bolsas} => {Cerveza}
{Whisky, Chocolate} => {Cerveza}
{Papas Fritas, Vino} => {Cerveza}
{Mermelada, Vino} => {Cerveza}
{Vino, Platos} => {Cerveza}

### 3. Incorpore el dataset del  Banco de Portugal utilizado en el TP de árboles de decisión y realice las siguientes operaciones:
#### a. Aplique  las  transformaciones  necesarias  a  efectos de poder  correr  el algoritmo apriori sobre el dataset.

Atributos del dataset
* Age
* Job
* Marital
* Education
* Default
* Balance
* Housing
* Loan
* Contact
* Day
* Month
* Duration
* Campain
* Pdays
* Previous
* Poutcome
* y

Sobre estos, se harán las siguientes transformaciones:

Discretizar en intervalos:
* Joven: Hasta 26 años
* Adulto: Entre 26 y 40
* Adulto-Mayor: Entre 40 y 60
* Vejez: Más de 60

Default, Housing, Loan:
* Pasar a valores "Yes", "No".

Day:
* 4 intervalos, uno por cada semana del mes.

Duration:
* 3 bins, "Corta", "Regular" y "Larga" por igual frecuencia.

Campain:
* Única: 1
* De 2 a 24: Varias
* Más de 25: Muchas

Pdays:
* Nunca: -1
* Rapidamente: 0 a 59
* Lentamente: 60 a 119
* Extremadamente lento: Más de 120

Previous:
* De -1 a 0: Nunca
* De 1 a 19: Pocas
* De 20 a 49: Varias
* Más de 50: Muchas

Balance:
* Negativo: Menor a 0
* Muy bajo: Entre 1 y 99
* Bajo: Entre 100 y 249
* Regular: Entre 250 y 1199
* Alto: Entre 1200 y 2499
* Muy alto: Más que 2500

#### b. Ejecute el algoritmo apriori y explique los resultados más importantes.

Ejecutando varias veces el algoritmo apriori, con diferentes combinaciones de parámetros, se encontraron las siguientes reglas:

* {contact=cellular, previous=pocas, y=no}=>{pdays=extremadamente_lento}

Al cliente que se lo contactó por celular, pocas veces, y rechazó el préstamo, se lo vuelve a llamar posteriormente, luego de mucho tiempo.

* {job=retired, default=no, housing=no, loan=no, campaign=unica}=> {age=vejez}                                                       

Los retirados del trabajo, son personas mayores a 60 años. Es una regla de asociación obvia, pero sirve para verificar que el preprocesamiento del dataset fue correcto, y está encontrando reglas válidas.

* {age=adulto-mayor, marital=married, balance=negativo, housing=no, contact=cellular}  => {default=yes}

Los adultos mayores, casados, con balance negativo, están en default.

* {education=primary} => {job=housemaid} y {education=primary} => {job=blue-collar} y {education=primary} => {job=retired} y {education=primary} => {age=vejez} y {education=primary} => {contact=telephone}

Las personas con estudios primarios, son obreros, mucamas o retirados del trabajo, o gente mayor, que además se contacta por teléfono de linea.

* {education=tertiary} => {job=management} y {education=tertiary} => {job=self-employed} y {education=tertiary} => {job=entrepreneur}

Las personas con estudios terciarios trabajan en gerencia o son independientes o emprendedores.

* {education=secondary} => {job=services} y {education=secondary} => {job=admin.} y {education=secondary} => {job=technician} y {education=secondary} => {age=joven}

Las personas con estudios secundarios son jóvenes que trabajan en servicios o administración o son técnicos.

* {marital=divorced} => {age=adulto-mayor}

Los divorciados son personas de más de 60 años.

#### c. ¿Cuáles  son  las  asociaciones  más  importantes  para  determinar  si  el cliente aceptó o no el producto bancario?

* {duration=[258,4.92e+03], previous=pocas, poutcome=success}=>{y=yes}

Cuando la llamada dura mucho tiempo, incluso habiendo tenido pocos contactos previos a la campaña, las personas toman el préstamo.

* {balance=negativo, month=may, duration=[0,126)} => {y=no}

Cuando la llamada dura muy poco tiempo, las personas no toman el préstamo. Aunque esta regla posee un valor de lift bastante bajo.
Es lógico pensar que ante una llamada, uno corta enseguida cuando no está interesado.

Para determinar cuando las personas no toman el préstamo, se encuentran reglas de asociación con valores de lift muy bajos. Esto podría deberse a que la mayoría de las observaciones resultan en no contratar el producto, por lo que la asociación con otras variables es difícil.


#### d. Compare  los  resultados  obtenidos  en  este  punto  con  respecto  a  los resultados obtenidos a través de la aplicación de árboles de decisión.

Comparando los resultados obtenidos en este punto, respecto a los obtenidos con el árbol de decisión, coinciden en que la duración de la llamada es un atributo muy importante para determinar si el cliente accederá o no al plazo fijo.

Si es una duración larga, toma el plazo fijo, y de lo contrario, no.

Sin embargo con las reglas de asociación se ve de forma más clara que también es importante para decidir:
* Si se ha contactado varias veces al cliente durante esta campaña de marketing, no toma el plazo fijo.

* Si la campaña de marketing anterior fue exitosa con el cliente, acepta el plazo fijo.
* Si anteriormente nunca solicitó un plazo fijo, es probable que lo acepte.


