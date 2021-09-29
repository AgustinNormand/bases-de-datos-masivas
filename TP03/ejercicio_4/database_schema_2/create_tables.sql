/* Creo la tabla de Cohortes */
CREATE TABLE IF NOT EXISTS public."cohortes"
(
    id_cohortes SERIAL PRIMARY KEY,
    cohorte character varying(200)
)

TABLESPACE pg_default;

ALTER TABLE public."cohortes"
    OWNER to postgres;
/* */

/* Creo la tabla de Sexo */
CREATE TABLE IF NOT EXISTS public."sexo"
(
    id_sexo SERIAL PRIMARY KEY,
    sexo character varying(200)
)

TABLESPACE pg_default;

ALTER TABLE public."sexo"
    OWNER to postgres;
/* */

/* Creo la tabla de Sedes */
CREATE TABLE IF NOT EXISTS public."sede"
(
    id_sede SERIAL PRIMARY KEY,
    sede character varying(200)
)

TABLESPACE pg_default;

ALTER TABLE public."sede"
    OWNER to postgres;
/* */

/* Creo la tabla de Ciudades */
CREATE TABLE IF NOT EXISTS public."ciudades"
(
    id_ciudad SERIAL PRIMARY KEY,
    codigo_postal bigint,
    nombre_ciudad character varying(200),
    provincia character varying(200)
)

TABLESPACE pg_default;

ALTER TABLE public."ciudades"
    OWNER to postgres;
/* */

/* Creo la tabla de Planes */
CREATE TABLE IF NOT EXISTS public."planes"
(
    id_plan SERIAL PRIMARY KEY,
    codigo_plan bigint,
    codigo_carrera bigint,
    nombre_carrera character varying(200)
)

TABLESPACE pg_default;

ALTER TABLE public."planes"
    OWNER to postgres;
/* */

/* Creo la tabla de Rendimiento Academico */
CREATE TABLE IF NOT EXISTS public."rendimiento_academico"
(
    id_estudiante bigint,
    id_plan bigint,
    id_sede bigint,
    id_ciudad bigint,
    id_sexo bigint,
    id_cohorte bigint,
    cantidad_cursadas bigint,
    cantidad_aprobadas bigint,
    promedio real
)

TABLESPACE pg_default;

ALTER TABLE public."rendimiento_academico"
    OWNER to postgres;
/* */
