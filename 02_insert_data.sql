INSERT INTO clientes (codigo_cliente, nombre_cliente) VALUES
('01', 'ALVAREZ'),
('02', 'GOMEZ'),
('03', 'PEREZ'),
('04', 'RODRIGUEZ'),
('05', 'MARTINEZ'),
('06', 'LOPEZ'),
('07', 'SANCHEZ'),
('08', 'TORRES'),
('09', 'RAMIREZ'),
('10', 'CRUZ');

INSERT INTO articulos (codigo_articulo, nombre_articulo, precio_unitario_articulo) VALUES
('01', 'LÁPIZ', 1.25),
('02', 'CUADERNO', 5.50),
('03', 'BOLÍGRAFO', 2.00),
('04', 'BORRADOR', 0.75),
('05', 'REGLA', 3.00),
('06', 'CARPETA', 4.00),
('07', 'MARCADOR', 1.75),
('08', 'TALADRO', 6.00),
('09', 'PEGAMENTO', 2.50),
('10', 'TINTA', 3.20);

INSERT INTO facturas (sucursal, numero_factura, fecha_factura, forma_pago_factura, codigo_cliente, total_factura) VALUES
('01', '500', '2006-01-01', 'E', '01', 48.20),
('01', '501', '2006-01-02', 'C', '02', 55.00),
('01', '502', '2006-01-03', 'E', '03', 25.50),
('02', '600', '2006-01-04', 'C', '04', 80.00),
('02', '601', '2006-01-05', 'E', '05', 12.75),
('02', '602', '2006-01-06', 'C', '06', 45.00),
('03', '700', '2006-01-07', 'E', '07', 60.00),
('03', '701', '2006-01-08', 'C', '08', 38.25),
('03', '702', '2006-01-09', 'E', '09', 29.00),
('04', '800', '2006-01-10', 'C', '10', 50.00);

INSERT INTO detalle_factura (sucursal, numero_factura, codigo_articulo, cantidad_articulo, subtotal_articulo) VALUES
('01', '500', '01', 3, 3.75),
('01', '500', '02', 8, 44.00),
('01', '501', '03', 10, 20.00),
('01', '501', '05', 5, 15.00),
('01', '502', '04', 10, 7.50),
('02', '600', '06', 10, 40.00),
('02', '600', '07', 10, 17.50),
('02', '601', '08', 2, 12.00),
('02', '602', '09', 5, 12.50),
('03', '700', '10', 10, 32.00);

