/* Creo la base de datos */
CREATE DATABASE medios
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    CONNECTION LIMIT = -1;
    
/* Creo la tabla de Medios */
CREATE TABLE IF NOT EXISTS public."medios"
(
    id SERIAL PRIMARY KEY,
    direccion character varying(50),
    nombre character varying(20)
)

TABLESPACE pg_default;

ALTER TABLE public."medios"
    OWNER to postgres;
    
    
/* Creo la tabla de Especialidades */
CREATE TABLE IF NOT EXISTS public."especialidades"
(
    id SERIAL PRIMARY KEY,
    descripcion character varying(200)
)

TABLESPACE pg_default;

ALTER TABLE public."especialidades"
    OWNER to postgres;
    
    
/* Creo la tabla de Tipos_Medios */
CREATE TABLE IF NOT EXISTS public."tipos_medio"
(
    id SERIAL PRIMARY KEY,
    descripcion character varying(200)
)

TABLESPACE pg_default;

ALTER TABLE public."tipos_medio"
    OWNER to postgres;
    

/* Creo la tabla de Ciudades */
CREATE TABLE IF NOT EXISTS public."ciudades"
(
    id SERIAL PRIMARY KEY,
    nombre character varying(20)
)

TABLESPACE pg_default;

ALTER TABLE public."ciudades"
    OWNER to postgres;


/* Creo la tabla de Provincias */
CREATE TABLE IF NOT EXISTS public."provincias"
(
    id SERIAL PRIMARY KEY,
    nombre character varying(20)
)

TABLESPACE pg_default;

ALTER TABLE public."provincias"
    OWNER to postgres;
    
/* Agrego las claves foraneas a la tabla de Medios */
ALTER TABLE public."medios"
    ADD COLUMN id_especialidad bigint,
    ADD CONSTRAINT id_especialidad_fk FOREIGN KEY (id_especialidad)
    REFERENCES public."especialidades" (id)
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
    
ALTER TABLE public."medios"   
    ADD COLUMN id_tipo_medio bigint,
    ADD CONSTRAINT id_tipo_medio_fk FOREIGN KEY (id_tipo_medio)
    REFERENCES public."tipos_medio" (id)
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
    
ALTER TABLE public."medios"    
    ADD COLUMN id_ciudad bigint,
    ADD CONSTRAINT id_ciudad_fk FOREIGN KEY (id_ciudad)
    REFERENCES public."ciudades" (id)
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;  
    
/* Agrego las claves foraneas a la tabla de Ciudades */
ALTER TABLE public."ciudades"
    ADD COLUMN id_provincia bigint,
    ADD CONSTRAINT id_provincia_fk FOREIGN KEY (id_provincia)
    REFERENCES public."provincias" (id)
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
    
    
/* Inserto datos de prueba */

INSERT INTO public."provincias"(
	id, nombre)
	VALUES (1, 'Buenos Aires');

INSERT INTO public."ciudades"(
	id, nombre, id_provincia)
	VALUES (1, 'Luján', 1);
	
INSERT INTO public."tipos_medio"(
	id, descripcion)
	VALUES (1, 'Probando');
	
INSERT INTO public."especialidades"(
	id, descripcion)
	VALUES (1, 'Probando');
	
INSERT INTO public."medios"(
	id, nombre, id_especialidad, id_tipo_medio, direccion, id_ciudad)
	VALUES (1, 
	        'MedioProbando',
	        1,
	        1,
	        'DireccionFalsa1600',
	        1
	        );


