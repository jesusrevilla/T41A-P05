INSERT INTO forma_pago VALUES ('EFEC'), ('TARJ'), ('TRNSF');

INSERT INTO clientes VALUES
(1, 'Juan Pérez'),
(2, 'María Gómez');

INSERT INTO articulo VALUES
('A101', 'Teclado', 250.00),
('A102', 'Mouse', 150.00),
('A103', 'Monitor', 3500.00);

INSERT INTO factura VALUES
('Sucursal Norte', 1001, '2025-10-01', 'EFEC', 1, 3750.00),
('Sucursal Sur', 1002, '2025-10-01', 'TARJ', 2, 4000.00);

INSERT INTO detalle_de_factura VALUES
('Sucursal Norte', 1001, 'A101', 2, 250.00, 500.00),
('Sucursal Norte', 1001, 'A103', 1, 3500.00, 3500.00),
('Sucursal Sur', 1002, 'A102', 5, 150.00, 750.00),
('Sucursal Sur', 1002, 'A103', 1, 3500.00, 3500.00);
