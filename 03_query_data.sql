-- 1. Mostrar todas las facturas con nombre del cliente y sucursal
SELECT f.num_factura, c.nombre_cliente, s.nombre_sucursal, f.fecha_factura, f.total_factura
FROM factura f
JOIN cliente c ON f.cod_cliente = c.cod_cliente
JOIN sucursal s ON f.id_sucursal = s.id_sucursal;

-- 2. Mostrar los artículos vendidos en la factura 2001
SELECT a.nombre_articulo, df.cantidad, df.subtotal
FROM detalle_factura df
JOIN articulo a ON df.cod_articulo = a.cod_articulo
WHERE df.num_factura = 2001;

-- 3. Total vendido por cada sucursal
SELECT s.nombre_sucursal, SUM(f.total_factura) AS total_ventas
FROM factura f
JOIN sucursal s ON f.id_sucursal = s.id_sucursal
GROUP BY s.nombre_sucursal;
