-- INSERTAR EN CLIENTES 
INSERT INTO clientes (nombre_del_cliente) VALUES
('Ana Martínez'),
('Luis Pérez'),
('Carla Gómez'),
('Miguel Torres'),
('Laura Ruiz');

-- INSERTAR EN FACTURA 
INSERT INTO factura (sucursal, numero_de_factura, fecha_de_la_factura, forma_de_pago_factura, codigo_del_cliente, total_de_la_factura) VALUES
(1, 1001, '2025-09-15', 'EF', 1, 150.50),
(1, 1002, '2025-09-16', 'TC', 2, 200.00),
(2, 1003, '2025-09-17', 'EF', 3, 75.00),
(2, 1004, '2025-09-18', 'TD', 4, 320.75),
(3, 1005, '2025-09-19', 'TC', 5, 180.20);

-- INSRETAR EN ARTICULO

INSERT INTO articulo (nombre_del_articulo, precio_unitario) VALUES
('Lápiz', 0.50),
('Cuaderno', 2.30),
('Regla', 1.10),
('Mochila', 25.00),
('Bolígrafo', 1.20);


--INSERTAR EN DETALLE FACTURA 
INSERT INTO detalle_de_factura (sucursal, numero_de_factura, codigo_de_articulo, cantidad_del_articulo, precio_unitario_del_articulo, subtotal_del_articulo) VALUES
(1, 1001, 1, 10, 0.50, 5.00),
(1, 1001, 2, 5, 2.30, 11.50),
(1, 1002, 4, 2, 25.00, 50.00),
(2, 1003, 3, 3, 1.10, 3.30),
(3, 1005, 5, 10, 1.20, 12.00);


