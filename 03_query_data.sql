SELECT 
    f.id_factura3,
    c.nombre_cliente3 AS cliente,
    s.nombre_sucursal3 AS sucursal,
    fp.tipo_pago3 AS forma_pago,
    f.fecha3,
    f.total_factura3
FROM factura3 f
JOIN cliente3 c ON f.codigo_cliente3 = c.codigo_cliente3
JOIN sucursal3 s ON f.id_sucursal3 = s.id_sucursal3
JOIN forma_pago3 fp ON f.id_forma_pago3 = fp.id_forma_pago3
ORDER BY f.id_factura3;
