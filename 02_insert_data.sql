INSERT INTO clientes (codigo_del_cliente, nombre_del_cliente) VALUES
('C001', 'Juanito'),
('C002', 'Coral');

INSERT INTO articulo (codigo_del_articulo, nombre_del_articulo, precio_unitario) VALUES
('A001', 'Lapiz', 3.00),
('A002', 'libreta', 25.50);

INSERT INTO factura (sucursal, numero_de_factura, fecha_de_la_factura, forma_de_pago_factura, codigo_del_cliente, total_de_la_factura) VALUES
('S01', 1001, '2025-10-01', 'Efectivo', 'C001', 1525.50),
('S02', 1002, '2025-10-02', 'Tarjeta', 'C002', 25.50);

INSERT INTO detalle_de_factura (sucursal, numero_de_factura, codigo_de_articulo, cantidad_del_articulo, precio_unitario_del_articulo, subtotal_del_articulo) VALUES
('S01', 1001, 'A001', 1, 1500.00, 3.00),
('S01', 1001, 'A002', 1, 25.50, 25.50);
