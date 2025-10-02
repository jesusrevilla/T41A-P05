SELECT * 
FROM Factura_3FN;

SELECT * 
FROM DetalleFactura_3FN;

SELECT f.sucursal, f.num_factura, f.fecha, f.forma_pago, f.cod_cliente, c.nombre_cliente
FROM Factura_3FN f
JOIN Cliente_2FN c ON f.cod_cliente = c.cod_cliente;

SELECT f.sucursal, f.num_factura, d.cod_articulo, a.nombre_articulo, d.cantidad
FROM Factura_3FN f
JOIN DetalleFactura_3FN d ON f.sucursal = d.sucursal AND f.num_factura = d.num_factura
JOIN Articulo_2FN a ON d.cod_articulo = a.cod_articulo
ORDER BY f.sucursal, f.num_factura;

