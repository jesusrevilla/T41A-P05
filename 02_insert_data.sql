INSERT INTO cliente(codigo_de_cliente,nombre_del_cliente) VALUES(145,'Juan'),(189,'Pedro'),('C100', 'Cliente Prueba');
INSERT INTO factura(sucursal,numero_de_factura,fecha_de_la_factura,forma_de_pago_factura,codigo_de_cliente,total_de_la_factura) VALUES
('Paseo','198A',NOW(),'CC',145,1524.50),('Dorado','193C',NOW(),'E',189,1128.70),('S1', 1, CURRENT_DATE, 'Efectivo', 'C100', 100.00);
INSERT INTO articulo(codigo_de_articulo,nombre_del_articulo,precio_unitario) VALUES('15','salchicha',20.50),('58','huevo',49.20),('A100', 'Articulo Prueba', 50.00);
INSERT INTO detalleFactura(sucursal,numero_de_factura,codigo_de_articulo,cantidad_del_articulo,precio_unitario_del_articulo,subtotal_del_articulo) VALUES
('Paseo','198A','15',2,20.50,41.50),('Dorado','193C','58',1,49.20,49.20),('S1', 1, 'A100', 2, 50.00, 100.00);
