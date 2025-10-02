INSERT INTO clientes (codigo_del_cliente, nombre_del_cliente) VALUES
(100, 'Cliente Prueba');
('C001', 'Ana S.A. de C.V.'),
('C002', 'Beta, S. de R.L.');

INSERT INTO articulo (codigo_del_articulo, nombre_del_articulo, precio_unitario) VALUES
('A100', 'Articulo Prueba', 50.00);
('A001', 'Arroz 1kg', 25.00),
('A002', 'Frijol 1kg', 30.00),
('A003', 'Aceite 1L', 50.00);

INSERT INTO factura (sucursal, numero_de_factura, fecha_de_la_factura, forma_de_pago_factura, codigo_del_cliente, total_de_la_factura) VALUES
('S1', 1, CURRENT_DATE, 'Efectivo', 100, 100.00);
('S1', 1, CURRENT_DATE, 'Efectivo', 'C001', 80.00),
('S1', 2, CURRENT_DATE, 'Tarjeta',  'C002', 50.00);

INSERT INTO detalle_de_factura (sucursal, numero_de_factura, codigo_de_articulo, cantidad_del_articulo, precio_unitario_del_articulo, subtotal_del_articulo) VALUES
('S1', 1, 'A100', 2, 50.00, 100.00);
INSERT INTO detalle_de_factura
(sucursal, numero_de_factura, codigo_de_articulo, cantidad_del_articulo, precio_unitario_del_articulo, subtotal_del_articulo) VALUES
('S1', 1, 'A001', 2, 25.00, 50.00),
('S1', 1, 'A002', 1, 30.00, 30.00),

('S1', 2, 'A003', 1, 50.00, 50.00);
