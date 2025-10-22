-- Consulta para obtener el reporte de ventas por cliente
SELECT 
    c.codigo_del_cliente,
    c.nombre_del_cliente,
    f.sucursal,
    f.numero_de_factura,
    f.fecha_de_la_factura,
    f.total_de_la_factura,
    df.codigo_de_articulo,
    a.nombre_del_articulo,
    df.cantidad_del_articulo,
    df.precio_unitario_del_articulo,
    df.subtotal_del_articulo
FROM clientes c
JOIN factura f ON c.codigo_del_cliente = f.codigo_del_cliente
JOIN detalle_de_factura df ON f.sucursal = df.sucursal AND f.numero_de_factura = df.numero_de_factura
JOIN articulo a ON df.codigo_de_articulo = a.codigo_del_articulo
ORDER BY f.fecha_de_la_factura, f.numero_de_factura;
