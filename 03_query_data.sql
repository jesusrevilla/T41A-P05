SELECT
    d.sucursal AS sucursal,
    d.numero_factura AS numero_de_factura,
    d.codigo_articulo AS codigo_de_articulo,
    d.cantidad_articulo AS cantidad_del_articulo,
    a.precio_unitario AS precio_unitario_del_articulo,
    (d.cantidad_articulo * a.precio_unitario) AS subtotal_del_articulo
FROM detalle_factura d
JOIN articulo a
    ON d.codigo_articulo = a.codigo_articulo;
