SELECT 
  f.sucursal,
  f.numero_de_factura,
  f.fecha_de_la_factura,
  c.nombre_del_cliente,
  f.forma_de_pago_factura,
  f.total_de_la_factura
FROM 
  factura f
JOIN clientes c ON f.codigo_del_cliente = c.codigo_del_cliente
ORDER BY f.fecha_de_la_factura;
