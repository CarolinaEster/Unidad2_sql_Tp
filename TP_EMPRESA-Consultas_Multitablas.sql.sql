-- consultas multitablas 
-- consulta 1 
/* 1) De cada producto listar descripción, razón social del fabricante
y stock ordenado por razón social y descripción*/


SELECT P.descripcion, F.razon_social, P.cantidad_stock
FROM productos AS P, fabricantes AS F
WHERE P.cod_fabricante = F.cod_fabricante
ORDER BY F.razon_social, P.descripcion;


-- consulta 2
/* De cada pedido listar código de pedido, fecha de pedido,
apellido del empleado y razón social del cliente*/


SELECT P.cod_pedido, 
       P.fecha_pedido, 
		 E.apellido, 
		 C.razon_social
FROM pedidos AS P,
     empleados AS E, 
	  clientes AS C
WHERE P.cod_empleado = E.cod_empleado
AND P.cod_cliente = C.cod_cliente; 



-- consulta 3
/* Listar por cada empleado apellido, cuota asignada, oficina a la
que pertenece ordenado en forma descendente por cuota*/



SELECT E.apellido,
       D.cuota,
		 O.descripcion
FROM empleados AS E, 
     Datos_contratos AS D,
	  oficinas AS O
WHERE E.cod_empleado = D.cod_empleado
AND E.cod_oficina = O.cod_oficina 
ORDER BY D.cuota DESC; 




-- consulta 4
/*  Listar sin repetir la razón social de todos aquellos clientes que
hicieron pedidos en Abril*/

SELECT DISTINCT  C.razon_social
FROM clientes AS C, 
     pedidos AS P
WHERE C.cod_cliente = P.cod_cliente
AND P.fecha_pedido >= '2024-04-01'
AND P.fecha_pedido <= '2024-04-30';




-- consulta 5 
-- Listar sin repetir los productos que fueron pedidos en Marzo


SELECT DISTINCT P.descripcion
FROM productos AS P, 
     detalle_pedidos AS D,
     pedidos AS PE
WHERE P.cod_producto = D.cod_producto
AND D.cod_pedido = PE.cod_pedido 
AND PE.fecha_pedido >='2024-03-01'
AND PE.fecha_pedido <='2024-03-31';












