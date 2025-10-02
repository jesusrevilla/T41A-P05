INSERT INTO clientes (codigo_del_cliente, nombre_del_cliente) VALUES
('CLI001', 'Juan Pérez'),
('CLI002', 'Ana García'),
('CLI003', 'Luis Martínez');

INSERT INTO articulo (codigo_del_articulo, nombre_del_articulo, precio_unitario) VALUES
('ART001', 'Laptop Modelo X', 15500.50),
('ART002', 'Mouse Inalámbrico', 450.00),
('ART003', 'Teclado Mecánico RGB', 1200.75);

INSERT INTO factura (sucursal, numero_de_factura, fecha_de_la_factura, forma_de_pago_factura, codigo_del_cliente, total_de_la_factura) VALUES
('SUC1', 101, '2025-10-01', 'Tarjeta de Crédito', 'CLI001', 16950.50),
('SUC2', 201, '2025-10-02', 'Transferencia', 'CLI002', 450.00),
('SUC1', 102, '2025-10-03', 'Efectivo', 'CLI003', 2401.50);

INSERT INTO detalle_de_factura (sucursal, numero_de_factura, codigo_del_articulo, cantidad_del_articulo, precio_unitario_del_articulo, subtotal_del_articulo) VALUES
('SUC1', 101, 'ART001', 1, 15500.50, 15500.50),
('SUC1', 101, 'ART002', 1, 450.00, 450.00),
('SUC1', 102, 'ART003', 2, 1200.75, 2401.50);
