/* Creo la tabla de Clientes */
CREATE TABLE IF NOT EXISTS public."clientes"
(
    id_cliente SERIAL PRIMARY KEY,
    saldo_cuenta real
)

TABLESPACE pg_default;

ALTER TABLE public."clientes"
    OWNER to postgres;
/* */

/* Creo la tabla de Productos */
CREATE TABLE IF NOT EXISTS public."productos"
(
    id_producto SERIAL PRIMARY KEY,
    precio_unitario real,
    cant_vendida bigint
)

TABLESPACE pg_default;

ALTER TABLE public."productos"
    OWNER to postgres;
/* */

/* Creo la tabla de Tiempo */
CREATE TABLE IF NOT EXISTS public."tiempo"
(
    id_tiempo SERIAL PRIMARY KEY,
    dia bigint,
    mes bigint,
    anio bigint
)

TABLESPACE pg_default;

ALTER TABLE public."tiempo"
    OWNER to postgres;
/* */

/* Creo la tabla de Ventas */
CREATE TABLE IF NOT EXISTS public."venta"
(
    id_cliente bigint,
    id_producto bigint,
    id_tiempo bigint,
    cantidad_vendida real,
    monto_total real
)

TABLESPACE pg_default;

ALTER TABLE public."venta"
    OWNER to postgres,
    ADD CONSTRAINT id_cliente_fk FOREIGN KEY (id_cliente)
    REFERENCES public."clientes" (id_cliente)
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID,
    ADD CONSTRAINT id_producto_fk FOREIGN KEY (id_producto)
    REFERENCES public."productos" (id_producto)
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID,
    ADD CONSTRAINT id_tiempo_fk FOREIGN KEY (id_tiempo)
    REFERENCES public."tiempo" (id_tiempo)
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
/* */

