INSERT INTO clientes (codigo_del_cliente, nombre_del_cliente) VALUES
('C01', 'Erik De La Rosa'),
('C02', 'Nestor Garza'),
('C03', 'Juan Cabrera'),
('C04', 'Francisco Ordaz');

INSERT INTO articulo (codigo_del_articulo, nombre_del_articulo, precio_unitario) VALUES
('A101', 'Laptop', 25000.00),
('A102', 'Mouse', 450.50),
('A103', 'Teclado', 1800.75),
('A104', 'Monitor', 7500.00),
('A105', 'Webcam', 950.00);

INSERT INTO stock (codigo_del_articulo, cantidad_disponible) VALUES
('A101', 50),
('A102', 200),
('A103', 75),
('A104', 40),
('A105', 150);

INSERT INTO factura (sucursal, numero_de_factura, fecha_de_la_factura, forma_de_pago_factura, codigo_del_cliente, total_de_la_factura) VALUES
('NTE', 1001, '2025-09-28', 'TDC', 'C01', 27250.50),
('SUR', 2001, '2025-09-29', 'Efectivo', 'C02', 8450.00),
('NTE', 1002, '2025-10-01', 'Transferencia', 'C03', 901.00);

INSERT INTO detalle_de_factura (sucursal, numero_de_factura, codigo_de_articulo, cantidad_del_articulo, precio_unitario_del_articulo, subtotal_del_articulo) VALUES
('NTE', 1001, 'A101', 1, 25000.00, 25000.00),
('NTE', 1001, 'A103', 1, 1800.75, 1800.75),
('NTE', 1001, 'A102', 1, 450.50, 450.50);

INSERT INTO detalle_de_factura (sucursal, numero_de_factura, codigo_de_articulo, cantidad_del_articulo, precio_unitario_del_articulo, subtotal_del_articulo) VALUES
('SUR', 2001, 'A104', 1, 7500.00, 7500.00),
('SUR', 2001, 'A105', 1, 950.00, 950.00);

INSERT INTO detalle_de_factura (sucursal, numero_de_factura, codigo_de_articulo, cantidad_del_articulo, precio_unitario_del_articulo, subtotal_del_articulo) VALUES
('NTE', 1002, 'A102', 2, 450.50, 901.00);
