INSERT INTO clientes (codigo_del_cliente, nombre_del_cliente) VALUES 
(1, 'Angel Castillo'),
(2, 'Luis Vidales'),
(3, 'Yamin Guerrero');
INSERT INTO articulo (codigo_del_articulo, nombre_del_articulo, precio_unitario) VALUES 
(101, 'Laptop Thinkpad', 15000.00),
(102, 'Mouse Redragon', 350.50),
(103, 'Monitor Xiaomi', 4200.75);
INSERT INTO factura (sucursal, numero_de_factura, fecha_de_la_factura, forma_de_pago_factura, codigo_del_cliente, total_de_la_factura) VALUES 
('SLP', 1001, '2025-10-01', 'TDC', 1, 15350),
('SLP', 1002, '2025-10-02', 'EFE', 2, 4550),
('QRO', 1003, '2025-10-03', 'TDD', 3, 4200);
INSERT INTO detalle_de_factura (sucursal, numero_de_factura, codigo_de_articulo, cantidad_del_articulo, precio_unitario_del_articulo, subtotal_del_articulo) VALUES 
('SLP', 1001, 101, 1, 15000.00, 15000.00),
('SLP', 1001, 102, 1, 350.00, 350.00),
('QRO', 1003, 103, 1, 4200.75, 4200.75);

