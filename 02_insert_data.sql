INSERT INTO clientes VALUES
(1,'Sofía Martínez'),
(2,'Andrés López'),
(3,'Valeria Torres'),
(4,'Jorge Ramírez');

INSERT INTO articulos VALUES
(1,'Cuaderno',25.0),
(2,'Pluma',7.5),
(3,'Marcador',12.0),
(4,'Carpeta',30.0);

INSERT INTO facturas VALUES
(1,101,'2025-10-01','E',1,50.0),
(1,102,'2025-10-01','T',2,37.5),
(2,201,'2025-10-02','E',3,42.0),
(2,202,'2025-10-02','T',4,30.0);

INSERT INTO detalle_factura VALUES
(1,101,1,2,25.0,50.0),
(1,102,2,5,7.5,37.5),
(2,201,3,3,12.0,36.0),
(2,201,2,1,6.0,6.0),
(2,202,4,1,30.0,30.0);
