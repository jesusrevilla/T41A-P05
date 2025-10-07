-- Datos necesarios para tests de integridad
INSERT INTO sucursal (sucursal, nombre_sucursal)
VALUES ('S1', 'Sucursal Test')
ON CONFLICT (sucursal) DO NOTHING;

INSERT INTO articulo (codigo_del_articulo, nombre_del_articulo, precio_unitario)
VALUES ('A100', 'Articulo Prueba', 50.00)
ON CONFLICT (codigo_del_articulo) DO NOTHING;

INSERT INTO clientes (codigo_del_cliente, nombre_del_cliente)
VALUES ('C100', 'Cliente Prueba')
ON CONFLICT (codigo_del_cliente) DO NOTHING;

-- Datos adicionales de ejemplo
INSERT INTO sucursal (sucursal, nombre_sucursal)
VALUES ('SUC001', 'Sucursal Central')
ON CONFLICT (sucursal) DO NOTHING;

INSERT INTO clientes (codigo_del_cliente, nombre_del_cliente)
VALUES ('CLI001', 'Ana Martínez')
ON CONFLICT (codigo_del_cliente) DO NOTHING;

INSERT INTO articulo (codigo_del_articulo, nombre_del_articulo, precio_unitario)
VALUES 
('ART001', 'Laptop Lenovo', 1200.00),
('ART002', 'Mouse Inalámbrico', 25.25)
ON CONFLICT (codigo_del_articulo) DO NOTHING;

INSERT INTO factura (
    sucursal, numero_de_factura, fecha_de_la_factura, 
    forma_de_pago_factura, codigo_del_cliente, total_de_la_factura
)
VALUES 
('SUC001', 1001, '2025-10-06', 'Tarjeta de Crédito', 'CLI001', 1250.50)
ON CONFLICT (sucursal, numero_de_factura) DO NOTHING;

INSERT INTO detalle_de_factura (
    sucursal, numero_de_factura, codigo_de_articulo, 
    cantidad_del_articulo, precio_unitario_del_articulo, subtotal_del_articulo
)
VALUES 
('SUC001', 1001, 'ART001', 1, 1200.00, 1200.00),
('SUC001', 1001, 'ART002', 2, 25.25, 50.50)
ON CONFLICT (sucursal, numero_de_factura, codigo_de_articulo) DO NOTHING;
