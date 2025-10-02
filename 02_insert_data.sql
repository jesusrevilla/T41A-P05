INSERT INTO Clientes (codigo_del_cliente, nombre_del_cliente) VALUES
('C01', 'Juan Pérez'),
('C02', 'María García'),
('C03', 'Carlos López'),
('C04', 'Ana Martínez'),
('C05', 'Pedro Rodríguez');

INSERT INTO Articulo (codigo_del_articulo, nombre_del_articulo, precio_unitario) VALUES
('A01', 'Laptop HP', 850.00),      
('A02', 'Teclado Mecánico', 75.50), 
('A03', 'Mouse Inalámbrico', 25.00),
('A04', 'Monitor 24"', 300.00),   
('A05', 'Impresora Laser', 200.00); 

INSERT INTO Factura (sucursal, numero_de_factura, fecha_de_la_factura, forma_de_pago_factura, codigo_del_cliente, total_factura) VALUES
('S1', '001', '2024-01-15', 'EF', 'C01', 925.00),
('S1', '002', '2024-01-16', 'TC', 'C02', 125.50),
('S1', '003', '2024-01-17', 'TD', 'C03', 300.00),
('S2', '001', '2024-01-18', 'EF', 'C04', 1100.00),
('S2', '002', '2024-01-19', 'TC', 'C05', 75.50);

INSERT INTO Detalle_Factura (sucursal, numero_de_factura, codigo_del_articulo, cantidad, precio_unitario, subtotal_articulo) VALUES
('S1', '001', 'A01', 1, 850.00, 850.00),
('S1', '001', 'A03', 3, 25.00, 75.00),

('S1', '002', 'A02', 1, 75.50, 75.50),
('S1', '002', 'A03', 2, 25.00, 50.00),

('S1', '003', 'A04', 1, 300.00, 300.00),

('S2', '001', 'A01', 1, 850.00, 850.00),
('S2', '001', 'A05', 1, 200.00, 200.00),
('S2', '001', 'A03', 2, 25.00, 50.00),

('S2', '002', 'A02', 1, 75.50, 75.50);
