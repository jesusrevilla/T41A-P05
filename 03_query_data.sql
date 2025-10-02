SELECT
    numero_de_factura, 
    nombre_del_cliente  
FROM
    factura
JOIN
    clientes ON factura.codigo_del_cliente = clientes.codigo_del_cliente;
