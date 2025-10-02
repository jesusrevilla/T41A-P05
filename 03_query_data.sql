SELECT f.sucursal, f.numero_de_factura, c.nombre_del_cliente, f.total_de_la_factura
FROM factura f
JOIN clientes c ON f.codigo_del_cliente = c.codigo_del_cliente;

SELECT f.numero_de_factura, a.nombre_del_articulo, d.cantidad_del_articulo, d.subtotal_del_articulo
FROM detalle_de_factura d
JOIN articulo a ON d.codigo_de_articulo = a.codigo_del_articulo
JOIN factura f ON d.sucursal = f.sucursal AND d.numero_de_factura = f.numero_de_factura
WHERE f.numero_de_factura = 1001;
