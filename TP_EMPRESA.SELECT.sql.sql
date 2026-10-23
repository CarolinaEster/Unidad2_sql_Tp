SELECT * FROM documentos;

SELECT * FROM oficinas;

SELECT * FROM fabricantes;

SELECT * FROM listas;

SELECT * FROM datos_contratos;

SELECT * FROM productos;

SELECT * FROM clientes;

SELECT * FROM precios;

SELECT * FROM pedidos;

SELECT * FROM detalle_pedidos;



-- consultas simples
-- consulta 1
-- Obtener una lista con los nombres de las distintas oficinas de la empresa.clientes

SELECT descripcion
FROM oficinas;

-- consulta 2
/* Obtener una lista de todos los productod indicando descripción del producto, su precio
 de costo y su precio de costo IVA incluído (tomar el IVA como 21%)*/


SELECT descripcion,
precio,
precio * 1.21 AS precio_con_iva
FROM productos;

-- consulta 3
/* Obtener una lista indicando para cada empleado apellido,
nombre fecha de cumpleaños y edad*/


SELECT apellido, nombre, fecha_nacimiento,
TIMESTAMPDIFF(YEAR, fecha_nacimiento, CURDATE()) AS edad
FROM empleados; 



-- consulta 4
-- Listar todos los empleados que tiene un jefe asignado.

SELECT apellido, nombre, cod_jefe
FROM empleados 
WHERE cod_jefe IS NOT NULL;

-- consulta 5
-- Listar los empleados de nombre “María” ordenado por apellido

SELECT apellido, nombre
FROM empleados 
WHERE nombre = 'Maria' 
ORDER BY apellido; 

-- consulta 6
-- Listar los clientes cuya razón social comience con “L” ordenado por código de cliente.

SELECT cod_cliente, razon_social
FROM clientes 
WHERE razon_social LIKE 'L%'
ORDER BY cod_cliente;

-- consulta 7
-- Listar toda la información de los pedidos de Marzo ordenado por fecha de pedido.

SELECT *
FROM pedidos 
WHERE fecha_pedido >= '2024-03-01'
AND fecha_pedido<= '2024-03-31'
ORDER BY fecha_pedido;

-- consulta 8
-- Listar las oficinas que no tienen asignado director

SELECT cod_oficina, descripcion
FROM oficinas
WHERE codigo_director IS NULL;


-- consulta 9
-- Listar los 4 productos de menor precio de costo.


SELECT descripcion, precio
FROM productos
ORDER BY precio
LIMIT 4;


-- consulta 10
--  Listar los códigos de empleados de los tres que tengan la mayor cuota


SELECT cod_empleado
FROM datos_contratos 
ORDER BY cuota DESC
LIMIT 3;


-- 