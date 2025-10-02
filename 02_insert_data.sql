
/* =========================================================
                     02_insert_data.sql
       Datos de prueba (los mismos del ejemplo del libro)
   ========================================================= */

/* CLIENTES */
INSERT INTO "Cliente" ("CodigoCliente", "NombreCliente") VALUES
('01',  'ALVAREZ'),
('107', 'CASTRO');

/* ARTICULOS */
INSERT INTO "Articulo" ("CodigoArticulo", "NombreArticulo", "PrecioUnitario") VALUES
('01', 'LÁPIZ', 1.25),
('02', 'GOMA', 0.75),
('08', 'COMPÁS', 4.00);

/* FACTURAS */
INSERT INTO "Factura" ("Sucursal","NumeroFactura","FechaFactura","FormaPagoFactura","CodigoCliente","TotalFactura") VALUES
('01-500', '1/01/06', '2006-01-01', 'E',  '01', 48.20),
('01-501', '2/01/06', '2006-01-02', 'CC', '107', 16.00);

/* DETALLES DE FACTURA */
INSERT INTO "Detalle_Factura" 
("Sucursal","NumeroFactura","CodigoArticulo","CantidadArticulo","PrecioUnitarioArticulo","SubtotalArticulo") VALUES
('01-500','1/01/06','01',3,1.25,3.75),   -- 3 Lápices
('01-500','1/01/06','02',6,0.75,4.50),   -- 6 Gomas
('01-501','2/01/06','08',4,4.00,16.00);  -- 4 Compases
