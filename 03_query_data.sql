SELECT
    f.numero_factura,
    f.fecha_factura,
    f.total_factura,
    c.nombre AS nombre_cliente
FROM
    factura AS f
JOIN
    cliente AS c ON f.codigo_cliente = c.codigo;
