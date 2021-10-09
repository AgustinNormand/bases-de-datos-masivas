/*Cantidad de provincias*/
select count(*)
from (select p.nombre provincia, count(*) cantidad
      FROM MEDIOS m
      INNER JOIN PROVINCIAS p on m.id_provincia=p.id
      group by p.nombre
      order by p.nombre
     ) as medios_por_provincias

/*Cantidad de provincias con menos de 100 medios*/
select count(*)
from (select p.nombre provincia, count(*) cantidad
      FROM MEDIOS m
      INNER JOIN PROVINCIAS p on m.id_provincia=p.id
      group by p.nombre
      order by p.nombre
     ) as medios_por_provincias
WHERE medios_por_provincias.cantidad < 100


/* Proporcion de provincias con menos de 100 medios */
SELECT 
  (select cast(count(*) as decimal)
   from (select p.nombre provincia, count(*) cantidad
         FROM MEDIOS m
         INNER JOIN PROVINCIAS p on m.id_provincia=p.id
         group by p.nombre
         order by p.nombre
        ) as medios_por_provincias
   WHERE medios_por_provincias.cantidad < 100) 
/ 
  (select cast(count(*) as decimal)
   from (select p.nombre provincia, count(*) cantidad
         FROM MEDIOS m
         INNER JOIN PROVINCIAS p on m.id_provincia=p.id
         group by p.nombre
         order by p.nombre
        ) as medios_por_provincias) 
*100 as proporcion

/**/

/*Cantidad de ciudades*/
select count(*)
from (select c.nombre ciudad, count(*) cantidad
      FROM MEDIOS m
      INNER JOIN CIUDADES c on m.id_ciudad=c.id
      group by c.nombre
      order by c.nombre
     ) as medios_por_ciudad

/*Cantidad de ciudades con menos de 2 medios*/
select count(*)
from (select c.nombre ciudad, count(*) cantidad
      FROM MEDIOS m
      INNER JOIN CIUDADES c on m.id_ciudad=c.id
      group by c.nombre
      order by c.nombre
     ) as medios_por_ciudades
WHERE medios_por_ciudades.cantidad < 2

SELECT 
  (select cast(count(*) as decimal)
   from (select c.nombre ciudad, count(*) cantidad
         FROM MEDIOS m
         INNER JOIN CIUDADES c on m.id_ciudad=c.id
         group by c.nombre
         order by c.nombre
        ) as medios_por_ciudades
   WHERE medios_por_ciudades.cantidad < 2) 
/ 
  (select cast(count(*) as decimal)
   from (select c.nombre ciudad, count(*) cantidad
         FROM MEDIOS m
         INNER JOIN CIUDADES c on m.id_ciudad=c.id
         group by c.nombre
         order by c.nombre
        ) as medios_por_ciudad) 
*100 as proporcion

/**/

/*Cantidad de tipos de medio*/
select count(*)
from (select tm.descripcion tipo_de_medio, count(*) cantidad
      FROM MEDIOS m
      INNER JOIN tipos_medio tm on m.id_tipo_medio=tm.id
      group by tipo_de_medio
      order by tipo_de_medio
     ) as tipos_de_medio
     
/* Tipos de medio con menos de 2 medios */
select count(*)
from (select tm.descripcion tipo_de_medio, count(*) cantidad
      FROM MEDIOS m
      INNER JOIN tipos_medio tm on m.id_tipo_medio=tm.id
      group by tipo_de_medio
      order by tipo_de_medio
     ) as tipos_de_medio
WHERE cantidad < 2

/* Proporcion de tipos de medios con menos de 2 medios */

SELECT 
  (select cast(count(*) as decimal)
   from (select tm.descripcion tipo_de_medio, count(*) cantidad
         FROM MEDIOS m
         INNER JOIN tipos_medio tm on m.id_tipo_medio=tm.id
         group by tipo_de_medio
         order by tipo_de_medio
        ) as tipos_de_medio
   WHERE cantidad < 2) 
/ 
  (select cast(count(*) as decimal)
   from (select tm.descripcion tipo_de_medio, count(*) cantidad
         FROM MEDIOS m
         INNER JOIN tipos_medio tm on m.id_tipo_medio=tm.id
         group by tipo_de_medio
         order by tipo_de_medio
        ) as tipos_de_medio) 
*100 as proporcion

/**/

/*Cantidad de especialidades*/
select count(*)
from (select e.descripcion especialidad, count(*) cantidad
      FROM MEDIOS m
      INNER JOIN especialidades e on m.id_especialidad=e.id
      group by especialidad
      order by especialidad
     ) as especialidades
     
/* Cantidad de especialidades con menos de 2 medios */
select count(*)
from (select e.descripcion especialidad, count(*) cantidad
      FROM MEDIOS m
      INNER JOIN especialidades e on m.id_especialidad=e.id
      group by especialidad
      order by especialidad
     ) as especialidades
WHERE cantidad < 2

SELECT 
  (select cast(count(*) as decimal)
   from (select e.descripcion especialidad, count(*) cantidad
         FROM MEDIOS m
         INNER JOIN especialidades e on m.id_especialidad=e.id
         group by especialidad
         order by especialidad
        ) as especialidades
   WHERE cantidad < 2) 
/ 
  (select cast(count(*) as decimal)
   from (select e.descripcion especialidad, count(*) cantidad
         FROM MEDIOS m
         INNER JOIN especialidades e on m.id_especialidad=e.id
         group by especialidad
         order by especialidad
        ) as especialidades) 
*100 as proporcion

/**/

/* Cantidad de medios en Buenos Aires */
SELECT count(*)
FROM(select m.nombre
     FROM MEDIOS m
     INNER JOIN PROVINCIAS p on m.id_provincia=p.id
	   WHERE p.nombre = 'Buenos Aires'
	  ) as medios_buenos_aires
     


