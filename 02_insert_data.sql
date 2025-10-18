INSERT INTO clientes (codigo_del_cliente, nombre_del_cliente) VALUES
('01', 'ALVAREZ'),
('107', 'CASTRO'),
('110', 'LIZ');

INSERT INTO articulo (codigo_del_articulo, nombre_del_articulo, precio_unitario) VALUES
('01', 'LÁPIZ', 1.25),
('02', 'GOMA', 0.75),
('08', 'COMPÁS', 4.00),
('10', 'HOJAS', 5.00),
('20', 'REGLA', 2.45),
('A100', 'Articulo Prueba', 50.00);

INSERT INTO factura (sucursal, numero_de_factura, fecha_de_la_factura, forma_de_pago_factura, codigo_del_cliente, total_de_la_factura) VALUES
('01', 500, '2006-01-01', 'E', '01', 48.20),
('01', 501, '2006-01-02', 'CC', '107', 16.00),
('02', 500, '2006-01-03', 'E', '110', 14.90),
('S1', 1, '2024-01-01', 'E', '01', 100.00);

INSERT INTO detalle_de_factura (sucursal, numero_de_factura, codigo_de_articulo, cantidad_del_articulo, precio_unitario_del_articulo, subtotal_del_articulo) VALUES
('01', 500, '01', 3, 1.25, 3.75),
('01', 500, '02', 6, 0.75, 4.50),
('01', 500, '10', 8, 5.00, 40.00),
('01', 501, '08', 4, 4.00, 16.00),
('02', 500, '20', 2, 2.45, 4.90),
('02', 500, '10', 2, 5.00, 10.00),
('S1', 1, 'A100', 2, 50.00, 100.00);
