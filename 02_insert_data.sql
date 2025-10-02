INSERT INTO clientes (codigo_del_cliente, nombre_del_cliente) VALUES ('C01', 'Cristiano Ronaldo');
INSERT INTO articulo (codigo_del_articulo, nombre_del_articulo, precio_unitario) VALUES ('A001', 'Lapiz', 1.25);
INSERT INTO factura VALUES ('01', 'F01', '2025-09-29', 'E', 'C01', 3.75);

INSERT INTO detalle_de_factura (sucursal, numero_de_factura, codigo_de_articulo, cantidad_del_articulo, precio_unitario_del_articulo, subtotal_del_articulo)
VALUES ('01', 'F01', 'A001', 3, 1.25, 3.75);
