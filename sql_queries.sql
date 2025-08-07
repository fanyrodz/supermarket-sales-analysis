--     CREACIÓN DE BASE DE DATOS Y TABLAS
-- BASE DE DATOS
CREATE DATABASE grocery;
USE grocery;

-- CREAR TABLA 'clientes'
create table clientes(
	id_cliente INT PRIMARY KEY,
	nombre text,
    correo text
); 

-- CREAR TABLA 'productos'
create table productos(
	id_producto INT PRIMARY KEY,
    nombre text,
    categoria text,
    precio int,
    costo int
);


-- CREAR TABLA 'ventas'
create table ventas(
	id_venta INT PRIMARY KEY,
    id_cliente INT,
    id_producto int,
    fecha date,
    cantidad int,
    foreign key (id_cliente) references clientes (id_cliente),
    foreign key (id_producto) references productos (id_producto)
);
    
SELECT * FROM ventas;
SELECT * FROM productos;
SELECT * FROM clientes;

--     COMPLETAR TABLA VENTAS

-- TOTAL INGRESO POR VENTAS
 
 ALTER TABLE ventas
 ADD COLUMN ingreso INT;
 
 UPDATE ventas 
 JOIN productos ON ventas.id_producto = productos.id_producto
 SET ingreso = productos.precio * ventas.cantidad;

SELECT SUM(ingreso)
FROM ventas;

select * from ventas;

-- TOTAL COSTO POR VENTAS

ALTER  TABLE ventas
ADD COLUMN costo INT;

update ventas
JOIN productos on ventas.id_producto = productos.id_producto
SET ventas.costo = ventas.cantidad * productos.costo;

-- UTILIDAD POR VENTA

ALTER TABLE ventas
ADD COLUMN utilidad INT;

UPDATE ventas
SET utilidad = (ingreso - costo) * cantidad
WHERE id_producto is not null;

select * from ventas;

--     SOBRE LOS CLIENTES

-- 10 CLIENTES CON MÁS CANTIDAD DE COMPRAS
CREATE TABLE top10_clientes_cantidad
SELECT id_cliente, SUM(cantidad)
FROM ventas
GROUP BY id_cliente
ORDER BY sum(cantidad) DESC
LIMIT 10;

ALTER TABLE top10_clientes_cantidad
ADD COLUMN cliente TEXT;

UPDATE top10_clientes_cantidad
LEFT JOIN clientes ON clientes.id_cliente = top10_clientes_cantidad.id_cliente
SET top10_clientes_cantidad.cliente = clientes.nombre
WHERE top10_clientes_cantidad.id_cliente IS NOT NULL;

select * from top10_clientes_cantidad;

-- 10 CLIENTES QUE NOS GENERARON MÁS UTILIDAD
CREATE TABLE top10_clientes_utilidad
SELECT id_cliente, SUM(utilidad)
FROM ventas
GROUP BY id_cliente 
ORDER BY sum(utilidad) DESC
LIMIT 10;

alter table top10_clientes_utilidad
ADD COLUMN cliente TEXT;

UPDATE top10_clientes_utilidad
left join clientes on clientes.id_cliente = top10_clientes_utilidad.id_cliente
SET top10_clientes_utilidad.cliente =clientes.nombre;


select * from top10_clientes_utilidad;

-- 10 CLIENTES QUE NOS GENERARON MENOS UTILIDAD
CREATE TABLE clientes_utilidad_menor
SELECT id_cliente, SUM(utilidad)
FROM ventas
GROUP BY id_cliente 
ORDER BY sum(utilidad) ASC
LIMIT 10;

alter table clientes_utilidad_menor
ADD COLUMN cliente TEXT;

UPDATE clientes_utilidad_menor
left join clientes on clientes.id_cliente = clientes_utilidad_menor.id_cliente
SET clientes_utilidad_menor.cliente =clientes.nombre;


select * from clientes_utilidad_menor;

-- UTILIDAD POR CLIENTE
CREATE TABLE utilidad_por_cliente
SELECT id_cliente, SUM(utilidad)
FROM ventas
GROUP BY id_cliente 
ORDER BY sum(utilidad);


