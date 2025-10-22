INSERT INTO clientes (codigo_del_cliente, nombre_del_cliente) VALUES
('C001', 'Juan Pérez'),
('C002', 'María García'),
('C003', 'Carlos López'),
('C004', 'Ana Martínez'),
('C005', 'Pedro Rodríguez');

INSERT INTO articulo (codigo_del_articulo, nombre_del_articulo, precio_unitario) VALUES
('A001', 'Laptop Dell', 1200.00),
('A002', 'Mouse Inalámbrico', 25.50),
('A003', 'Teclado Mecánico', 85.00),
('A004', 'Monitor 24"', 300.00),
('A005', 'Impresora Laser', 450.00);

INSERT INTO factura (sucursal, numero_de_factura, fecha_de_la_factura, forma_de_pago_factura, codigo_del_cliente, total_de_la_factura) VALUES
('S001', 1, '2024-01-15', 'Tarjeta de Crédito', 'C001', 1225.50),
('S001', 2, '2024-01-16', 'Efectivo', 'C002', 85.00),
('S002', 1, '2024-01-17', 'Transferencia', 'C003', 750.00),
('S001', 3, '2024-01-18', 'Tarjeta de Débito', 'C004', 300.00),
('S002', 2, '2024-01-19', 'Efectivo', 'C005', 450.00);

INSERT INTO detalle_de_factura (sucursal, numero_de_factura, codigo_de_articulo, cantidad_del_articulo, precio_unitario_del_articulo, subtotal_del_articulo) VALUES
('S001', 1, 'A001', 1, 1200.00, 1200.00),
('S001', 1, 'A002', 1, 25.50, 25.50),
('S001', 2, 'A003', 1, 85.00, 85.00),
('S002', 1, 'A001', 1, 1200.00, 1200.00),
('S002', 1, 'A005', 1, 450.00, 450.00),
('S001', 3, 'A004', 1, 300.00, 300.00),
('S002', 2, 'A005', 1, 450.00, 450.00);
