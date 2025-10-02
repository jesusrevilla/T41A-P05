SELECT 
    f.sucursal,
    f.numero_factura,
    f.fecha_factura,
    c.nombre_cliente,
    f.forma_pago,
    f.total_factura
FROM Factura f
JOIN Clientes c ON f.codigo_cliente = c.codigo_cliente
ORDER BY f.fecha_factura DESC;
