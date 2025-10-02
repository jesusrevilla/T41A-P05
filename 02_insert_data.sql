-- Insertar clientes
INSERT INTO clientes (codigo_del_cliente, nombre_del_cliente) VALUES
(1, 'Juan Pérez'),
(2, 'María López'),
(3, 'Carlos Gómez'),
(4, 'Ana Torres'),
(5, 'Luis Ramírez');

-- Insertar artículos
INSERT INTO articulo (codigo_del_articulo, nombre_del_articulo, precio_unitario) VALUES
(101, 'Teclado', 500.00),
(102, 'Mouse', 250.00),
(103, 'Monitor', 3000.00),
(104, 'CPU', 8000.00),
(105, 'Audífonos', 700.00);

-- Insertar facturas
INSERT INTO factura (sucursal, numero_de_factura, fecha_de_la_factura, forma_de_pago_factura, codigo_del_cliente, total_de_la_factura) VALUES
('SUC01', 1001, '2025-10-01', 'Efectivo', 1, 1250.00),
('SUC01', 1002, '2025-10-02', 'Tarjeta', 2, 3000.00),
('SUC02', 2001, '2025-10-01', 'Efectivo', 3, 500.00),
('SUC02', 2002, '2025-10-03', 'Crédito', 4, 16000.00),
('SUC03', 3001, '2025-10-04', 'Tarjeta', 5, 2100.00);

-- Insertar detalles de facturas
INSERT INTO detalle_de_factura (sucursal, numero_de_factura, codigo_de_articulo, cantidad_del_articulo, precio_unitario_del_articulo, subtotal_del_articulo) VALUES
('SUC01', 1001, 101, 2, 500.00, 1000.00),
('SUC01', 1001, 102, 1, 250.00, 250.00),
('SUC01', 1002, 103, 1, 3000.00, 3000.00),
('SUC02', 2001, 101, 1, 500.00, 500.00),
('SUC02', 2002, 104, 2, 8000.00, 16000.00),
('SUC03', 3001, 105, 3, 700.00, 2100.00);
