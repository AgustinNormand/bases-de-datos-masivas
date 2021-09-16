# Input
* Cambiando el encoding del archivo a ISO-8859-1, corregí los acentos tanto en nombres de campos, como en los valores de los mismos.
* Fué necesario cambiar el tipo de dato del campo Actualización de "Date" a "String", dado que este no tenia un formato constante a lo largo del archivo Excel.


# Transformation Insert Provincias
* Selecciono los nombres de las provincias, los ordeno y obtengo las rows univocas.
* A dichas rows univocas les aplico un Fuzzy Match con un archivo csv con las provincias Argentinas obtenido de https://infra.datos.gob.ar/catalog/modernizacion/dataset/7/distribution/7.7/download/provincias.csv
* Fué necesario renombrar, de dicho archivo csv, la provincia Ciudad Autónoma de Buenos Aires a Capital Federal. Para lograr la convergencia entre los datos del archivo Excel con el archivo csv, modificando el primero lo menos posible.

# Transformation Tipos de Medio
* Selecciono los Tipos de medios, los ordeno y obtengo las rows univocas.
* Escribo dichas rows en un archivo de log.
* Detecto los siguientes datos duplicados, con ruido, etc:
    + "Digital", "Digial"
    + "Periodico", "Periódico", "Peródico"
    + "R", "Radio", "Radio "
    + "Television", "Televisión"
* Creo un archivo de tipos de medios intermedio, utilizar este para hacer una primera agrupación, y luego aplicar un Step de Value Mapper, y lograr datos con mayor calidad.

# Transformation Especialidades
* Selecciono las Especialidades, las ordeno y obtengo las rows univocas.
* Escribo dichas rows en un archivo de log.
* Detecto los siguientes datos redundantes o erroneos:
    + "Agro", "Agroindustria", "Agropecuario"
    + "Automovilismo", "Automóviles"
    + "Ciencia / Salud", "Ciencia/Salud"
    + "Salud", Salud ", "Salud/Ciencia"
    + "Consumidores", "Consumo"
    + "Cultura", "Cultural y Musical"
    + "Musica", "Musica ", "Música", "Música clasica"
    + "Economía", "Economía "
    + "Espectáculo", "Espectáculos"
    + "Folcklore", "Folckore", "Folclore", "Folklore"
    + "Guia", "Guía", "Guia de Cursos"
    + "Interes general", "Interés general"
    + "Judicial", "Judiciales"
    + "Juegos", "Juegos "
    + "Masculina", "Masculino"
    + "Religion", "Religión"
    + "Tendencia", "Tendencias"
    + "Transporte", "Transportes"
    + "Turismo", "Turismo y gral"
    + "Exparcimiento"
* Creo un archivo de especialidades intermedio, utilizar este para hacer una primera agrupación, y luego aplicar un Step de Value Mapper, y lograr datos con mayor calidad.


# Archivo CSV de ciudades
* Obtengo un archivo csv con las localidades argentinas de la pagina https://infra.datos.gob.ar/catalog/modernizacion/dataset/7/distribution/7.10/download/localidades.csv.
* A traves de una transformación, obtengo las columnas que me interesan, y renombro los campos.
* Esto facilitará luego, agregar nuevos valores a este archivo.

# Transformation Ciudades
* Selecciono los nombres de las ciudades y provincias, los ordeno y obtengo las rows univocas.
* A dichas rows univocas les aplico un Fuzzy Match con el archivo csv.
* De 1101 ciudades univocas, 849 matchearon utilizando el archivo previamente mencionado, y 252 no.
    + 15 de las que no matchearon son ciudades nulas.
    + 4 son Capital Federal.
    + Y el resto son inconsistencias similares a la siguiente: En el archivo de Localidades se encuentra "Coronel Brandsen" y en el archivo Excel: "Brandsen", "Cnel. Brandsen"
* Para no hacer un analisis que sería demasiado minucioso, se agregaron las ciudades que no matchearon, al archivo de input utilizado.

# TO-DO
* Las mejoras planteadas van desde la más simple, a la mas compleja.
* Mejora 1: No realizar las modificaciones de los datos en la misma transformación en la que luego se insertan. Hacer otra transformación y ejecutarla con "Transformation Execution", desde la transformación que se necesite. Motivo: Si hago una limpieza de datos y paso una "Especialidad" de un medio de "R" a "Radio" en la transformación en la que migro las "Especialidades", cuando migre los "Medios", voy a tener que volver a hacer los Steps necesarios para volver a pasar del medio "R" al medio "Radio", para poder lograr hacer un select a la base de datos, para recuperar el ID, y poner la foreign key. 
Siguiendo el principio Dont Repeat Yourself, no deberíamos volver a repetir de nuevo los mismos steps en una transformación y luego en otra. Sería muy facil que quede inconsistente, si tenemos esos mismos steps repetidos en dos transformaciones.
En cambio, si realizo esos pasos en una transformación, y luego uso esta desde todas las transformaciones que se necesiten, es mejor.

* Mejora 2: Si bien la mejora anterior mejoraría la calidad de la migración, se estarían realizando, para una misma fila en el archivo de Excel, varias transformaciones del mismo campo. Ej: Si paso una provincia de "Santafe" a "Santa Fe", cuando migro las provincias, cuando esté migrando las ciudades, voy a tener que hacer nuevamente la misma transformación, para poder obtener el nombre correcto para poder realizar el select a la base de datos correspondiente, para obtener el id.
Sería mejor ir almacenando para cada row del archivo de Excel, los id correspondiente que se fueron generando a lo largo de las transformaciones, para, cuando llegue el momento de insertar en la tabla que integra todas las tablas insertadas previamente (la tabla de medios), no tenga que hacer transformaciones de datos nuevamente, o selects a la base de datos, y ya tenga todos los id necesarios para cargar las claves foraneas.
O algo similar, sería mantener una tabla "Traductor" donde pueda hacer un query con "Santafe" y me devuelva el valor al que fue transformado "Santa Fe"

# What is new?
* En esta version, que es la versión final del ejercicio, se muestra el resultado de haber aplicado la "Mejora 1" a la version anterior del ejercicio.

# Performance
* Si bien, utilizando una transformación separada, se lograba la ventaja de no repetir en 2 lugares distintos los mismos steps, se notaba una pérdida de performance en el job. 
Por eso se crean varias copias de la transformacion a ejecutar.

# Tiempo de la actividad
* Aproximadamente realizar este ejercicio me demandó 10 horas.

# Fotos
* Se incluyen fotos de los resultados de las tablas, para poder visualizar facilmente el estado final de los datos.
* Se puede ver en las fotos que el archivo de excel contiene 7214, y esa cantidad fue insertada en postgresql.
