-- Inserciones de prueba

-- Clientes
INSERT INTO cliente (cod_cliente, nom_cliente)
VALUES 
('C001', 'Juan Pérez'),
('C002', 'María López'),
('C003', 'Empresa XYZ S.A. de C.V.');

-- Artículos
INSERT INTO articulo (cod_articulo, nom_articulo, precio_unitario)
VALUES
('A001', 'Laptop Dell Inspiron', 15000.00),
('A002', 'Mouse Logitech', 350.00),
('A003', 'Monitor LG 24"', 4200.00);

-- Facturas
INSERT INTO factura (sucursal, numero_factura, fecha_factura, forma_pago, cod_cliente, total_factura)
VALUES
('S01', 'F0001', '2025-09-01', 'EFECTIVO', 'C001', 15350.00),
('S01', 'F0002', '2025-09-02', 'TARJETA', 'C002', 4200.00),
('S02', 'F0003', '2025-09-03', 'TRANSFERENCIA', 'C003', 19200.00);

-- Detalles de Factura
INSERT INTO detalle_factura (sucursal, numero_factura, cod_articulo, cantidad_articulo)
VALUES
('S01', 'F0001', 'A001', 1), -- Laptop Dell
('S01', 'F0001', 'A002', 1), -- Mouse Logitech
('S01', 'F0002', 'A003', 1), -- Monitor LG
('S02', 'F0003', 'A001', 1), -- Laptop Dell
('S02', 'F0003', 'A003', 1); -- Monitor LG
