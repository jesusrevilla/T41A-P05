INSERT INTO cliente4 (codigo_cliente, nombre_cliente) VALUES
(1, 'Juan Pérez'),
(2, 'María López'),
(3, 'Carlos Sánchez');

INSERT INTO articulo4 (codigo_articulo, nombre_articulo, precio_unitario) VALUES
(101, 'Laptop', 15000.50),
(102, 'Mouse', 350.75),
(103, 'Teclado', 1200.00);

INSERT INTO factura4 (id_factura, sucursal, fecha, forma_pago) VALUES
(1001, 'Plaza San Luis', '2025-09-01', 'Tarjeta'),
(1002, 'Plaza El Dorado', '2025-09-02', 'Efectivo'),
(1003, 'Plaza The Park', '2025-09-03', 'Transferencia');

INSERT INTO detalles_factura4 (id_detalle, id_factura, codigo_articulo, cantidad) VALUES
(1, 1001, 101, 1),
(2, 1001, 102, 2),  
(3, 1002, 103, 1);  

