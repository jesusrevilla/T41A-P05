INSERT INTO clientes (codigo_del_cliente, nombre_del_cliente) VALUES
(1, 'Uriel'),
(2, 'Fernanda'),
(3, 'Alejandro'),
(4, 'Victor'),
(5, 'Cristo');

INSERT INTO articulo (codigo_del_articulo, nombre_del_articulo, precio_unitario) VALUES
(100, 'Lapicero', 11.50),
(101, 'Cuaderno', 20.00),
(102, 'Color', 1.50),
(103, 'Calculadora', 50.00),
(104, 'Mochila', 60.00);

INSERT INTO factura (sucursal, numero_de_factura, fecha_de_la_factura, forma_de_pago_factura, codigo_del_cliente, total_de_la_factura) VALUES
(1, 1000, '2025-10-1', 'Efectivo', 1, 23.40),
(1, 1001, '2025-10-2', 'Tarjeta', 2, 18.20),
(2, 2000, '2025-10-3', 'Efectivo', 3, 15.60),
(2, 2001, '2025-10-4', 'Tarjeta', 4, 20.50),
(1, 1002, '2025-10-5', 'Efectivo', 5, 15.00);

INSERT INTO detalle_de_factura (sucursal, numero_de_factura, codigo_de_articulo, cantidad_del_articulo, precio_unitario_del_articulo, subtotal_del_articulo) VALUES
(1, 1000, 100, 1, 11.50, 11.50),    
(1, 1000, 102, 8, 1.50, 12.00),      
(1, 1001, 101, 1, 20.00, 20.00),    
(2, 2000, 102, 5, 1.50, 7.50),       
(2, 2001, 104, 1, 60.00, 60.00);  
