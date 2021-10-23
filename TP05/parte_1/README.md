## TP05 - Minería de datos
## Parte 01 - Arboles de decisión (J48)
## Agustín normand
#### 9 Octubre 2021

#### Introducción:

En este trabajo se implementa el primero de una serie de algoritmos que se presentarán durante la materia para realizar Minería de datos: los árboles de decisión J48. 
En  primer  lugar,  se  utilizarán  las  nociones  de  entropía  y  ganancia  de  información introducidas en clase a efectos de generar un árbol de decisión a partir de un dataset. 
Luego,  se  utilizará  el  lenguaje  Python,  puntualmente  la  librería  Scikit-Learn,  con  el objetivo  de resolver problemas  de la  disciplina, los cuales son una combinación ejercicios clásicos de minería de datos complementados con ejercicios propuestos por el equipo docente.

#### 1. A  partir  del  dataset  presentado  a  continuación,  y  teniendo  en  cuenta  las fórmulas de entropía y ganancia de información calcule y diagrame el árbol de decisión que le permita decidir si comer asado o no en función del clima: 

![tabla](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP05/parte_1/imagenes/ejercicio_1/tabla_ejercicio_1.png)

Primero calculo de la entropía de la clase (Asado).

![entropia_asado](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP05/parte_1/imagenes/ejercicio_1/entropia_asado.png)

El calculo consiste en:

-(0,64*log(0,64))-(0,35*log(0,35))

Es una medida de desorden. Si la entropia es 0, los datos se encuentran muy poco desordenados, es decir, son muy parecidos. En este caso, no aportan información.

Como la entropia de la clase es de 0.94, se puede afirmar que contiene datos desordenados, por lo tanto, posee mucha información.


Luego, realizo las tablas de doble entrada para calcular la ganancia de información. Para poder minimizar la profundidad del arbol, seleccionando el atributo optimo para dividir el nodo.
Este nodo será el que más reduzca la entropía.

![tablas_primer_nivel](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP05/parte_1/imagenes/ejercicio_1/tablas_primer_nivel.png)

Estas tablas brindan la información de, por ejemplo: Cuantas veces el *Pronostico* fue *Lluvioso* y se comió *asado* y cuantas *no* se comió *asado*.

De esta manera, se busca el atributo que mejor divida, es decir, que tenga mayor ganancia de información.

Luego de realizar las cuentas. Se observa que el atributo con mayor ganancia de información es el *Pronostico*. Esto se debe a que el valor *Nublado* divide de forma pura, los casos en los que se come asado.
Siempre que el pronostico fue *Nublado* se comio *asado*.

Por este motivo, hasta ahora el arbol queda de la siguiente manera:

![arbol_primer_iteracion](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP05/parte_1/imagenes/ejercicio_1/arbol_primer_iteracion.png)

Como *Soleado* y *Lluvioso* no dividen de forma pura los casos, se realiza el mismo procedimiento mencionado anteriormente para determinar los siguientes nodos del arbol.

![tablas_segundo_nivel_soleado](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP05/parte_1/imagenes/ejercicio_1/tablas_segundo_nivel_soleado.png)

Para cuando el *Pronostico* era *Soleado* con la tabla anterior se determinó que el atributo optimo era la *Humedad* que divide de forma pura el resto de los casos.

![tablas_segundo_nivel_lluvioso](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP05/parte_1/imagenes/ejercicio_1/tablas_segundo_nivel_lluvioso.png)

Y en el caso de un *Pronostico* *Lluvioso*, con la tabla anterior se determinó que el atributo optimo era el *Viento*, que tambien divide de forma pura el resto de los casos.

Finalmente, el arbol resultante queda de la siguiente manera:

![arbol_resultante](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP05/parte_1/imagenes/ejercicio_1/arbol_resultante.png)


#### 2. Trabaje con el dataset de Scikit Learn “wine”: 

##### a. Utilice  el  metadata  que  provee  la  librería,  ¿Cuál  es  el  tema  que aborda el dataset?

Los datos son el resultado de analisis quimicos de vinos cuyas uvas fueron cultivadas en la misma region de italia por 3 cultivadores diferentes.
Se toman trece medidas diferentes para los dieferentes componentes que se encuentran en los 3 tipos de vino.

