SELECT
  codigo_del_cliente,
  nombre_del_cliente
FROM
  clientes
WHERE
  nombre_del_cliente LIKE '%García%';
  
SELECT
  nombre_del_articulo,
  precio_unitario
FROM
  articulo
WHERE
  precio_unitario BETWEEN 500.00 AND 15000.00
ORDER BY
  precio_unitario DESC;
  
SELECT
  f.sucursal,
  f.numero_de_factura,
  f.fecha_de_la_factura,
  c.nombre_del_cliente,
  f.total_de_la_factura
FROM
  factura AS f
JOIN
  clientes AS c ON f.codigo_del_cliente = c.codigo_del_cliente
WHERE
  c.nombre_del_cliente = 'Juan Pérez';
  
SELECT
  f.fecha_de_la_factura,
  a.nombre_del_articulo,
  df.cantidad_del_articulo,
  df.precio_unitario_del_articulo,
  df.subtotal_del_articulo
FROM
  detalle_de_factura AS df
JOIN
  articulo AS a ON df.codigo_del_articulo = a.codigo_del_articulo
JOIN
  factura AS f ON df.sucursal = f.sucursal AND df.numero_de_factura = f.numero_de_factura
WHERE
  df.sucursal = 'SUC1' AND df.numero_de_factura = 101;
