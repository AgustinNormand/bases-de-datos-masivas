## TP05 - Minería de datos
## Parte 01 - Arboles de decisión (J48)
## Agustín normand
#### 26 Octubre 2021

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

#### 4. Se provee la base de datos de los pasajeros del famoso barco que se hundiera en  su  viaje  inaugural  (archivo  titanic-en.csv)  con  los  siguientes  atributos  y valores posibles:  
* Class {"1st","2nd","3rd","crew"} 
* Age {"adult","child"} 
* Sex {"male","female"} 
* Survived {"yes","no"} 
 
#### Genere  el  árbol  de  clasificación,  explore  la  solución  dada  y  las  posibles alternativas para obtener un nuevo árbol que clasifique “mejor”.

Se separaron los datos en 80% para *training* y 20% para *test*.

Promediando 1000 scores utilizando el criterio de *Entropia*, es decir *ganancia de informacion*, sin modificacion de los parametros, solamente modificando la proporcion de datos de *training* y *test* se lograron los siguientes resultados en la exactitud:

* Training - Test
* 50% - 50%: 78,7%
* 60% - 40%: 79,1%
* 70% - 30%: 78,3%
* 80% - 20%: 77,3%
* 90% - 10%: 78,7%

Utilizando el criterio de *gini* se logran los mismos resultados anteriormente mencionados.

Usando un *training set* de proporcion 0.06, *max_depth* de 3 y *min_samples_leaf* 30, se logró una exactitud de 82%

#### 5. Un  Banco  de  Portugal  realizó  una  campaña  de  marketing  en  busca  de clientes de plazos fijos basada en llamados telefónicos. Se provee el dataset real  (bank-full.csv)  con  más  45000  instancias  y  el  detalle  (bank-names.txt) de  los  datos  registrados  de  cada  una  de  las  personas  contactadas  por  la entidad bancaria.

Las campañas de marketing se basaron en llamadas telefonicas, a menudo, se requería mas de un contacto con el mismo cliente, para poder acceder si el producto estaría o no suscrito.

Atributos: 
* Edad
* Trabajo
* Estado civil
* Nivel educativo
* Incumplimiento de pagos
* Préstamo vivienda
* Préstamo personal
* Medio de contacto
* Último mes contacto
* Último día contacto
* Duración último contacto segundos
* Cant. de contactos en la campaña
* Días desde último contacto campaña previa
* Cant. de contactos previos a campaña
* Tasa variacion del empleo
* Indice de precios al consumidor
* Indice de confianza del consumidor
* Tipo de euribor
* Numero de empleados

Variable de salida:
*  El cliente se suscribio a un plazo?

##### a. Realice  las  tareas  necesarias  para  poder  procesar  el  dataset  en Scikit-Learn. 

* Se modificó el delimitador del archivo csv de "," a ";".
* Se dividió el target del dataset original.
* Se separaron los datos en 80% de entrenamiento y 20% para pruebas.
* Se pasaron los atributos discretos a continuos.

##### b. Luego,  genere  el  árbol  de  decisión,  y  optimice  los  resultados,  con  el objetivo  de  explicar  cuáles  son  las  características  más  importantes que  permiten  identificar  a  una  persona  que  accederá  o  no  al  plazo fijo. Documente los resultados. 

Sin utilizar parametros, unicamente dividiendo el dataset en 80% datos de entrenamiento y 20% datos de pruebas, se obtiene un arbol de 40 niveles de profundidad y una exactitud de 87%.

Modificando los hiperparametros, cree un arbol de 1 solo nivel que es el siguiente:

![arbol_1nivel](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP05/parte_1/imagenes/ejercicio_5/arbol_1nivel.png)

Realizando ese experimiento se puede observar que el atributo *Duration* que hace referencia a la duración último contacto segundos, tiene mucha influencia en determinar si el cliente accederá o no al plazo fijo.

Por otro lado, me llamó la atención que el arbol tenga un 88% de exactitud. Incluso más que el arbol de 40 niveles de profundidad.

Si miramos la matriz de confusión del arbol de 1 nivel:

![matriz_confusion_1nivel](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP05/parte_1/imagenes/ejercicio_5/matriz_confusion_1nivel.png)

Vemos que el arbol nunca respondió un cliente tomaría el plazo fijo. Si volvemos a ver el arbol de 1 nivel, se puede ver que en ambos nodos hojas, responde que el cliente *no* accederá al plazo fijo.
Sumando la cantidad de clientes que accedieron al plazo fijo y la cantidad que no accedió, el resultado es 9043.

Si calculamos la propocion de casos negativos, es 0,882450514, que es la exactitud que tiene el arbol.

En otras palabras, si el arbol de decision contesta que *NO* siempre. El 88,2% de los casos va a acertar, debido a que esta es la proporcion de clientes que no accedieron al plazo fijo. Y ese 11% de error del arbol, son los casos donde los clientes accedieron al pazo fijo.

Si bien al principio creí haber encontrado un arbol muy simple, con una exactitud muy buena, puedo darme cuenta ahora que no es util un arbol de decision que no pueda predecir la totalidad de los valores posibles de la clase, por mucha exactitud que este tenga.

Si vemos la matriz de confusion del arbol de 40 niveles:

![matriz_confusion_40niveles](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP05/parte_1/imagenes/ejercicio_5/matriz_confusion_40niveles.png)

Acierta 495 veces que los clientes obtendrán el plazo fijo. De todos los clientes que accedieron, el arbol predijo bien el 47%.


Aumentando la cantidad de niveles del arbol a 2 obtengo:

![arbol_2niveles](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP05/parte_1/imagenes/ejercicio_5/arbol_2niveles.png)

Cuya matriz de confusion es:

![matriz_confusion_2niveles](https://raw.githubusercontent.com/AgustinNormand/bases-de-datos-masivas/main/TP05/parte_1/imagenes/ejercicio_5/matriz_confusion_2niveles.png)

Obtengo un arbol de exactitud del 88%, que predice correctamente el 30% de los casos positivos, y el 97% de los casos negativos.

Podemos ver que esto lo logra unicamente utilizando el atributo de *Duracion*.

Agregando mas niveles al arbol, pude determinar que las características más importantes que permiten identificar a una persona que accederá o no al plazo fijo son *Duracion*, *Campaña*, *Mes* y por ultimo, *Contacto*.
