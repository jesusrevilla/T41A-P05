INSERT INTO sucursal3 (nombre_sucursal3) VALUES
('Sucursal Dorado'),
('Sucursal Plaza San Luis'),
('Sucursal Centro'),
('Sucursal Acceso Norte'),
('Sucursal Lomas');

INSERT INTO forma_pago3 (tipo_pago3) VALUES
('Efectivo'),
('Tarjeta de Crédito'),
('Tarjeta de Débito'),
('Transferencia Bancaria'),
('Vales de Despensa');

INSERT INTO cliente3 (nombre_cliente3) VALUES
('Paty Martínez'),
('Daniel Sánchez'),
('Rafael Sánchez'),
('Ximena Pulido'),
('Julio Loredo');

INSERT INTO articulo3 (nombre_articulo3, precio_unitario3) VALUES
('Laptop', 15000.00),
('Mouse', 350.00),
('Teclado', 1200.00),
('Monitor', 4200.00),
('Impresora', 3800.00);

INSERT INTO factura3 (codigo_cliente3, id_sucursal3, id_forma_pago3, fecha3, total_factura3) VALUES
(1, 1, 1, '2025-09-01', 15350.00),  
(2, 2, 2, '2025-09-02', 5400.00), 
(3, 3, 3, '2025-09-03', 1200.00),
(4, 4, 4, '2025-09-04', 3800.00),
(5, 5, 5, '2025-09-05', 19500.00);

INSERT INTO detalles_factura3 (id_factura3, codigo_articulo3, cantidad_articulo3) VALUES
(1, 1, 1),  
(1, 2, 1),   
(2, 4, 1),  
(3, 3, 1), 
(4, 5, 1),  
(5, 1, 1),   
(5, 4, 1);  

