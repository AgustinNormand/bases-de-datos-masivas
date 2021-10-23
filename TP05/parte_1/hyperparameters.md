
* criterion: La función para medir la calidad de una división. Los criterios admitidos son "gini" para la impureza de Gini y "entropía" para la ganancia de información.

* Splitter: La estrategia utilizada para elegir la división en cada nodo. Las estrategias admitidas son "mejores" para elegir la mejor división y "aleatoria" para elegir la mejor división aleatoria. 

* max_depth: La profundidad máxima del árbol. Si es None, los nodos se expanden hasta que todas las hojas sean puras o hasta que todas las hojas contengan menos de min_samples_split muestras. 

* min_samples_split: El número mínimo de muestras necesarias para dividir un nodo interno:
    * Si es int, entonces considere min_samples_split como el número mínimo.

    * Si es flotante, min_samples_split es una fracción y ceil (min_samples_split * n_samples) es el número mínimo de muestras para cada división. 

* min_samples_leaf: El número mínimo de muestras necesarias para estar en un nodo hoja. Un punto de división a cualquier profundidad solo se considerará si deja al menos muestras de entrenamiento min_samples_leaf en cada una de las ramas izquierda y derecha. Esto puede tener el efecto de suavizar el modelo, especialmente en regresión.
    * Si es int, entonces considere min_samples_leaf como el número mínimo.

    * Si es flotante, min_samples_leaf es una fracción y ceil (min_samples_leaf * n_samples) es el número mínimo de muestras para cada nodo. 

* min_weight_fraction_leaf: La fracción ponderada mínima de la suma total de pesos (de todas las muestras de entrada) que se requiere para estar en un nodo hoja. Las muestras tienen el mismo peso cuando no se proporciona sample_weight. 

* max_features

* class_weight: Pesos asociados a cada valor de la clase

* max_features: Cantidad máxima de features a incluir en el modelo
