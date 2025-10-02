-- Insertar datos en la tabla Sucursal
INSERT INTO Sucursal (sucursal, nombre_sucursal) VALUES
('01', 'Sucursal 01'),
('02', 'Sucursal 02');

-- Insertar datos en la tabla clientes
INSERT INTO clientes (codigo_del_cliente, nombre_del_cliente) VALUES
('01', 'ALVAREZ'),
('107', 'CASTRO'),
('110', 'LIZ');

-- Insertar datos en la tabla articulo
INSERT INTO articulo (codigo_del_articulo, nombre_del_articulo, precio_unitario) VALUES
('01', 'LÁPIZ', 1.25),
('02', 'GOMA', 0.75),
('08', 'COMPÁS', 4.00),
('10', 'HOJAS', 5.00),
('20', 'REGLA', 2.45);

-- Insertar datos en la tabla factura
INSERT INTO factura (sucursal, numero_de_factura, codigo_del_cliente, fecha_de_la_factura, forma_de_pago_factura, total_de_la_factura) VALUES
('01', '500', '01', '2006-01-01', 'E', 48.20),
('01', '501', '107', '2006-01-02', 'CC', 16.00),
('02', '500', '110', '2006-01-03', 'E', 14.90);

-- Insertar datos en la tabla detalle_de_factura
INSERT INTO detalle_de_factura (sucursal, numero_de_factura, codigo_de_articulo, cantidad_del_articulo, precio_unitario_del_articulo, subtotal_del_articulo) VALUES
-- Factura 01-500
('01', '500', '01', 3, 1.25, 3.75),
('01', '500', '02', 6, 0.75, 4.50),
('01', '500', '10', 8, 5.00, 40.00),
-- Factura 01-501
('01', '501', '08', 4, 4.00, 16.00),
-- Factura 02-500
('02', '500', '20', 2, 2.45, 4.90),
('02', '500', '10', 2, 5.00, 10.00);
