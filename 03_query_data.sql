SELECT 
    f.sucursal,
    f.numero_factura,
    f.fecha_factura,
    c.nombre_cliente,
    a.nombre_articulo,
    df.cantidad_articulo,
    df.subtotal_articulo
FROM facturas f
JOIN clientes c ON f.codigo_cliente = c.codigo_cliente
JOIN detalle_factura df ON f.sucursal = df.sucursal AND f.numero_factura = df.numero_factura
JOIN articulos a ON df.codigo_articulo = a.codigo_articulo;
