
-- 1. Mostrar todas las facturas con nombre del cliente
SELECT F.num_factura, C.nombre_cliente, F.fecha_factura, F.total_factura
FROM FACTURA F
JOIN CLIENTE C ON F.cod_cliente = C.cod_cliente;

-- 2. Mostrar los artículos vendidos en la factura 1002
SELECT A.nombre_articulo, DF.cantidad, DF.subtotal
FROM DETALLE_FACTURA DF
JOIN ARTICULO A ON DF.cod_articulo = A.cod_articulo
WHERE DF.num_factura = 1002;

-- 3. Total vendido por sucursal
SELECT S.nombre_sucursal, SUM(F.total_factura) AS total_ventas
FROM FACTURA F
JOIN SUCURSAL S ON F.id_sucursal = S.id_sucursal
GROUP BY S.nombre_sucursal;

-- 4. Clientes que compraron más de 1000 pesos
SELECT C.nombre_cliente, F.total_factura
FROM FACTURA F
JOIN CLIENTE C ON F.cod_cliente = C.cod_cliente
WHERE F.total_factura > 1000;

-- 5. Artículos vendidos más de una vez
SELECT A.nombre_articulo, COUNT(*) AS veces_vendido
FROM DETALLE_FACTURA DF
JOIN ARTICULO A ON DF.cod_articulo = A.cod_articulo
GROUP BY A.nombre_articulo
HAVING COUNT(*) > 1;

-- 6. Facturas pagadas con tarjeta
SELECT num_factura, forma_pago
FROM FACTURA
WHERE forma_pago = 'Tarjeta';

-- 7. Mostrar el total de artículos vendidos por cliente
SELECT C.nombre_cliente, SUM(DF.cantidad) AS total_articulos
FROM CLIENTE C
JOIN FACTURA F ON C.cod_cliente = F.cod_cliente
JOIN DETALLE_FACTURA DF ON F.num_factura = DF.num_factura
GROUP BY C.nombre_cliente;

-- 8. Mostrar el precio unitario de cada artículo vendido
SELECT A.nombre_articulo, A.precio_unitario
FROM DETALLE_FACTURA DF
JOIN ARTICULO A ON DF.cod_articulo = A.cod_articulo;

-- 9. Mostrar facturas emitidas en septiembre
SELECT num_factura, fecha_factura
FROM FACTURA
WHERE MONTH(fecha_factura) = 9;

-- 10. Mostrar nombre del cliente y sucursal de cada factura
SELECT F.num_factura, C.nombre_cliente, S.nombre_sucursal
FROM FACTURA F
JOIN CLIENTE C ON F.cod_cliente = C.cod_cliente
JOIN SUCURSAL S ON F.id_sucursal = S.id_sucursal;
