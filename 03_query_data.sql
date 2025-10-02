SELECT f.numero_de_factura, c.nombre_del_cliente, f.total_de_la_factura
FROM factura f
JOIN clientes c ON f.codigo_del_cliente = c.codigo_del_cliente;
