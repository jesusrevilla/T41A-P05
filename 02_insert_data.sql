-- Clientes
INSERT INTO clientes VALUES ('C100', 'Fernanda Camacho');
INSERT INTO clientes VALUES ('C101', 'Daniela García');

-- Artículo (nota: usan 'A100' en la prueba de integridad)
INSERT INTO articulo VALUES ('A100', 'Articulo Prueba', 50.00);

-- Factura (ISO date 'YYYY-MM-DD')
INSERT INTO factura VALUES ('S1', '1', '2025-01-01', 'Débito', 'C100', 100.00);

-- Detalle (2 unidades * 50.00 = 100.00)
INSERT INTO detalle_de_factura
(sucursal, numero_de_factura, codigo_de_articulo, cantidad_del_articulo, precio_unitario_del_articulo, subtotal_del_articulo)
VALUES
('S1', '1', 'A100', 2, 50.00, 100.00);

