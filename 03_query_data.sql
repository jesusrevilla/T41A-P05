SELECT a.nombre_del_articulo FROM detalle_de_factura d
JOIN articulo a ON d.codigo_de_articulo = a.codigo_del_articulo;
