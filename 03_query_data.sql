SELECT 
SELECT
    f.sucursal,
    f.numero_de_factura,
    f.fecha_de_la_factura,
@@ -15,4 +15,3 @@ JOIN clientes c ON f.codigo_del_cliente = c.codigo_del_cliente
JOIN detalle_de_factura df ON f.sucursal = df.sucursal AND f.numero_de_factura = df.numero_de_factura
JOIN articulo a ON df.codigo_de_articulo = a.codigo_del_articulo
WHERE f.sucursal = 'S1' AND f.numero_de_factura = 1;
