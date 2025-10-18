SELECT 
    f.sucursal || '-' || f.numero_de_factura as "Sucursal y número de factura",
    TO_CHAR(f.fecha_de_la_factura, 'DD/MM/YY') as "Fecha de la factura",
    f.forma_de_pago_factura as "Forma de pago factura",
    f.codigo_del_cliente as "Código del cliente",
    c.nombre_del_cliente as "Nombre del cliente",
    df.codigo_de_articulo as "Código del artículo",
    a.nombre_del_articulo as "Nombre del artículo",
    df.cantidad_del_articulo as "Cantidad del artículo",
    df.precio_unitario_del_articulo as "Precio unitario del artículo",
    df.subtotal_del_articulo as "Subtotal del artículo",
    f.total_de_la_factura as "Total de la factura"
FROM factura f
JOIN clientes c ON f.codigo_del_cliente = c.codigo_del_cliente
JOIN detalle_de_factura df ON f.sucursal = df.sucursal AND f.numero_de_factura = df.numero_de_factura
JOIN articulo a ON df.codigo_de_articulo = a.codigo_del_articulo
ORDER BY f.sucursal, f.numero_de_factura, df.codigo_de_articulo;
