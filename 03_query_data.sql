/*
T41A-P05 – 03_query_data.sql
Autor: Cristian Ricardo Godinez Limones – Matrícula: 183016
Consultas de verificación y análisis sobre el esquema esperado por los tests.
*/

-- 1) Mostrar columnas de cada tabla (verificación del esquema)
SELECT table_name, column_name
FROM information_schema.columns
WHERE table_name IN ('articulo','clientes','factura','detalle_de_factura')
ORDER BY table_name, ordinal_position;

-- 2) Listar todos los artículos
SELECT codigo_del_articulo, nombre_del_articulo, precio_unitario
FROM articulo
ORDER BY codigo_del_articulo;

-- 3) Listar todos los clientes
SELECT codigo_del_cliente, nombre_del_cliente
FROM clientes
ORDER BY codigo_del_cliente;

-- 4) Total calculado de cada factura sumando sus detalles
SELECT 
  f.sucursal,
  f.numero_de_factura,
  SUM(d.subtotal_del_articulo)::NUMERIC(14,2) AS total_calculado,
  f.total_de_la_factura
FROM factura f
JOIN detalle_de_factura d
  ON (f.sucursal, f.numero_de_factura) = (d.sucursal, d.numero_de_factura)
GROUP BY f.sucursal, f.numero_de_factura, f.total_de_la_factura
ORDER BY f.sucursal, f.numero_de_factura;

-- 5) Total de ventas por cliente
SELECT 
  c.codigo_del_cliente,
  c.nombre_del_cliente,
  SUM(d.subtotal_del_articulo)::NUMERIC(14,2) AS total_cliente
FROM clientes c
JOIN factura f ON f.codigo_del_cliente = c.codigo_del_cliente
JOIN detalle_de_factura d 
  ON (d.sucursal, d.numero_de_factura) = (f.sucursal, f.numero_de_factura)
GROUP BY c.codigo_del_cliente, c.nombre_del_cliente
ORDER BY total_cliente DESC;

-- 6) Artículos sin movimiento en detalle
SELECT a.codigo_del_articulo, a.nombre_del_articulo, a.precio_unitario
FROM articulo a
LEFT JOIN detalle_de_factura d ON d.codigo_de_articulo = a.codigo_del_articulo
GROUP BY a.codigo_del_articulo, a.nombre_del_articulo, a.precio_unitario
HAVING COUNT(d.codigo_de_articulo) = 0
ORDER BY a.codigo_del_articulo;

-- 7) Top artículos por unidades vendidas
SELECT 
  a.codigo_del_articulo,
  a.nombre_del_articulo,
  SUM(d.cantidad_del_articulo) AS unidades_vendidas
FROM articulo a
JOIN detalle_de_factura d ON d.codigo_de_articulo = a.codigo_del_articulo
GROUP BY a.codigo_del_articulo, a.nombre_del_articulo
ORDER BY unidades_vendidas DESC, a.codigo_del_articulo;

-- 8) Total de ventas por sucursal
SELECT 
  f.sucursal,
  SUM(d.subtotal_del_articulo)::NUMERIC(14,2) AS total_sucursal
FROM factura f
JOIN detalle_de_factura d 
  ON (f.sucursal, f.numero_de_factura) = (d.sucursal, d.numero_de_factura)
GROUP BY f.sucursal
ORDER BY total_sucursal DESC;

-- 9) Promedio de precio unitario de los artículos
SELECT 
  ROUND(AVG(precio_unitario),2) AS promedio_precio_articulos
FROM articulo;

-- 10) Verificación de integridad: diferencia entre total calculado y total declarado
SELECT 
  f.sucursal,
  f.numero_de_factura,
  (f.total_de_la_factura - SUM(d.subtotal_del_articulo))::NUMERIC(14,2) AS diferencia
FROM factura f
JOIN detalle_de_factura d 
  ON (f.sucursal, f.numero_de_factura) = (d.sucursal, d.numero_de_factura)
GROUP BY f.sucursal, f.numero_de_factura, f.total_de_la_factura
HAVING ABS(f.total_de_la_factura - SUM(d.subtotal_del_articulo)) > 0.01
ORDER BY f.sucursal, f.numero_de_factura;
