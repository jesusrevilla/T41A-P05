INSERT INTO clientes (codigo_del_cliente, nombre_del_cliente) VALUES
(101, 'Juan Pérez'),
(102, 'Ana García');
INSERT INTO articulo (codigo_de_articulo, nombre_del_articulo, precio_unitario) VALUES
(201, 'Laptop', 15000.00),
(202, 'Mouse', 250.50),
(203, 'Teclado', 750.00);
INSERT INTO factura (sucursal, numero_de_factura, fecha_de_la_factura, forma_de_pago_factura, codigo_del_cliente, total_de_la_factura) VALUES
(1, 1, '2025-10-01', 'Tarjeta de Crédito', 101, 15250.50);
INSERT INTO detalle_de_factura (sucursal, numero_de_factura, codigo_de_articulo, cantidad_del_articulo, precio_unitario_del_articulo, subtotal_del_articulo) VALUES
(1, 1, 201, 1, 15000.00, 15000.00), 
(1, 1, 202, 1, 250.50, 250.50);  
