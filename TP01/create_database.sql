/* Creo la base de datos */
CREATE DATABASE medios
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    CONNECTION LIMIT = -1;
    
/* Creo la tabla de Medios */
CREATE TABLE IF NOT EXISTS public."Medios"
(
    id bigint NOT NULL,
    direccion character varying(50),
    nombre character varying(20),
    CONSTRAINT "Medios_pkey" PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE public."Medios"
    OWNER to postgres;
    
    
/* Creo la tabla de Especialidades */
CREATE TABLE IF NOT EXISTS public."Especialidades"
(
    id bigint NOT NULL,
    descripcion character varying(200),
    CONSTRAINT "Especialidades_pkey" PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE public."Especialidades"
    OWNER to postgres;
    
    
/* Creo la tabla de Tipos_Medios */
CREATE TABLE IF NOT EXISTS public."Tipos_Medio"
(
    id bigint NOT NULL,
    descripcion character varying(200),
    CONSTRAINT "Tipos_Medio_pkey" PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE public."Tipos_Medio"
    OWNER to postgres;
    

/* Creo la tabla de Ciudades */
CREATE TABLE IF NOT EXISTS public."Ciudades"
(
    id bigint NOT NULL,
    nombre character varying(20),
    CONSTRAINT "Ciudades_pkey" PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE public."Ciudades"
    OWNER to postgres;


/* Creo la tabla de Provincias */
CREATE TABLE IF NOT EXISTS public."Provincias"
(
    id bigint NOT NULL,
    nombre character varying(20),
    CONSTRAINT "Provincias_pkey" PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE public."Provincias"
    OWNER to postgres;
    
/* Agrego las claves foraneas a la tabla de Medios */
ALTER TABLE public."Medios"
    ADD COLUMN id_especialidad bigint,
    ADD CONSTRAINT id_especialidad_fk FOREIGN KEY (id_especialidad)
    REFERENCES public."Especialidades" (id)
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
    
ALTER TABLE public."Medios"   
    ADD COLUMN id_tipo_medio bigint,
    ADD CONSTRAINT id_tipo_medio_fk FOREIGN KEY (id_tipo_medio)
    REFERENCES public."Tipos_Medio" (id)
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
    
ALTER TABLE public."Medios"    
    ADD COLUMN id_ciudad bigint,
    ADD CONSTRAINT id_ciudad_fk FOREIGN KEY (id_ciudad)
    REFERENCES public."Ciudades" (id)
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;  
    
/* Agrego las claves foraneas a la tabla de Ciudades */
ALTER TABLE public."Ciudades"
    ADD COLUMN id_provincia bigint,
    ADD CONSTRAINT id_provincia_fk FOREIGN KEY (id_provincia)
    REFERENCES public."Provincias" (id)
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
    
    
/* Inserto datos de prueba */

INSERT INTO public."Provincias"(
	id, nombre)
	VALUES (1, 'Buenos Aires');

INSERT INTO public."Ciudades"(
	id, nombre, id_provincia)
	VALUES (1, 'Luján', 1);
	
INSERT INTO public."Tipos_Medio"(
	id, descripcion)
	VALUES (1, 'Probando');
	
INSERT INTO public."Especialidades"(
	id, descripcion)
	VALUES (1, 'Probando');
	
INSERT INTO public."Medios"(
	id, nombre, id_especialidad, id_tipo_medio, direccion, id_ciudad)
	VALUES (1, 
	        'MedioProbando',
	        1,
	        1,
	        'DireccionFalsa1600',
	        1
	        );


