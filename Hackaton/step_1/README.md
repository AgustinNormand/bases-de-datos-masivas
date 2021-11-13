## Getting to know the data

#### De que son los datos?

La reciente pandemia de Covid-19 ha provocado la alarma sobre una de las áreas más olvidadas para concentrarse: la gestión de la atención médica. Si bien la gestión de la atención médica tiene varios casos de uso para el uso de la ciencia de datos, <mark>la duración de la estadía del paciente es un parámetro crítico para observar y predecir si se desea mejorar la eficiencia de la gestión de la atención médica en un hospital.</mark>
Este parámetro ayuda a los hospitales a identificar a los pacientes de alto riesgo de (LOS) *longitud de estadía* (pacientes que permanecerán más tiempo) en el momento del ingreso. 

Una vez identificados, los pacientes con alto riesgo de *longitud de estadía* pueden tener su <mark>plan de tratamiento optimizado para minimizar las *longitudes de estadía* y reducir la posibilidad de infección del personal / visitante.</mark> Además, el conocimiento previo de la *longitud de estadía* <mark>puede ayudar en la logística, como la planificación de la asignación de habitaciones y camas.</mark>
Suponga que lo contrataron como científico de datos de HealthMan, una organización sin fines de lucro dedicada a administrar el funcionamiento de los hospitales de una manera profesional y óptima.
La tarea consiste en predecir con precisión la duración de la estadía de cada paciente, caso por caso, para que los hospitales puedan utilizar esta información para una asignación óptima de recursos y un mejor funcionamiento. <mark>La duración de la estancia se divide en 11 clases diferentes que van desde 0-10 días hasta más de 100 días.</mark>

#### Longitud de los archivos

El archivo "train.csv" cuenta con 228.439 registros.

El archivo "test.csv" cuenta con 90.001 registros.


#### Atributos

18 atributos.
* case_id (Double) Numero de caso Univoco
* Hospital_code (Double) Codigo de hospital
* Hospital_type_code (String) Código de tipo de hospital
* City_Code_Hospital (Double) Código de ciudad del hospital
* Hospital_region_code (String) Código de región del hospital 
* Avalable.Extra.Rooms.in.Hospital (Double) Habitaciones adicionales disponibles en el hospital 
* Department (String) Departamento
* Ward_Type (String) Tipo de sala
* Ward_Facility_Code (String) Codigo de facilidades de la sala
* Bed.Grade (Double) Grado de cama
* patientid (Double) Id paciente
* City_Code_Patient (Double) Ciudad del paciente
* Type.of.Admission (String) Tipo de ingreso
* Severity.of.Illness (String) Severidad de la enfermedad
* Visitors.with.Patient (Double) Visitores con el paciente
* Age (String) Edad
* Admission_Deposit (Double) Deposito de admision
* Stay (String) Estadía

84236 patientid univocos
144202 duplicados

Faltantes del dataset:
Total: 3382
84 faltantes en Bed.Grade
3298 faltantes en City_Code_Patient
Proporcion de faltantes: 1.480489%

##### Faltantes de City_Code_Patient:
Del total de faltantes (3298), los que pertenecen a un mismo *patientid* son (1463).
Los que solo aparecen una vez, es decir, tienen un *patientid* univoco en los registros del dataset son (616), mientras que los que aparecen mas que una vez, son (847)
De estos 847, es decir, las filas contenian un *patientid*, cargado anteriormente en el dataset. Verifiqué que en ninguno de los casos anteriores que aparecía el *patientid* tenga cargado el atributo *City_Code_Patient* y efectivamente, ninguno lo contenía.

Se imputaron los 3298 valores faltantes de *City_Code_Patient* con el valor en *City_Code_Hospital*.

##### Faltantes de Bed.Grade:
Del total de faltantes de Bed.Grade, 
* 3 pertenecen al hospital con *Hospital_Code* 7
* 1 pertenece al hospital con *Hospital_Code* 19
* 81 pertenecen al hospital con *Hospital_Code* 6

