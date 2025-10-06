-- Clientes
INSERT INTO clientes (codigo_del_cliente, nombre_del_cliente) VALUES
('C100', 'Peluchin'),
('C200', 'Yazmin'),
('C300', 'Reyna');

-- Artículos
INSERT INTO articulo (codigo_del_articulo, nombre_del_articulo, precio_unitario) VALUES
('A100', 'Articulo Prueba', 50.00),
('A200', 'Teclado', 250.00),
('A300', 'Mouse', 600.00);

-- Facturas
INSERT INTO factura (sucursal, numero_de_factura, fecha_de_la_factura, forma_de_pago_factura, codigo_del_cliente, total_de_la_factura) VALUES
('S1', 1, '2025-09-01', 'Efectivo', 'C100', 100.00),
('S1', 2, '2025-09-02', 'Tarjeta', 'C200', 250.00),
('S2', 3, '2025-09-03', 'Efectivo', 'C300', 600.00);

-- Detalle de factura
INSERT INTO detalle_de_factura (sucursal, numero_de_factura, codigo_de_articulo, cantidad_del_articulo, precio_unitario_del_articulo, subtotal_del_articulo) VALUES
('S1', 1, 'A100', 2, 50.00, 100.00),
('S1', 2, 'A200', 1, 250.00, 250.00),
('S2', 3, 'A300', 1, 600.00, 600.00);
