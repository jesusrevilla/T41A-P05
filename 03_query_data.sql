SELECT f.id_factura, f.fecha, f.forma_pago, f.total,
       s.nombre_sucursal,
       c.nombre_cliente
FROM Factura f
JOIN Sucursal s ON f.id_sucursal = s.id_sucursal
JOIN Cliente c ON f.id_cliente = c.id_cliente;

SELECT df.id_detalle, df.cantidad, df.subtotal,
       a.nombre_articulo, a.precio_unitario,
       f.id_factura, f.fecha, f.forma_pago
FROM DetalleFactura df
JOIN Articulo a ON df.id_articulo = a.id_articulo
JOIN Factura f ON df.id_factura = f.id_factura;



-- Total gastado por cada departamento




-- Total de gastos por día



-- Buscar proveedores cuyo nombre contiene 'Tech'




-- Mostrar nombre de usuario en mayúsculas
