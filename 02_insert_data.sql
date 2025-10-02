
/* =========================================================
                     02_insert_data.sql
       Datos de prueba (los mismos del ejemplo del libro)
   ========================================================= */

-- CLIENTES
INSERT INTO clientes (codigo_del_cliente, nombre_del_cliente) VALUES
('01', 'ALVAREZ'),
('107', 'CASTRO');

-- ARTICULOS
INSERT INTO articulo (codigo_del_articulo, nombre_del_articulo, precio_unitario) VALUES
('01', 'LAPIZ', 1.25),
('02', 'GOMA', 0.75),
('08', 'COMPAS', 4.00);

-- FACTURAS (numero_de_factura ahora es un entero)
INSERT INTO factura (sucursal, numero_de_factura, fecha_de_la_factura, forma_de_pago_factura, codigo_del_cliente, total_de_la_factura) VALUES
('01-500', 1, '2006-01-01', 'E',  '01', 48.20),
('01-501', 2, '2006-01-02', 'CC', '107', 16.00);

-- DETALLE DE FACTURA (numero_de_factura también en entero)
INSERT INTO detalle_de_factura (sucursal, numero_de_factura, codigo_de_articulo, cantidad_del_articulo, precio_unitario_del_articulo, subtotal_del_articulo) VALUES
('01-500', 1, '01', 3, 1.25, 3.75),   -- 3 lápices
('01-500', 1, '02', 6, 0.75, 4.50),   -- 6 gomas
('01-501', 2, '08', 4, 4.00, 16.00);  -- 4 compases
