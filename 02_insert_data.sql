CREATE TABLE Factura_3FN (
    sucursal VARCHAR(10),
    num_factura INT,
    fecha DATE,
    forma_pago VARCHAR(5),
    cod_cliente INT,
    PRIMARY KEY (sucursal, num_factura),
    FOREIGN KEY (cod_cliente) REFERENCES Cliente_2FN(cod_cliente)
);
 
-- Detalle de Factura
CREATE TABLE DetalleFactura_3FN (
    sucursal VARCHAR(10),
    num_factura INT,
    cod_articulo INT,
    cantidad INT,
    PRIMARY KEY (sucursal, num_factura, cod_articulo),
    FOREIGN KEY (sucursal, num_factura) REFERENCES Factura_3FN(sucursal, num_factura),
    FOREIGN KEY (cod_articulo) REFERENCES Articulo_2FN(cod_articulo)
);
