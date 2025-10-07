INSERT INTO clientes (codigo_del_cliente, nombre_del_cliente)
VALUES ('C100', 'Cliente Prueba');

INSERT INTO articulo (codigo_del_articulo, nombre_del_articulo, precio_unitario)
VALUES ('A100', 'Articulo Prueba', 50.00);

INSERT INTO factura (sucursal, numero_de_factura, fecha_de_la_factura, forma_de_pago_factura, codigo_del_cliente, total_de_la_factura)
VALUES ('S1', 1, CURRENT_DATE, 'Efectivo', 'C100', 100.00);

INSERT INTO detalle_de_factura (sucursal, numero_de_factura, codigo_de_articulo, cantidad_del_articulo, precio_unitario_del_articulo, subtotal_del_articulo)
VALUES ('S1', 1, 'A100', 2, 50.00, 100.00);
