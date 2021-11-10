## HACKATÓN: BASES DE DATOS MASIVAS

#### Consigna

Esta actividad tiene como objetivo que puedan integrar los distintos aprendizajes del proceso de KDD poniendo énfasis en la etapa de Data Mining.  Hasta el momento hemos trabajado en preprocesamiento de datos y también con varias técnicas de aprendizaje automático, sin embargo en este desafío vamos a centrarnos en una tarea de clasificación.

Los datos que utilizaremos para el hackatón corresponden al desafío [AV: Healthcare Analytics II](https://www.kaggle.com/nehaprabhavalkar/av-healthcare-analytics-ii) publicado en Kaggle. Para la competencia hemos realizado algunas modificaciones menores a los datos originales para organizar la actividad.

El desafío del hackaton es el siguiente, el equipo docente proveerá dos conjuntos de datos. Un conjunto de entrenamiento para poder modelar la duración de la estancia (variable stay) que es un rango de días que un paciente permaneció internado. Otro conjunto de testing que contiene las observaciones de todas las variables pero sin la respuesta sobre la cantidad de días internados.  
Tengan en cuenta que probablemente haya que preprocesar los datos o realizar transformaciones en los mismos. Considere tareas de exploración de los datos, feature engineering,  etc.

Tengan en cuenta que probablemente haya que preprocesar los datos o realizar transformaciones en los mismos. Considere tareas de exploración de los datos, feature engineering,  etc.

Link de la [consgina](https://docs.google.com/document/d/1WmmQXastxjmBgj-36A22rFt8LPwBvRyylN4vo87fXCU/edit) original.


#### Evaluación

Los resultados serán evaluados utilizando la métrica de 100*Accuracy. 

#### Datos
Los datos para llevar adelante el desafío deben descargarse de [aqui](https://drive.google.com/file/d/15dDvqIH01MgEFT7CX4MhjSwTU4LXAWyZ/view): Datos. En el zip hay tres archivos:

* train.csv: Que tiene los datos para el entrenamiento con las etiquetas correspondientes.

* test.csv: Son los datos sin etiquetar y que deben predecir a qué clase pertenecen a partir del modelo entrenado.

* ejemplo-test-eval.txt: Es el formato en que se deben entregar los resultados en el archivo txt. Solo deben presentar ese archivo con las etiquetas predichas. Nosotros conocemos cuáles son las etiquetas reales para verificar la capacidad de predicción de sus modelos. 
