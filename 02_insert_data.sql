-- =========================
-- TABLA CLIENTES
-- =========================
INSERT INTO clientes (codigo_del_cliente, nombre_del_cliente)
VALUES
('C001', 'Juan Pérez'),
('C002', 'María López'),
('C003', 'Carlos Sánchez'),
('C004', 'Ana Martínez'),
('C005', 'Luis Ramírez');

-- =========================
-- TABLA FACTURA
-- =========================
INSERT INTO factura (sucursal, numero_de_factura, fecha_de_la_factura, forma_de_pago_factura, codigo_del_cliente, total_de_la_factura)
VALUES
('S01', 1001, '2025-09-01', 'Efectivo', 'C001', 250.50),
('S01', 1002, '2025-09-02', 'Tarjeta', 'C002', 120.00),
('S02', 2001, '2025-09-03', 'Transferencia', 'C003', 340.75),
('S02', 2002, '2025-09-04', 'Efectivo', 'C004', 560.20),
('S03', 3001, '2025-09-05', 'Tarjeta', 'C005', 95.00);

-- =========================
-- TABLA ARTICULO
-- =========================
INSERT INTO articulo (codigo_del_articulo, nombre_del_articulo, precio_unitario)
VALUES
('A001', 'Teclado', 15.50),
('A002', 'Mouse', 10.25),
('A003', 'Monitor', 20.00),
('A004', 'Impresora', 85.75),
('A005', 'USB 32GB', 8.99);

-- =========================
-- TABLA DETALLE_DE_FACTURA
-- =========================
INSERT INTO detalle_de_factura (sucursal, numero_de_factura, codigo_de_articulo, cantidad_del_articulo, precio_unitario_del_articulo, subtotal_del_articulo)
VALUES
('S01', 1001, 'A001', 2, 15.50, 31.00),
('S01', 1001, 'A002', 1, 10.25, 10.25),
('S01', 1002, 'A003', 1, 20.00, 120.00),
('S02', 2001, 'A004', 2, 85.75, 171.50),
('S03', 3001, 'A005', 5, 8.99, 44.95);

