SELECT
    c.nombre_del_cliente,
    SUM(f.total_de_la_factura) AS total_comprado
FROM
    factura f
JOIN
    clientes c ON f.codigo_del_cliente = c.codigo_del_cliente
GROUP BY
    c.nombre_del_cliente
ORDER BY
    total_comprado DESC;

SELECT
    a.nombre_del_articulo,
    SUM(df.cantidad_del_articulo) AS unidades_vendidas
FROM
    detalle_de_factura df
JOIN
    articulo a ON df.codigo_de_articulo = a.codigo_del_articulo
GROUP BY
    a.nombre_del_articulo
ORDER BY
    unidades_vendidas DESC;

SELECT
    f.sucursal,
    f.numero_de_factura,
    f.fecha_de_la_factura,
    c.nombre_del_cliente,
    a.nombre_del_articulo,
    df.cantidad_del_articulo,
    df.precio_unitario_del_articulo,
    df.subtotal_del_articulo
FROM
    factura f
JOIN
    clientes c ON f.codigo_del_cliente = c.codigo_del_cliente
JOIN
    detalle_de_factura df ON f.sucursal = df.sucursal AND f.numero_de_factura = df.numero_de_factura
JOIN
    articulo a ON df.codigo_de_articulo = a.codigo_del_articulo
WHERE
    f.sucursal = 'S1' AND f.numero_de_factura = 1;
