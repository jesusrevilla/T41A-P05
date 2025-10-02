INSERT INTO clientes (codigo_del_cliente, nombre_del_cliente) VALUES
('C100', 'Peluchin'),
('C200', 'Yazmin'),
('C300', 'Reyna');

INSERT INTO articulo (codigo_del_articulo, nombre_del_articulo, precio_unitario) VALUES
('A100', 'Monitor', 12000.50),
('A200', 'Teclado', 250.00),
('A300', 'Mouse', 600.00);

INSERT INTO factura (sucursal, numero_de_factura, codigo_del_cliente, fecha_de_la_factura, forma_de_pago_factura, total_de_la_factura) VALUES
(1, 1001, 'C100', '2025-09-01', 'EF', 12250.50),
(1, 1002, 'C200', '2025-09-02', 'TC', 12000.50),
(2, 2001, 'C300', '2025-09-03', 'EF', 12600.50);

INSERT INTO detalle_de_factura (sucursal, numero_de_factura, codigo_de_articulo, cantidad_del_articulo, precio_unitario_del_articulo, subtotal_del_articulo) VALUES
(1, 1001, 'A100', 1, 12000.50, 12000.50),
(1, 1001, 'A200', 1, 250.00, 250.00),
(1, 1002, 'A100', 1, 12000.50, 12000.50),
(2, 2001, 'A300', 1, 600.00, 600.00),
(2, 2001, 'A100', 1, 12000.50, 12000.50);
