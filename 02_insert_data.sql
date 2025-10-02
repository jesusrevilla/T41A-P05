INSERT INTO clientes (codigo_del_cliente, nombre_del_cliente) VALUES
('C100', 'Cliente Prueba'),
('C250', 'Ana Torres'),
('C300', 'Luis Jimenez');

INSERT INTO articulo (codigo_del_articulo, nombre_del_articulo, precio_unitario) VALUES
('A100', 'Articulo Prueba', 50.00),
('B205', 'Laptop Pro', 18500.50),
('C310', 'Monitor 24"', 4200.00),
('D415', 'Teclado Mecanico', 1550.75);

INSERT INTO factura (sucursal, numero_de_factura, fecha_de_la_factura, forma_de_pago_factura, codigo_del_cliente, total_de_la_factura) VALUES
('S1', 1, '2025-09-15', 'E', 'C100', 100.00), 
('S1', 2, '2025-09-20', 'E', 'C250', 22700.50), 
('S2', 101, '2025-10-01', 'E', 'C300', 11502.25); 

INSERT INTO detalle_de_factura (sucursal, numero_de_factura, codigo_de_articulo, cantidad_del_articulo, precio_unitario_del_articulo, subtotal_del_articulo) VALUES
('S1', 1, 'A100', 2, 50.00, 100.00);

INSERT INTO detalle_de_factura (sucursal, numero_de_factura, codigo_de_articulo, cantidad_del_articulo, precio_unitario_del_articulo, subtotal_del_articulo) VALUES
('S1', 2, 'B205', 1, 18500.50, 18500.50),
('S1', 2, 'C310', 1, 4200.00, 4200.00);

INSERT INTO detalle_de_factura (sucursal, numero_de_factura, codigo_de_articulo, cantidad_del_articulo, precio_unitario_del_articulo, subtotal_del_articulo) VALUES
('S2', 101, 'C310', 2, 4200.00, 8400.00),
('S2', 101, 'D415', 2, 1550.75, 3101.50);