Se obtuvieron los atributos con menor varianza y de estos se obtuvo la moda.

* Hospital_type_code                   0.000000e+00 A
* Ward_Facility_Code                   1.190476e-02 F
* Hospital_region_code                 1.190476e-02 X
* Department                           1.422834e-01 gynecology
* City_Code_Hospital                   1.530407e-01 6
* Ward_Type                            2.489960e-01 R
* Type.of.Admission                    2.517212e-01 Trauma

Se determinó que en los registros con estas caracteristicas, predomina el valor de Bed.Grade 3. Por lo tanto, se imputó este valor.


#### Numerized

Se numerizaron los atributos de tipo categoricos. El *mapping* fue:

Hospital_type_code (Codigo de tipo de hospital)
* a -> 0
* b -> 1
* c -> 2
* d -> 3
* e -> 4
* f -> 5
* g -> 6

Hospital_region_code (Codigo de tipo de region del hospital)
* X -> 0
* Y -> 1
* Z -> 2

Department (Departamento)
* TB & Chest disease -> 0
* anesthesia -> 1
* gynecology -> 2
* radiotherapy -> 3
* surgery -> 4


Ward_Type (Tipo de sala)
* P -> 0
* Q -> 1
* R -> 2
* S -> 3
* T -> 4
* U -> 5

Ward_Facility_Code (Codigo de facilidades de la sala)
* A -> 0
* B -> 1
* C -> 2
* D -> 3
* E -> 4
* F -> 5

Type.of.Admission (Tipo de admisión)
* Emergency -> 0
* Trauma -> 1
* Urgent -> 2

Severity.of.Illness (Severidad de la enfermedad)
* Extreme -> 0
* Minor -> 1
* Moderate -> 2

Age (Edad)
* 0-10 -> 0
* 11-20 -> 1
* 21-30 -> 2
* 31-40 -> 3
* 41-50 -> 4
* 51-60 -> 5
* 61-70 -> 6
* 71-80 -> 7
* 81-90 -> 8
* 91-100 -> 9

Stay (Estadía)
* 0-10 -> 0
* 11-20 -> 1
* 21-30 -> 2
* 31-40 -> 3
* 41-50 -> 4
* 51-60 -> 5
* 61-70 -> 6
* 71-80 -> 7
* 81-90 -> 8
* 91-100 -> 9
* More than 100 Days -> 10


#### Componentes Principales
Se necesitan 13 componentes principales para explicar el 80% de la varianza de dataset.

#### Correlación

Correlacion entre Ward_Type y Severity.of.illness con un cutoff de 0.5 ?? En la matriz de correlación no se ve esto

Preguntas:

Uno los dos archivos para modelar los datos?
Considero que no. Porque los datos de test, hay que hacer como si no los conocieramos. Ya que estan simulando ser datos del mundo real.

Se repite *case_id*? 
No, son 228433 valores univocos.

En este caso, si no incorporo las etiquetas, voy a tener muy poca información. Entonces, por mas que no tenga mucho sentido, las uso?

Capaz tiene sentido que si el tipo se queda mucho tiempo, que tenga mas visitantes.
La matriz de correlacion, confirma que no hay que hacer reduccion de dimensionaliad por atributos fuertemente correlacionados.

#### Outliers

Available.Extra.Rooms.in.Hospital      987
City_Code_Patient                    17644
Visitors.with.Patient                 7009
Admission_Deposit                     8723


#### Datasets de salida

Obtenerlos y explicacion de cada uno

* Dataset original eliminado registros con nulos. (1)

* Imputacion de datos casero. (2)
* Imputacion Hot Deck. (3)

* Remover todos outliers (Variables Continuas) (4)
* Sin remover outliers (Variables Continuas) (5)


#### Elección y aplicación de la técnica de aprendizaje automático

Arboles de decision, porque tenemos en el el dataset una variable objetivo. Por lo tanto, optamos por un modelo supervisado.
En tal caso se podría usar clustering, para complementar o comparar resultados.




Raiz del arbol Visitors With Patient