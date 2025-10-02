INSERT INTO FormaPago (forma_pago) VALUES ('EFEC');
INSERT INTO FormaPago (forma_pago) VALUES ('TCRD');
INSERT INTO FormaPago (forma_pago) VALUES ('TRNS'); 

INSERT INTO Cliente (codigo_cliente, nombre_cliente) VALUES (1, 'Juan Pérez');
INSERT INTO Cliente (codigo_cliente, nombre_cliente) VALUES (2, 'María López');
INSERT INTO Cliente (codigo_cliente, nombre_cliente) VALUES (3, 'Carlos Gómez');

INSERT INTO Articulo (codigo_articulo, nombre_articulo) VALUES (101, 'Mouse inalámbrico');
INSERT INTO Articulo (codigo_articulo, nombre_articulo) VALUES (102, 'Teclado mecánico');
INSERT INTO Articulo (codigo_articulo, nombre_articulo) VALUES (103, 'Monitor 24 pulgadas');

INSERT INTO Factura (sucursal, numero_factura, fecha_factura, forma_pago, codigo_cliente)
VALUES ('Sucursal A', 1001, '2025-09-25', 'EFEC', 1);

INSERT INTO Factura (sucursal, numero_factura, fecha_factura, forma_pago, codigo_cliente)
VALUES ('Sucursal B', 1002, '2025-09-26', 'TCRD', 2);

INSERT INTO Factura (sucursal, numero_factura, fecha_factura, forma_pago, codigo_cliente)
VALUES ('Sucursal A', 1003, '2025-09-27', 'TRNS', 3);


INSERT INTO DetalleFactura (sucursal, numero_factura, codigo_articulo, cantidad_articulo, precio_unitario)
VALUES ('Sucursal A', 1001, 101, 2, 15.99);

INSERT INTO DetalleFactura (sucursal, numero_factura, codigo_articulo, cantidad_articulo, precio_unitario)
VALUES ('Sucursal B', 1002, 102, 1, 49.99);


INSERT INTO DetalleFactura (sucursal, numero_factura, codigo_articulo, cantidad_articulo, precio_unitario)
VALUES ('Sucursal A', 1003, 103, 1, 120.00);
