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


# Transformation Ciudades
* Selecciono los nombres de las ciudades y provincias, los ordeno y obtengo las rows univocas.
* A dichas rows univocas les aplico un Fuzzy Match con un archivo csv con las localidades Argentinas obtenido de https://infra.datos.gob.ar/catalog/modernizacion/dataset/7/distribution/7.10/download/localidades.csv
* De 1101 ciudades univocas, 849 matchearon utilizando el archivo previamente mencionado, y 252 no.
    + 15 de las que no matchearon son ciudades nulas.
    + 4 son Capital Federal.
    + Y el resto son inconsistencias similares a la siguiente: En el archivo de Localidades se encuentra "Coronel Brandsen" y en el archivo Excel: "Brandsen", "Cnel. Brandsen"
* Fué necesario renombrar, de dicho archivo csv, la provincia Ciudad Autónoma de Buenos Aires a Capital Federal. Para lograr la convergencia entre los datos del archivo Excel con el archivo csv, modificando el primero lo menos posible.
