INSERT INTO Clientes (codigo_cliente, nombre_cliente) VALUES
(1, 'Erik De La Rosa'),
(2, 'Nestor Garza'),
(3, 'Juan Cabrera'),
(4, 'Francisco Ordaz');

INSERT INTO Articulos (codigo_articulo, nombre_articulo, precio_unitario) VALUES
(101, 'Laptop', 25000.00),
(102, 'Mouse', 450.50),
(103, 'Teclado', 1800.75),
(104, 'Monitor', 7500.00),
(105, 'Webcam', 950.00);

INSERT INTO Stock (codigo_articulo, cantidad_disponible) VALUES
(101, 50),
(102, 200),
(103, 75),
(104, 40),
(105, 150);

INSERT INTO Facturas (sucursal, numero_factura, fecha_factura, forma_pago_factura, codigo_cliente, total_factura) VALUES
('NTE', 1001, '2025-09-28', 'TDC', 1, 27250.50),
('SUR', 2001, '2025-09-29', 'Efectivo', 2, 8450.00),
('NTE', 1002, '2025-10-01', 'Transferencia', 3, 901.00);

-- Detalle para la factura NTE-1001
INSERT INTO DetalleFactura (sucursal, numero_factura, codigo_articulo, cantidad_articulo, subtotal_articulo) VALUES
('NTE', 1001, 101, 1, 25000.00), -- 1 Laptop
('NTE', 1001, 103, 1, 1800.75),  -- 1 Teclado
('NTE', 1001, 102, 1, 450.50);    -- 1 Mouse

-- Detalle para la factura SUR-2001
INSERT INTO DetalleFactura (sucursal, numero_factura, codigo_articulo, cantidad_articulo, subtotal_articulo) VALUES
('SUR', 2001, 104, 1, 7500.00), -- 1 Monitor
('SUR', 2001, 105, 1, 950.00);   -- 1 Webcam

-- Detalle para la factura NTE-1002
INSERT INTO DetalleFactura (sucursal, numero_factura, codigo_articulo, cantidad_articulo, subtotal_articulo) VALUES
('NTE', 1002, 102, 2, 901.00);    -- 2 Mouses
