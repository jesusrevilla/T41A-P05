--Clientes
INSERT INTO clientes (nombre_del_cliente) VALUES 
('Juan Pérez'),
('María López'),
('Carlos Sánchez');

-- Artículos
INSERT INTO articulo (nombre_del_articulo, precio_unitario) VALUES 
('Laptop', 12000.50),
('Mouse', 250.00);

-- Facturas
INSERT INTO factura (sucursal, numero_de_factura, codigo_del_cliente, fecha_de_la_factura, forma_de_pago_factura, total_de_la_factura) VALUES
(1, 1001, 1, '2025-09-01', 'EF', 12250.50),
(1, 1002, 2, '2025-09-02', 'TC', 12000.50);

-- Detalles facturas
INSERT INTO detalle_de_factura (sucursal, numero_de_factura, codigo_de_articulo, cantidad_del_articulo, precio_unitario_del_articulo, subtotal_del_articulo) VALUES
(1, 1001, 1, 1, 12000.50, 12000.50),
(1, 1001, 2, 1, 250.00, 250.00),
(1, 1002, 1, 1, 12000.50, 12000.50);
