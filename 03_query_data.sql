SELECT F.sucursal, F.numero_factura, F.fecha_factura, C.nombre_cliente, FP.forma_pago, SUM(DF.cantidad_articulo * DF.precio_unitario) AS total_factura
FROM Factura F
JOIN Cliente C ON F.codigo_cliente = C.codigo_cliente JOIN FormaPago FP ON F.forma_pago = FP.forma_pago JOIN DetalleFactura DF ON F.sucursal = DF.sucursal AND F.numero_factura = DF.numero_factura
GROUP BY F.sucursal, F.numero_factura, F.fecha_factura, C.nombre_cliente, FP.forma_pago
ORDER BY F.fecha_factura;
