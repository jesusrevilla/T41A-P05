INSERT INTO cliente(codigo_de_cliente,nombre_del_cliente) VALUES(145,'Juan'),(189,'Pedro');
INSERT INTO factura(sucursal,numero_de_factura,fecha_de_la_factura,forma_de_pago_factura,codigo_de_cliente,total_de_la_factura) VALUES
('Paseo','198A',NOW(),'CC',145,1524.50),('Dorado','193C',NOW(),'E',189,1128.70);
INSERT INTO articulo(codigo_de_articulo,nombre_del_articulo,precio_unitario) VALUES(15,'salchicha',20.50),(58,'huevo',49.20);
INSERT INTO detalleFactura(sucursal,numero_de_factura,codigo_de_articulo,cantidad_del_articulo,precio_unitario_del_articulo,subtotal_del_articulo) VALUES
('Paseo','198A',15,2,20.50,41.50),('Dorado','193C',58,1,49.20,49.20);
