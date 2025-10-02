INSERT INTO clientes (codigo_del_cliente, nombre_del_cliente) VALUES
('C001', 'Juan Pérez'),
('C002', 'María López'),
('C003', 'Carlos Gómez'),
('C004', 'Ana Torres'),
('C005', 'Luis Ramírez');

INSERT INTO articulo (codigo_del_articulo, nombre_del_articulo, precio_unitario) VALUES
('A101', 'Teclado', 500.00),
('A102', 'Mouse', 250.00),
('A103', 'Monitor', 3000.00),
('A104', 'CPU', 8000.00),
('A105', 'Audífonos', 700.00);

INSERT INTO factura (sucursal, numero_de_factura, fecha_de_la_factura, forma_de_pago_factura, codigo_del_cliente, total_de_la_factura) VALUES
('SUC01', 1001, '2025-10-01', 'Efectivo', 'C001', 1250.00),
('SUC01', 1002, '2025-10-02', 'Tarjeta', 'C002', 3000.00),
('SUC02', 2001, '2025-10-01', 'Efectivo', 'C003', 500.00),
('SUC02', 2002, '2025-10-03', 'Crédito', 'C004', 16000.00),
('SUC03', 3001, '2025-10-04', 'Tarjeta', 'C005', 2100.00);

INSERT INTO detalle_de_factura (sucursal, numero_de_factura, codigo_de_articulo, cantidad_del_articulo, precio_unitario_del_articulo, subtotal_del_articulo) VALUES
('SUC01', 1001, 'A101', 2, 500.00, 1000.00),
('SUC01', 1001, 'A102', 1, 250.00, 250.00),
('SUC01', 1002, 'A103', 1, 3000.00, 3000.00),
('SUC02', 2001, 'A101', 1, 500.00, 500.00),
('SUC02', 2002, 'A104', 2, 8000.00, 16000.00),
('SUC03', 3001, 'A105', 3, 700.00, 2100.00);
