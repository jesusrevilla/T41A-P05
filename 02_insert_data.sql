-- Inserciones de prueba
-- Clientes
INSERT INTO clientes (codigo_del_cliente, nombre_del_cliente)
VALUES
('CL001', 'Juan Pérez'),
('CL002', 'María López'),
('CL003', 'Empresa XYZ S.A. de C.V.');

-- Artículos
INSERT INTO articulo (codigo_del_articulo, nombre_del_articulo, precio_unitario)
VALUES
('AR001', 'Laptop Dell Inspiron', 15000.00),
('AR002', 'Mouse Logitech', 350.00),
('AR003', 'Monitor LG 24"', 4200.00);

-- Facturas
INSERT INTO factura (sucursal, numero_de_factura, fecha_de_la_factura, forma_de_pago_factura, codigo_del_cliente, total_de_la_factura)
VALUES
('S01', 'F001', '2025-10-01', 'EFECTIVO', 'CL001', 15350.00),
('S01', 'F002', '2025-10-01', 'TARJETA', 'CL002', 4200.00),
('S02', 'F003', '2025-10-01', 'TRANSFERENCIA', 'CL003', 19200.00);

-- Detalles de Factura
INSERT INTO detalle_de_factura (sucursal, numero_de_factura, codigo_de_articulo, cantidad_del_articulo, precio_unitario_del_articulo, subtotal_del_articulo)
VALUES
('S01', 'F001', 'AR001', 1, 15000.00, 15000.00),
('S01', 'F001', 'AR002', 1, 350.00, 350.00),
('S01', 'F002', 'AR003', 1, 4200.00, 4200.00),
('S02', 'F003', 'AR001', 1, 15000.00, 15000.00),
('S02', 'F003', 'AR003', 1, 4200.00, 4200.00);
