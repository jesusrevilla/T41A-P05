SELECT
    F.sucursal,
    F.numero_de_factura,
    F.fecha_de_la_factura,
    C.nombre_del_cliente,
    A.nombre_del_articulo,
    DF.cantidad_del_articulo,
    DF.precio_unitario_del_articulo,
    DF.subtotal_del_articulo
FROM
    factura AS F
JOIN
    clientes AS C ON F.codigo_del_cliente = C.codigo_del_cliente
JOIN
    detalle_de_factura AS DF ON F.sucursal = DF.sucursal AND F.numero_de_factura = DF.numero_de_factura
JOIN
    articulo AS A ON DF.codigo_de_articulo = A.codigo_del_articulo
ORDER BY
    F.sucursal, F.numero_de_factura;
