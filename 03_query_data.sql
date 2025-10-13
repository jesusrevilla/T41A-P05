SELECT 
    c.nombre_del_cliente,
    SUM(f.total_de_la_factura) AS total_facturado
FROM clientes c
JOIN factura f ON c.codigo_del_cliente = f.codigo_del_cliente
GROUP BY c.nombre_del_cliente
ORDER BY total_facturado DESC;

SELECT
    a.nombre_del_articulo,
    SUM(df.cantidad_del_articulo) AS cantidad_total_vendida
FROM articulo a
JOIN detalle_de_factura df ON a.codigo_del_articulo = df.codigo_de_articulo
GROUP BY a.nombre_del_articulo
ORDER BY cantidad_total_vendida DESC;

SELECT
    f.sucursal,
    f.numero_de_factura,
    f.fecha_de_la_factura,
    c.nombre_del_cliente AS cliente,
    f.forma_de_pago_factura,
    a.nombre_del_articulo,
    df.cantidad_del_articulo,
    df.precio_unitario_del_articulo AS precio_unitario_venta,
    df.subtotal_del_articulo
FROM factura f
JOIN clientes c ON f.codigo_del_cliente = c.codigo_del_cliente
JOIN detalle_de_factura df ON f.sucursal = df.sucursal AND f.numero_de_factura = df.numero_de_factura
JOIN articulo a ON df.codigo_de_articulo = a.codigo_del_articulo
WHERE f.sucursal = 'S1' AND f.numero_de_factura = 1
ORDER BY a.nombre_del_articulo;

SELECT
    df.sucursal,
    df.numero_de_factura,
    a.nombre_del_articulo,
    df.precio_unitario_del_articulo AS precio_en_factura,
    a.precio_unitario AS precio_actual_articulo
FROM detalle_de_factura df
JOIN articulo a ON df.codigo_de_articulo = a.codigo_del_articulo
WHERE df.precio_unitario_del_articulo <> a.precio_unitario;
