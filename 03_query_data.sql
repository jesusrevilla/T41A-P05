SELECT 
    d.sucursal AS sucursal,
    d.numero_de_factura AS numero_de_factura,
    d.codigo_de_articulo AS codigo_de_articulo,
    d.cantidad_del_articulo AS cantidad_del_articulo,
    d.precio_unitario_del_articulo AS precio_unitario_del_articulo,
    d.subtotal_del_articulo AS subtotal_del_articulo
FROM detalle_de_factura d;
