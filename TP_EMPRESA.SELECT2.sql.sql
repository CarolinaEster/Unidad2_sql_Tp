SELECT MAX(cantidad) 
FROM item_ventas;







SELECT nombre_producto, SUM(cantidad)
FROM productos,item_ventas
WHERE productos.codigo_producto = item_ventas.codigo_producto
GROUP BY nombre_producto
ORDER BY SUM(cantidad) DESC; 





SELECT nombre_producto, SUM(cantidad)
AS total_unidades
FROM productos, item_ventas
WHERE productos.codigo_producto = item_ventas.codigo_producto
GROUP BY nombre_producto
HAVING SUM(cantidad) > 30 
ORDER BY nombre_producto;



UPDATE item_ventas 
SET cantidad = 40
WHERE codigo_producto = 101;





UPDATE item_ventas 
SET cantidad = 25
WHERE codigo_producto = 102;




UPDATE item_ventas 
SET cantidad = 66
WHERE codigo_producto = 103;





SELECT * 
FROM ventas;




SELECT clientes.codigo_cliente, clientes.nombre,
COUNT(ventas.numero_factura) AS cantidad_compras
FROM clientes, ventas
WHERE clientes.codigo_cliente = ventas.codigo_cliente
GROUP BY clientes.codigo_cliente, clientes.nombre
ORDER BY cantidad_compras DESC; 





SELECT item_ventas.codigo_producto,
AVG(item_ventas.cantidad) AS promedio_unidades
FROM item_ventas, ventas
WHERE item_ventas.numero_factura = ventas.numero_factura
AND ventas.codigo_cliente = 1
GROUP BY item_ventas.codigo_producto;






 