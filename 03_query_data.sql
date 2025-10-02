
SELECT f.sucursal,
       f.numero_de_factura,
       f.fecha_de_la_factura,
       f.forma_de_pago_factura,
       f.codigo_del_cliente,
       c.nombre_del_cliente,
       d.codigo_de_articulo,
       a.nombre_del_articulo,
       d.cantidad_del_articulo,
       d.precio_unitario_del_articulo,
       d.subtotal_del_articulo,
       f.total_de_la_factura
FROM factura f
JOIN clientes c
  ON f.codigo_del_cliente = c.codigo_del_cliente
JOIN detalle_de_factura d
  ON f.sucursal = d.sucursal
 AND f.numero_de_factura = d.numero_de_factura
JOIN articulo a
  ON d.codigo_de_articulo = a.codigo_del_articulo
ORDER BY f.sucursal, f.numero_de_factura, d.codigo_de_articulo;
