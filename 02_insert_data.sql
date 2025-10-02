/* 
T41A-P05 – 02_insert_data.sql
Autor: Cristian Ricardo Godinez Limones – Matrícula: 183016
Carga de datos ejemplo coherentes con el esquema.
*/

-- Clientes
INSERT INTO customers (first_name, last_name, email, phone) VALUES
('Ana',     'Ramírez',   'ana.ramirez@example.com',   '811-111-1111'),
('Bruno',   'Torres',    'bruno.torres@example.com',  '811-222-2222'),
('Carla',   'Gómez',     'carla.gomez@example.com',   '811-333-3333'),
('Diego',   'Luna',      'diego.luna@example.com',    '811-444-4444'),
('Elena',   'Vargas',    'elena.vargas@example.com',  '811-555-5555');

-- Productos
INSERT INTO products (sku, product_name, category, unit_price, active) VALUES
('SKU-1001', 'Teclado mecánico',   'Periféricos', 1099.00, TRUE),
('SKU-1002', 'Mouse inalámbrico',  'Periféricos',  499.00, TRUE),
('SKU-2001', 'Monitor 24"',        'Monitores',   2899.00, TRUE),
('SKU-3001', 'Silla gamer',        'Mobiliario',  3999.00, TRUE),
('SKU-4001', 'Base laptop',        'Accesorios',   699.00, TRUE),
('SKU-5001', 'Audífonos',          'Audio',        899.00, TRUE),
('SKU-5002', 'Bocina BT',          'Audio',       1299.00, TRUE);

-- Pedidos
INSERT INTO orders (customer_id, order_date, status, note) VALUES
(1, CURRENT_DATE - INTERVAL '20 day', 'PAID',    'Entrega en oficina'),
(2, CURRENT_DATE - INTERVAL '18 day', 'PAID',    NULL),
(3, CURRENT_DATE - INTERVAL '15 day', 'SHIPPED', 'Envío a domicilio'),
(1, CURRENT_DATE - INTERVAL '10 day', 'CANCELED', 'Cancelado por cliente'),
(4, CURRENT_DATE - INTERVAL '9 day',  'PAID',    NULL),
(5, CURRENT_DATE - INTERVAL '2 day',  'PENDING', 'Pagará al recoger');

-- Ítems
-- order_id 1
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 1, 1099.00),
(1, 2, 2,  499.00);

-- order_id 2
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(2, 3, 1, 2899.00);

-- order_id 3
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(3, 6, 1,  899.00),
(3, 5, 1,  699.00);

-- order_id 4 (cancelado pero con detalle para pruebas)
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(4, 7, 1, 1299.00);

-- order_id 5
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(5, 4, 1, 3999.00);

-- order_id 6
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(6, 2, 1,  499.00),
(6, 1, 1, 1099.00);

