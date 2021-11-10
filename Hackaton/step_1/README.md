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

Preguntas:

Uno los dos archivos para modelar los datos?
Considero que no. Porque los datos de test, hay que hacer como si no los conocieramos. Ya que estan simulando ser datos del mundo real.

Se repite *case_id*? 
No, son 228433 valores univocos.
