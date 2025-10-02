SELECT 
    f.id_factura,
    f.sucursal,
    f.fecha,
    f.forma_pago,
    a.nombre_articulo,
    d.cantidad,
    a.precio_unitario,
    (d.cantidad * a.precio_unitario) AS total_parcial
FROM factura4 f
JOIN detalles_factura4 d ON f.id_factura = d.id_factura
JOIN articulo4 a ON d.codigo_articulo = a.codigo_articulo;
