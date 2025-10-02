-- Insertar sucursales
INSERT INTO Sucursal (id_sucursal, nombre_sucursal) VALUES
('S001', 'Sucursal Centro'),
('S002', 'Sucursal Norte');

-- Insertar clientes
INSERT INTO Cliente (id_cliente, nombre_cliente) VALUES
('C001', 'Juan Pérez'),
('C002', 'Ana Gómez');

-- Insertar artículos
INSERT INTO Articulo (id_articulo, nombre_articulo, precio_unitario) VALUES
('A001', 'Camiseta', 150.00),
('A002', 'Pantalón', 350.00);

-- Insertar facturas
INSERT INTO Factura (id_factura, id_sucursal, id_cliente, fecha, forma_pago, total) VALUES
('F0001', 'S001', 'C001', '2025-09-25', 'Tarjeta', 650.00),
('F0002', 'S002', 'C002', '2025-09-26', 'Efectivo', 150.00);

-- Insertar detalle de facturas
INSERT INTO DetalleFactura (id_factura, id_articulo, cantidad, subtotal) VALUES
('F0001', 'A001', 2, 300.00),
('F0001', 'A002', 1, 350.00),
('F0002', 'A001', 1, 150.00);

