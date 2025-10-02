INSERT INTO forma_de_pago (forma_pago) VALUES ('EFEC');
INSERT INTO forma_de_pago (forma_pago) VALUES ('TCRD'); 
INSERT INTO forma_de_pago (forma_pago) VALUES ('TRNS'); 


INSERT INTO clientes (codigo_del_cliente, nombre_del_cliente)
VALUES ('1', 'Juan Pérez'),
       ('2', 'María López'),
       ('3', 'Carlos Gómez');

INSERT INTO articulo (codigo_del_articulo, nombre_del_articulo, precio_unitario)
VALUES 
  ('101', 'Mouse inalámbrico', 15.99),
  ('102', 'Teclado mecánico', 49.99),
  ('103', 'Monitor 24"', 120.00);

INSERT INTO factura (sucursal, numero_de_factura, fecha_de_la_factura, forma_de_pago_factura, codigo_del_cliente, total_de_la_factura)
VALUES 
  ('Sucursal A', 1001, '2025-09-25', 'EFEC', '1', 31.98),
  ('Sucursal B', 1002, '2025-09-26', 'TCRD', '2', 49.99),
  ('Sucursal A', 1003, '2025-09-27', 'TRNS', '3', 120.00);


INSERT INTO detalle_de_factura (sucursal, numero_de_factura, codigo_de_articulo, cantidad_del_articulo, precio_unitario_del_articulo)
VALUES 
  ('Sucursal A', 1001, '101', '2', 15.99), 
  ('Sucursal B', 1002, '102', '1', 49.99),  
  ('Sucursal A', 1003, '103', '1', 120.00);  
