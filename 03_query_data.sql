SELECT * FROM cliente; 

SELECT nombre_cliente, total_factura FROM facturas JOIN cliente ON facturas.codigo_cliente=cliente.codigo_cliente;  

SELECT table1.num_factura, table2.nombre_cliente, table1.codigo_articulo, table1.cantidad_articulo, table2.total_factura FROM detalle_factura AS table1
JOIN (SELECT facturas.num_factura, nombre_cliente, total_factura FROM facturas JOIN cliente ON facturas.codigo_cliente = cliente.codigo_cliente) AS table2 
ON table1.num_factura = table2.num_factura;
