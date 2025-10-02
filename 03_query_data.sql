SELECT
    F.sucursal,
    F.numero_factura,
    F.fecha_factura,
    C.nombre_cliente,
    A.nombre_articulo,
    DF.cantidad_articulo,
    A.precio_unitario,
    DF.subtotal_articulo
FROM
    Facturas AS F
JOIN
    Clientes AS C ON F.codigo_cliente = C.codigo_cliente
JOIN
    DetalleFactura AS DF ON F.sucursal = DF.sucursal AND F.numero_factura = DF.numero_factura
JOIN
    Articulos AS A ON DF.codigo_articulo = A.codigo_articulo
ORDER BY
    F.sucursal, F.numero_factura;
