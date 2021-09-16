# Planes
* Traté al archivo txt de planes como un archivo csv con delimitador \r\n o ${line.separator}. Con un unico field, llamada line_content, de tipo string.
* Luego le aplique un Sort para ordenarlo.
* Tome las rows univocas.
* Removí los nulos.
* Usé una expresion regular para obtener el código del plan y el nombre de la carrera.
(\s{4})([0-9][0-9][0-9][0-9])(\s{18})(.*) 

Grupo 1: Detecta 4 espacios en blanco: (\s{4})
Grupo 2: Seguido de 4 numeros: ([0-9][0-9][0-9][0-9])
Grupo 3: Luego 18 espacios: (\s{18})
Grupo 4: Seguido de cualquier caracter: (.*)

El segundo grupo se trata de el codigo del plan, y el 4 grupo de el nombre de la carrera

# Rendimiento Academico
* Traté al dump de postgres de las cursadas como un archivo csv con delimitador \r\n o ${line.separator}. Con un unico field, llamada line_content, de tipo string.
* Removí los nulos.
* Usé una expresion regular para obtener el id_estudiante, la asignatura, la condicion y la calificación.
([0-9]+)(\s)([0-9]+)(\s)(A|R|L|P)(\s)([0-9][0]*)

Grupo 1: Detecta el id del estudiante, tiene que ser por lo menos 1 numero y pueden ser varios.
Grupo 2: Detecta espacios.
Grupo 3: Detecta el id de la asignatura, tiene que ser por lo menos 1 numero y pueden ser varios.
Grupo 4: Detecta espacios.
Grupo 5: Detecta la condición de la cursada, tiene que ser alguna de las letras "A", "R", "L" o "P".
Grupo 6: Detecta espacios.
Grupo 7: Detecta la calificación. Tiene que ser un numero, del 1 al 9. Y puede contener o no, al final, el numero 0.

* Realicé dos group by, uno para filtrar por id de estudiante, y obtener la cantidad de rows totales, para saber la cantidad de cursadas que realizó el estudiante.
* Luego filtré las rows que tenían una nota > 0, y realicé un group by, de nuevo, por id de estudiante, para poder calcular la cantidad de materias aprobadas, y el promedio de estas.
* Luego hice los respectivos Lookup a la base de datos para obtener cada uno de los ID's requeridos, e inserté en la tabla de rendimiento academico los datos resultantes.

# TO-DO
* Usar shared.xml para definir la conección a la base de datos.

# Mejorado con respecto al ejercicio 1
* Se utilizan path relativos para todos los archivos

# Aclaraciones
* Si bien por cuestiones de normalización, la columna provincia en la tabla de ciudades, debería ser una tabla separada. No la separé para seguir la estructura de la base de datos que propone el ejercicio.

# Tiempo de la actividad
* Me demandó 2 horas realizar el ejercicio.