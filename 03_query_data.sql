/*
T41A-P05 – 03_query_data.sql
Autor: Cristian Ricardo Godinez Limones – Matrícula: 183016
Consultas de ejemplo sobre el esquema esperado por los tests.
*/

-- 1) Columnas de articulo (verificación rápida)
SELECT column_name
FROM information_schema.columns
WHERE table_name = 'articulo'
ORDER BY column_name;

-- 2) Total por factura (sumando sus detalles)
SELECT 
  f.sucursal, f.numero_de_factura,
  SUM(d.subtotal_del_articulo)::NUMERIC(14,2) AS total_calculado,
  f.total_de_la_factura
FROM factura f
JOIN detalle_de_factura d
  ON (d.sucursal, d.numero_de_factura) = (f.sucursal, f.numero_de_factura)
GROUP BY f.sucursal, f.numero_de_factura, f.total_de_la_factura
ORDER BY f.sucursal, f.numero_de_factura;

-- 3) Ventas por cliente
SELECT 
  c.codigo_del_cliente,
  c.nombre_del_cliente,
  SUM(d.subtotal_del_articulo)::NUMERIC(14,2) AS total_cliente
FROM clientes c
JOIN factura f ON f.codigo_del_cliente = c.codigo_del_cliente
JOIN detalle_de_factura d ON (d.sucursal, d.numero_de_factura) = (f.sucursal, f.numero_de_factura)
GROUP BY c.codigo_del_cliente, c.nombre_del_cliente
ORDER BY total_cliente DESC;

-- 4) Artículos sin movimiento en detalle
SELECT a.*
FROM articulo a
LEFT JOIN detalle_de_factura d ON d.codigo_de_articulo = a.codigo_del_articulo
GROUP BY a.codigo_del_articulo, a.nombre_del_articulo, a.precio_unitario
HAVING COUNT(d.codigo_de_articulo) = 0
ORDER BY a.codigo_del_articulo;

-- 5) Top artículos por unidades
SELECT 
  a.codigo_del_articulo,
  a.nombre_del_articulo,
  SUM(d.cantidad_del_articulo) AS unidades
FROM articulo a
JOIN detalle_de_factura d ON d.codigo_de_articulo = a.codigo_del_articulo
GROUP BY a.codigo_del_articulo, a.nombre_del_articulo
ORDER BY unidades DESC, a.codigo_del_articulo;