* Alcohol
* Ácido málico
* Ceniza
* Alcalinidad de la ceniza
* Magnesio
* Fenoles totales
* Flavonoides
* Fenoles no flavonoides
* Proantocianinas
* Intensidad del color
* Matiz
* OD280 / OD315 de vinos diluidos
* Prolina 


Primeros 5 valores del dataset:

![primeros_valores](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP05/parte_1/imagenes/ejercicio_2/primeros_valores.png)


##### b. Genere el árbol de decisión que permita clasificar los diferentes tipos de vino utilizando un muestreo con proporciones de 80% para entrenamiento y 20% para testeo. 

En el caso del dataset *wine* no es necesario dividir las features del target, ni transformar a continuos los valores. Al ser un *toy dataset* esto ya está hecho.

Por lo tanto separamos en porciones de *entrenamiento* y *prueba*.

```
X_train, X_test, y_train, y_test = train_test_split(wine.data, wine.target, random_state=0, test_size=0.20)
```

La exactitud del arbol es de 97.2%

![primer_arbol](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP05/parte_1/imagenes/ejercicio_2/primer_arbol.png)

##### c. Explore la solución dada y las posibles  configuraciones para obtener un nuevo árbol que clasifique “mejor”. Documente las conclusiones. 

Para obtener un arbol que clasifique mejor podría aumentar los datos de entrenamiento a un 90%.

El problema es que estaría realizando un *overfitting* o *sobreajuste* del modelo.

Esto provoca muy buenos resultados con los datos de prueba, aprendiendo cada detalle de estos.
Pero imposibilita detectar casos que el modelo nunca vió, es decir, datos nuevos.


En realidad no hay que buscar que la exactitud del arbol llegue a un máximo, dado que esto nos conduce a realizar un *overfitting* del arbol.
Se debe buscar un punto optimo. Entre buena performance en los datos de prueba y en los datos nuevos.

Recortar la profundidad del arbol, es un buen camino para evitar el *overfitting*, imposibilitando que el arbol crezca en profundidad, aseguramos que se deban generalizar ciertos casos. Esto permite una buena performance con datos nuevos.
El arbol pierde precision sobre el conjunto de pruebas, pero en datos nuevos se aumenta la precision.

Algo a tener en cuenta es que si se reduce la profundidad del arbol a tan solo 2 niveles, la exactitud es de 94%.


#### 3. Ahora, analice el archivo zoo.csv:
##### a. Genere  el  árbol de  decisión  que  permita  inferir  el  tipo de  animal  en función  de  sus  características.  Explique  someramente  que  resultado se  obtiene  en  términos  del  árbol  y  en  términos  de  la  eficiencia  del mismo. 

Dividiendo en 80-20 los datos de entrenamiento y test respectivamente y sin la utilizacion de parametros se obtiene un arbol de 6 niveles de profundidad con 90% de exactitud, en algunos casos de 95% y varias hojas de 1 solo ejemplo.

Se trata de una situacion de *overfitting*

##### • ¿Varía ese resultado si se elimina el atributo “animal”?  ¿Por qué? 

No varía el resultado. Dado a que no es un atributo del arbol. Esto se debe a que posee una entropia muy alta, por lo tanto una ganancia de informacion muy baja. Es decir, no divide de manera clara, de que animal se trata.

##### • Cuantos niveles posee el árbol generado? ¿Qué atributos debemos modificar si deseamos realizar una poda del mismo? Modifique esos atributos para que el árbol generado conste de 4 niveles. ¿Afecta la eficiencia de la clasificación esta modificación? 

El arbol generado posee 6 niveles. Para realizar la poda del mismo se deben modificar los atributos *max_depth* y *min_samples_leaf*.

Podando el arbol a 4 niveles de profundidad, se afecta la eficiencia de la clasificación negativamente, pasa a ser constantemente 90%, sin lograr casos de 95%. Este puede ser un ejemplo de *underfitting*.

Restringiendo a minimamente 7 ejemplos para formar una hoja y una profundidad maxima de 5, se logra una exactitud de 95%, en la totalidad de las pruebas realizadas. Podría ser un ejemplo de un optimo.