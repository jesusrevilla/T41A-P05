SELECT
    f.numero_de_factura,
    f.fecha_de_la_factura,
    f.total_de_la_factura,
    c.nombre_del_cliente
FROM
    factura AS f
JOIN
    clientes AS c ON f.codigo_del_cliente = c.codigo_del_cliente;
