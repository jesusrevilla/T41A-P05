INSERT INTO Clientes (codigo_del_cliente, nombre_del_cliente) VALUES
('C001', 'Juan Pérez'),
('C002', 'María García'),
('C003', 'Carlos López'),
('C004', 'Ana Martínez'),
('C005', 'Pedro Rodríguez');

INSERT INTO Articulo (codigo_del_articulo, nombre_del_articulo, precio_unitario) VALUES
('A001', 'Laptop HP', 850.00),
('A002', 'Teclado Mecánico', 75.50),
('A003', 'Mouse Inalámbrico', 25.00),
('A004', 'Monitor 24"', 300.00),
('A005', 'Impresora Laser', 200.00);

INSERT INTO Factura (sucursal, numero_de_factura, fecha_de_la_factura, forma_de_pago_factura, codigo_del_cliente, total_de_la_factura) VALUES
('S1', 1, '2024-01-15', 'EF', 'C001', 925.00),
('S1', 2, '2024-01-16', 'TC', 'C002', 125.50),
('S1', 3, '2024-01-17', 'TD', 'C003', 300.00),
('S2', 1, '2024-01-18', 'EF', 'C004', 1100.00),
('S2', 2, '2024-01-19', 'TC', 'C005', 75.50);

INSERT INTO Detalle_de_Factura (sucursal, numero_de_factura, codigo_de_articulo, cantidad_del_articulo, precio_unitario_del_articulo, subtotal_del_articulo) VALUES
('S1', 1, 'A001', 1, 850.00, 850.00),
('S1', 1, 'A003', 3, 25.00, 75.00),
('S1', 2, 'A002', 1, 75.50, 75.50),
('S1', 2, 'A003', 2, 25.00, 50.00),
('S1', 3, 'A004', 1, 300.00, 300.00),
('S2', 1, 'A001', 1, 850.00, 850.00),
('S2', 1, 'A005', 1, 200.00, 200.00),
('S2', 1, 'A003', 2, 25.00, 50.00),
('S2', 2, 'A002', 1, 75.50, 75.50);


INSERT INTO Articulo (codigo_del_articulo, nombre_del_articulo, precio_unitario)
VALUES ('A100', 'Articulo Prueba', 50.00)
ON CONFLICT (codigo_del_articulo) DO NOTHING;

INSERT INTO Clientes (codigo_del_cliente, nombre_del_cliente)
VALUES ('C100', 'Cliente Prueba')
ON CONFLICT (codigo_del_cliente) DO NOTHING;

INSERT INTO Factura (sucursal, numero_de_factura, fecha_de_la_factura, forma_de_pago_factura, codigo_del_cliente, total_de_la_factura)
VALUES ('S1', 1, CURRENT_DATE, 'Efectivo', 'C100', 100.00)
ON CONFLICT (sucursal, numero_de_factura) DO NOTHING;

INSERT INTO Detalle_de_Factura (sucursal, numero_de_factura, codigo_de_articulo, cantidad_del_articulo, precio_unitario_del_articulo, subtotal_del_articulo)
VALUES ('S1', 1, 'A100', 2, 50.00, 100.00)
ON CONFLICT (sucursal, numero_de_factura, codigo_de_articulo) DO NOTHING;

DELETE FROM detalle_de_factura WHERE sucursal = 'S1' AND numero_de_factura = 1 AND codigo_de_articulo = 'A100';
DELETE FROM factura WHERE sucursal = 'S1' AND numero_de_factura = 1;
DELETE FROM articulo WHERE codigo_del_articulo = 'A100';
DELETE FROM clientes WHERE codigo_del_cliente = 'C100';
