SELECT 
    f.sucursal,
    f.num_factura,
    f.fecha,
    f.forma_pago,
    f.cod_cliente,
    df.cod_articulo,
    df.cantidad
FROM 
    Factura_3FN f
JOIN 
    DetalleFactura_3FN df 
    ON f.sucursal = df.sucursal AND f.num_factura = df.num_factura
WHERE 
    f.num_factura = 1001 AND f.sucursal = 'SUC001';
    f.numero_de_factura,
    f.fecha_de_la_factura,
    f.forma_de_pago_factura,
    c.nombre_del_cliente,
    f.total_de_la_factura,
    df.codigo_de_articulo,
    a.nombre_del_articulo,
    df.cantidad_del_articulo,
    df.precio_unitario_del_articulo,
    df.subtotal_del_articulo
FROM factura f
JOIN clientes c ON f.codigo_del_cliente = c.codigo_del_cliente
JOIN detalle_de_factura df ON f.sucursal = df.sucursal AND f.numero_de_factura = df.numero_de_factura
JOIN articulo a ON df.codigo_de_articulo = a.codigo_del_articulo
WHERE f.sucursal = 'S1' AND f.numero_de_factura = 1;
