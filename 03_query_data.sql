SELECT 
    f.sucursal,
    f.numero_de_factura,
    f.total_de_la_factura as total_factura,
    SUM(df.subtotal_del_articulo) as suma_subtotales,
    CASE 
        WHEN f.total_de_la_factura = SUM(df.subtotal_del_articulo) THEN 'CORRECTO'
        ELSE 'ERROR'
    END as estado
FROM factura f
JOIN detalle_de_factura df ON f.sucursal = df.sucursal AND f.numero_de_factura = df.numero_de_factura
GROUP BY f.sucursal, f.numero_de_factura, f.total_de_la_factura;
