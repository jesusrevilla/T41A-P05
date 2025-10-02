INSERT INTO Clientes (codigo_del_cliente, nombre_del_cliente) VALUES
('C001', 'Juan Pérez'),      -- Cambiado a C001
('C002', 'María García'),    -- Cambiado a C002
('C003', 'Carlos López'),    -- Cambiado a C003
('C004', 'Ana Martínez'),    -- Cambiado a C004
('C005', 'Pedro Rodríguez'); -- Cambiado a C005

INSERT INTO Articulo (codigo_de_articulo, nombre_del_articulo, precio_unitario) VALUES
('A001', 'Laptop HP', 850.00),      -- Cambiado a A001
('A002', 'Teclado Mecánico', 75.50), -- Cambiado a A002
('A003', 'Mouse Inalámbrico', 25.00),-- Cambiado a A003
('A004', 'Monitor 24"', 300.00),     -- Cambiado a A004
('A005', 'Impresora Laser', 200.00); -- Cambiado a A005

INSERT INTO Factura (sucursal, numero_de_factura, fecha_de_la_factura, forma_de_pago_factura, codigo_del_cliente, total_de_la_factura) VALUES
('S1', '001', '2024-01-15', 'EF', 'C001', 925.00),
('S1', '002', '2024-01-16', 'TC', 'C002', 125.50),
('S1', '003', '2024-01-17', 'TD', 'C003', 300.00),
('S2', '001', '2024-01-18', 'EF', 'C004', 1100.00),
('S2', '002', '2024-01-19', 'TC', 'C005', 75.50);

INSERT INTO Detalle_de_Factura (sucursal, numero_de_factura, codigo_de_articulo, cantidad, precio_unitario, subtotal_articulo) VALUES

('S1', '001', 'A001', 1, 850.00, 850.00),
('S1', '001', 'A003', 3, 25.00, 75.00),

('S1', '002', 'A002', 1, 75.50, 75.50),
('S1', '002', 'A003', 2, 25.00, 50.00),

('S1', '003', 'A004', 1, 300.00, 300.00),

('S2', '001', 'A001', 1, 850.00, 850.00),
('S2', '001', 'A005', 1, 200.00, 200.00),
('S2', '001', 'A003', 2, 25.00, 50.00),

('S2', '002', 'A002', 1, 75.50, 75.50);
