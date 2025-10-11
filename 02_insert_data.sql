INSERT INTO clientes (codigo_del_cliente, nombre_del_cliente) VALUES
('CL001', 'Juan Pérez'),
('CL002', 'María García'),
('CL003', 'Luis Torres');

INSERT INTO articulo (codigo_del_articulo, nombre_del_articulo, precio_unitario) VALUES
('ART01', 'Smartphone X', 500.00),
('ART02', 'Auriculares BT', 75.50),
('ART03', 'Cable USB C', 5.00);

INSERT INTO factura (sucursal, numero_de_factura, fecha_de_la_factura, forma_de_pago_factura, codigo_del_cliente, total_de_la_factura) VALUES
('S1', 1, '2025-10-01', 'Tarjeta', 'CL001', 580.50);

INSERT INTO factura (sucursal, numero_de_factura, fecha_de_la_factura, forma_de_pago_factura, codigo_del_cliente, total_de_la_factura) VALUES
('S2', 1, '2025-10-02', 'Efectivo', 'CL002', 20.00);

INSERT INTO detalle_de_factura (sucursal, numero_de_factura, codigo_de_articulo, cantidad_del_articulo, precio_unitario_del_articulo, subtotal_del_articulo) VALUES
('S1', 1, 'ART01', 1, 500.00, 500.00),
('S1', 1, 'ART02', 1, 75.50, 75.50),
('S1', 1, 'ART03', 1, 5.00, 5.00);

INSERT INTO detalle_de_factura (sucursal, numero_de_factura, codigo_de_articulo, cantidad_del_articulo, precio_unitario_del_articulo, subtotal_del_articulo) VALUES
('S2', 1, 'ART03', 4, 5.00, 20.00);
