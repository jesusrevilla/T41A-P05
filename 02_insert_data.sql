INSERT INTO cliente (codigo, nombre) VALUES 
(101, 'Juan Pérez'),
(102, 'Ana Gómez'),
(103, 'Carlos Ruiz'),
(104, 'María Fernández');

INSERT INTO articulo (codigo, nombre, precio_unitario) VALUES (201, 'Laptop Modelo X', 15500.50),
(202, 'Mouse Inalámbrico', 450.00),
(203, 'Teclado Mecánico', 1200.75),
(204, 'Monitor 24 pulgadas', 3500.00);

INSERT INTO factura (sucursal, numero_factura, fecha_factura, forma_pago, codigo_cliente, total_factura) VALUES (1, 1001, '2025-10-01', 'Tarjeta de Crédito', 101, 15950.50),
(1, 1002, '2025-10-01', 'Transferencia', 102, 4700.75),
(2, 2001, '2025-10-02', 'Efectivo', 103, 3500.00),
(2, 2002, '2025-10-02', 'Tarjeta de Débito', 101, 1650.75);

INSERT INTO detalle_factura (sucursal, numero_factura, codigo_articulo, cantidad_articulo, precio_unitario, subtotal_articulo) VALUES 
(1, 1001, 201, 1, 15500.50, 15500.50),
(1, 1001, 202, 1, 450.00, 450.00),
(1, 1002, 204, 1, 3500.00, 3500.00),
(1, 1002, 203, 1, 1200.75, 1200.75);
