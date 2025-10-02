
-- Insertar datos en la tabla Sucursal
INSERT INTO Sucursal (id_sucursal, nombre_sucursal) VALUES
('01', 'Sucursal 01'),
('02', 'Sucursal 02');

-- Insertar datos en la tabla Cliente
INSERT INTO Cliente (id_cliente, nombre_cliente) VALUES
('01', 'ALVAREZ'),
('107', 'CASTRO'),
('110', 'LIZ');

-- Insertar datos en la tabla Articulo
INSERT INTO Articulo (id_articulo, nombre_articulo, precio_unitario) VALUES
('01', 'LÁPIZ', 1.25),
('02', 'GOMA', 0.75),
('08', 'COMPÁS', 4.00),
('10', 'HOJAS', 5.00),
('20', 'REGLA', 2.45);

-- Insertar datos en la tabla Factura
INSERT INTO Factura (id_factura, id_sucursal, id_cliente, fecha, forma_pago, total) VALUES
('01-500', '01', '01', '2006-01-01', 'E', 48.20),
('01-501', '01', '107', '2006-01-02', 'CC', 16.00),
('02-500', '02', '110', '2006-01-03', 'E', 14.90);

-- Insertar datos en la tabla DetalleFactura
INSERT INTO DetalleFactura (id_factura, id_articulo, cantidad, subtotal) VALUES
-- Factura 01-500
('01-500', '01', 3, 3.75),
('01-500', '02', 6, 4.50),
('01-500', '10', 8, 40.00),
-- Factura 01-501
('01-501', '08', 4, 16.00),
-- Factura 02-500
('02-500', '20', 2, 4.90),
('02-500', '10', 2, 10.00);