select * from utilidad_por_cliente;

--     SOBRE LOS PRODUCTOS
-- 10 PRODUCTOS CON MÁS MARGEN UNITARIO
ALTER TABLE productos 
ADD COLUMN margen INT;

UPDATE productos 
SET margen = precio - costo;

select * from productos;

create table top10_productos_margen
SELECT nombre, sum(margen)
FROM productos 
GROUP BY nombre
ORDER BY sum(margen) DESC
LIMIT 10; 

SELECT * FROM top10_productos_margen;

-- 10 PRODUCTOS QUE GENERARON MÁS UTILIDAD

create table top10_productos_utilidad
SELECT id_producto, SUM(utilidad)
FROM ventas
GROUP BY id_producto
ORDER BY SUM(utilidad) DESC
LIMIT 10;

ALTER TABLE top10_productos_utilidad
ADD COLUMN producto TEXT;

UPDATE top10_productos_utilidad 
LEFT JOIN productos ON productos.id_producto = top10_productos_utilidad.id_producto
SET top10_productos_utilidad.producto = productos.nombre;

SELECT * FROM top10_productos_utilidad;

-- 10 PRODUCTOS MÁS VENDIDOS 
CREATE TABLE top10_productos_ventas
SELECT id_producto, SUM(cantidad)
FROM ventas
GROUP BY id_producto
ORDER BY sum(cantidad) DESC
LIMIT 10;

ALTER TABLE top10_productos_ventas
ADD COLUMN producto TEXT;

UPDATE top10_productos_ventas
LEFT JOIN productos ON productos.id_producto = top10_productos_ventas.id_producto
SET top10_productos_ventas.producto = productos.nombre;

SELECT * FROM top10_productos_ventas;

--     SOBRE LAS CATEGORÍAS
-- 5 QUE GENERARON MÁS UTILIDAD
ALTER TABLE ventas
ADD COLUMN categoria TEXT;

UPDATE ventas
LEFT JOIN productos ON productos.id_producto = ventas.id_producto
SET ventas.categoria = productos.categoria;

CREATE TABLE top5_categorias_utilidad
SELECT categoria, sum(utilidad)
FROM ventas
GROUP BY categoria
ORDER BY sum(utilidad)DESC
LIMIT 5;

SELECT * FROM top5_categorias_utilidad;

-- 5 CATEGORÍAS MAS VENDIDAS
CREATE TABLE top5_categorias_ventas
SELECT categoria, SUM(cantidad)
FROM ventas
GROUP BY categoria
ORDER BY sum(cantidad)
LIMIT 5;

SELECT * FROM top5_categorias_ventas;

--     SOBRE EL TIEMPO
-- UTILIDAD POR MES 
CREATE TABLE utilidad_por_mes AS
SELECT 
  DATE_FORMAT(fecha, '%Y-%m') AS mes,
  SUM(utilidad) AS utilidad_total
FROM ventas
GROUP BY mes
ORDER BY mes;

select * from utilidad_por_mes;


-- UTILIDAD POR AÑO 

CREATE TABLE utilidad_anual AS
SELECT 
  DATE_FORMAT(fecha, '%Y') AS año,
  SUM(utilidad) AS utilidad_total
FROM ventas
GROUP BY año
ORDER BY año;

select * from utilidad_anual;

-- VENTAS POR MES
CREATE TABLE ventas_mensuales
SELECT 
	DATE_FORMAT (fecha, '%Y-%m') AS mes,
    SUM(cantidad) AS cantidad_mensual
FROM ventas
GROUP BY mes
ORDER BY mes;

SELECT * FROM ventas_mensuales;

-- VENTAS POR AÑO

CREATE TABLE ventas_anuales
SELECT
	DATE_FORMAT (fecha, '%Y') AS año,
    SUM(cantidad) AS cantidad_anual
FROM ventas
GROUP BY año
ORDER BY año;

SELECT * FROM ventas_anuales;
