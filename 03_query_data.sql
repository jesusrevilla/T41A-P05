SELECT f.sucursal,
       f.numero_factura,
       f.fecha_factura,
       f.forma_pago,
       c.nombre_cliente
FROM factura f
JOIN cliente c ON f.codigo_cliente = c.codigo_cliente;
