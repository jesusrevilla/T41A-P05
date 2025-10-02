INSERT INTO clientes(codigo_del_cliente,nombre_del_cliente) VALUES('C145','Juan'),('C189','Pedro'),('C100', 'Cliente Prueba');

INSERT INTO factura(sucursal,numero_de_factura,fecha_de_la_factura,forma_de_pago_factura,codigo_del_cliente,total_de_la_factura) VALUES
('Paseo',198,NOW(),'CC','C145',1524.50),('Dorado',193,NOW(),'E','C189',1128.70),('S1', 1, CURRENT_DATE, 'Efectivo', 'C100', 100.00);

INSERT INTO articulo(codigo_de_articulo,nombre_del_articulo,precio_unitario) VALUES
  ('15','salchicha',20.50),('58','huevo',49.20),('A100', 'Articulo Prueba', 50.00);

INSERT INTO detalleFactura(sucursal,numero_de_factura,codigo_de_articulo,cantidad_del_articulo,precio_unitario_del_articulo,subtotal_del_articulo) VALUES
('Paseo',198,'15',2,20.50,41.50),('Dorado',193,'58',1,49.20,49.20),('S1', 1, 'A100', 2, 50.00, 100.00);
