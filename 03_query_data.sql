SELECT 
    f.sucursal,
    f.numero_factura,
    f.fecha_factura,
    f.forma_pago_factura,
    f.total_factura,
    c.codigo_cliente,
    c.nombre_cliente
FROM facturas f
JOIN clientes c ON f.codigo_cliente = c.codigo_cliente
ORDER BY f.sucursal, f.numero_factura;

SELECT 
    f.sucursal,
    f.numero_factura,
    f.fecha_factura,
    f.forma_pago_factura,
    c.nombre_cliente,
    a.codigo_articulo,
    a.nombre_articulo,
    d.cantidad_articulo,
    a.precio_unitario_articulo,
    d.subtotal_articulo
FROM detalle_factura d
JOIN facturas f ON d.sucursal = f.sucursal AND d.numero_factura = f.numero_factura
JOIN clientes c ON f.codigo_cliente = c.codigo_cliente
JOIN articulos a ON d.codigo_articulo = a.codigo_articulo
WHERE f.sucursal = '01' AND f.numero_factura = '500';

SELECT 
    sucursal,
    SUM(total_factura) AS total_vendido
FROM facturas
GROUP BY sucursal
ORDER BY sucursal;

SELECT 
    a.codigo_articulo,
    a.nombre_articulo,
    SUM(d.cantidad_articulo) AS cantidad_total_vendida,
    SUM(d.subtotal_articulo) AS total_recaudado
FROM detalle_factura d
JOIN articulos a ON d.codigo_articulo = a.codigo_articulo
GROUP BY a.codigo_articulo, a.nombre_articulo
ORDER BY cantidad_total_vendida DESC;

