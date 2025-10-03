SELECT df.*, art.nombre_articulo
FROM detalle_factura df
JOIN articulos art 
  ON art.codigo_articulo = df.codigo_articulo;

