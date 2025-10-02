-- 1) Listar facturas con nombre de cliente y total
SELECT f.sucursal, f.numero_de_factura, f.fecha_de_la_factura,
       c.nombre_del_cliente, f.total_de_la_factura
FROM factura f
JOIN clientes c ON c.codigo_del_cliente = f.codigo_del_cliente
ORDER BY f.sucursal, f.numero_de_factura;
