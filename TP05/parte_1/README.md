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

Alcohol
Ácido málico
Ceniza
Alcalinidad de la ceniza
Magnesio
Fenoles totales
Flavonoides
Fenoles no flavonoides
Proantocianinas
Intensidad del color
Matiz
OD280 / OD315 de vinos diluidos
Prolina 

Primeros 5 valores del dataset



##### b. Genere el árbol de decisión que permita clasificar los diferentes tipos de vino utilizando un muestreo con proporciones de 80% para entrenamiento y 20% para testeo. 

##### c. Explore la solución dada y las posibles  configuraciones para obtener un nuevo árbol que clasifique “mejor”. Documente las conclusiones. 