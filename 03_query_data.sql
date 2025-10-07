-- Consulta de factura con su detalle
SELECT 
  f.sucursal,
  f.numero_de_factura,
  f.fecha_de_la_factura,
  f.forma_de_pago_factura,
  c.nombre_del_cliente,
  f.total_de_la_factura,
  df.codigo_de_articulo,
  a.nombre_del_articulo,
  df.cantidad_del_articulo,
  df.precio_unitario_del_articulo,
  df.subtotal_del_articulo
FROM factura f
JOIN clientes c ON c.codigo_del_cliente = f.codigo_del_cliente
JOIN detalle_de_factura df 
  ON df.sucursal = f.sucursal AND df.numero_de_factura = f.numero_de_factura
JOIN articulo a ON a.codigo_del_articulo = df.codigo_de_articulo
WHERE f.sucursal = 'S1' AND f.numero_de_factura = 1;


