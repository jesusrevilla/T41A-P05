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

