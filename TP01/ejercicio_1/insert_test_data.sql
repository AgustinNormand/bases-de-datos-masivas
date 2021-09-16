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

