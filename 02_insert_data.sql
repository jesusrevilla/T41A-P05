INSERT INTO articulo (codigo_del_articulo, nombre_del_articulo, precio_unitario)
VALUES 
    ('A100', 'Articulo Prueba', 50.00), 
    ('A101', 'Monitor LCD', 150.00),
    ('A102', 'Teclado Mecánico', 25.50)
ON CONFLICT (codigo_del_articulo) DO NOTHING;

INSERT INTO clientes (codigo_del_cliente, nombre_del_cliente)
VALUES 
    ('C100', 'Cliente Prueba'),
    ('C101', 'Juan Perez'),
    ('C102', 'Maria Lopez')
ON CONFLICT (codigo_del_cliente) DO NOTHING;

INSERT INTO factura (sucursal, numero_de_factura, fecha_de_la_factura, forma_de_pago_factura, codigo_del_cliente, total_de_la_factura)
VALUES 
    ('S1', 1, CURRENT_DATE, 'Efectivo', 'C100', 100.00),
    ('S1', 2, '2025-01-15', 'Tarjeta', 'C101', 301.00),
    ('S2', 1, '2025-01-16', 'Transferencia', 'C102', 25.50)
ON CONFLICT (sucursal, numero_de_factura) DO NOTHING;

INSERT INTO detalle_de_factura (sucursal, numero_de_factura, codigo_de_articulo, cantidad_del_articulo, precio_unitario_del_articulo, subtotal_del_articulo)
VALUES 
    ('S1', 1, 'A100', 2, 50.00, 100.00), -- Detalle usado en el test

    ('S1', 2, 'A101', 2, 150.00, 300.00),
    ('S1', 2, 'A102', 1, 1.00, 1.00), -- Error intencional

    ('S2', 1, 'A102', 1, 25.50, 25.50)
ON CONFLICT (sucursal, numero_de_factura, codigo_de_articulo) DO NOTHING;
