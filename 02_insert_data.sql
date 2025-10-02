
INSERT INTO Factura_3FN (sucursal, num_factura, fecha, forma_pago, cod_cliente)
VALUES 
('SUC01', 1001, '2025-10-01', 'E', 1),
('SUC01', 1002, '2025-10-02', 'T', 2),
('SUC02', 2001, '2025-10-01', 'E', 3),
('SUC02', 2002, '2025-10-03', 'C', 4),
('SUC03', 3001, '2025-10-04', 'T', 5);

INSERT INTO DetalleFactura_3FN (sucursal, num_factura, cod_articulo, cantidad)
VALUES 
('SUC01', 1001, 101, 2),
('SUC01', 1001, 102, 1),
('SUC01', 1002, 103, 3),
('SUC02', 2001, 101, 1),
('SUC02', 2002, 104, 5);
