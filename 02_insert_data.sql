-- Insertar clientes
INSERT INTO clientes (codigo_del_cliente, nombre_del_cliente)
VALUES 
  (1, 'Juan Pérez'),
  (2, 'María López');

-- Insertar artículos
INSERT INTO articulo (codigo_del_articulo, nombre_del_articulo, precio_unitario)
VALUES 
  (101, 'Laptop Lenovo', 15000.00),
  (102, 'Mouse Logitech', 500.00);

-- Insertar facturas
INSERT INTO factura (sucursal, numero_de_factura, fecha_de_la_factura, forma_de_pago_factura, codigo_del_cliente, total_de_la_factura)
VALUES 
  ('Sucursal Centro', 1001, '2025-10-01', 'Tarjeta de crédito', 1, 15500),
  ('Sucursal Norte', 1002, '2025-10-01', 'Efectivo', 2, 500);

-- Insertar detalles de factura
INSERT INTO detalle_de_factura (sucursal, numero_de_factura, codigo_del_articulo, cantidad_del_articulo, precio_unitario_del_articulo, subtotal_del_articulo)
VALUES 
  ('Sucursal Centro', 1001, 101, 1, 15000, 15000),
  ('Sucursal Centro', 1001, 102, 1, 500, 500),
  ('Sucursal Norte', 1002, 102, 1, 500, 500);
