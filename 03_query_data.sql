SELECT * FROM factura;

SELECT * FROM detalle_de_factura;

SELECT f.sucursal, f.numero_de_factura, f.fecha_de_la_factura,
       f.forma_de_pago_factura, f.total_de_la_factura, c.nombre_del_cliente
FROM factura f
JOIN clientes c ON f.codigo_del_cliente = c.codigo_del_cliente;

SELECT f.sucursal, f.numero_de_factura, d.codigo_de_articulo, a.nombre_del_articulo,
       d.cantidad_del_articulo, d.precio_unitario_del_articulo, d.subtotal_del_articulo
FROM detalle_de_factura d
JOIN factura f ON d.sucursal = f.sucursal AND d.numero_de_factura = f.numero_de_factura
JOIN articulo a ON d.codigo_de_articulo = a.codigo_del_articulo
ORDER BY f.sucursal, f.numero_de_factura;
