
select *,art.nombre_articulo from detalle_factura
join articulo art on art.codigo_articulo=detalle_factura.codigo_articulo;
