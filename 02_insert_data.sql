/*
T41A-P05 – 02_insert_data.sql
Autor: Cristian Ricardo Godinez Limones – Matrícula:  183016
Carga mínima coherente con los nombres esperados por los tests.
*/

-- Clientes
INSERT INTO clientes (codigo_del_cliente, nombre_del_cliente) VALUES
('C001', 'Ana Ramírez'),
('C002', 'Bruno Torres'),
('C003', 'Carla Gómez');

-- Artículos
INSERT INTO articulo (codigo_del_articulo, nombre_del_articulo, precio_unitario) VALUES
('A100', 'Articulo Prueba', 50.00),         -- <- coincide con el que inserta el test con ON CONFLICT
('A101', 'Teclado mecánico', 1099.00),
('A102', 'Mouse inalámbrico', 499.00),
('A103', 'Monitor 24"', 2899.00);

-- Facturas
INSERT INTO factura (sucursal, numero_de_factura, fecha_de_la_factura, forma_de_pago_factura, codigo_del_cliente, total_de_la_factura) VALUES
(1, 1001, CURRENT_DATE - INTERVAL '7 day',  'E', 'C001', 1648.00),
(1, 1002, CURRENT_DATE - INTERVAL '3 day',  'T', 'C002',  499.00),
(2, 2001, CURRENT_DATE - INTERVAL '1 day',  'C', 'C003', 2899.00);

-- Detalle de factura
-- (1,1001): 1x Teclado + 1x Mouse
INSERT INTO detalle_de_factura (sucursal, numero_de_factura, codigo_de_articulo, cantidad_del_articulo, precio_unitario_del_articulo, subtotal_del_articulo) VALUES
(1, 1001, 'A101', 1, 1099.00, 1099.00),
(1, 1001, 'A102', 1,  549.00,  549.00);  -- precio en detalle puede variar por promo

-- (1,1002): 1x Mouse
INSERT INTO detalle_de_factura (sucursal, numero_de_factura, codigo_de_articulo, cantidad_del_articulo, precio_unitario_del_articulo, subtotal_del_articulo) VALUES
(1, 1002, 'A102', 1, 499.00, 499.00);

-- (2,2001): 1x Monitor
INSERT INTO detalle_de_factura (sucursal, numero_de_factura, codigo_de_articulo, cantidad_del_articulo, precio_unitario_del_articulo, subtotal_del_articulo) VALUES
(2, 2001, 'A103', 1, 2899.00, 2899.00);
