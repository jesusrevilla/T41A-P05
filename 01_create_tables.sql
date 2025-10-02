-- Creacion de tablas normalizadas a 3FN
CREATE TABLE Cliente_3FN (
    codigo_cliente VARCHAR(50) PRIMARY KEY,
    nombre_cliente VARCHAR(100) NOT NULL
);

CREATE TABLE Articulo_3FN (
    codigo_articulo VARCHAR(50) PRIMARY KEY,
    nombre_articulo VARCHAR(100) NOT NULL
);

CREATE TABLE Factura_3FN (
    sucursal VARCHAR(50),
    numero_factura VARCHAR(50),
    fecha_factura DATE NOT NULL,
    forma_pago VARCHAR(50) NOT NULL,
    codigo_cliente VARCHAR(50) NOT NULL,
    total_factura NUMERIC(10,2) NOT NULL,
    PRIMARY KEY (sucursal, numero_factura),
    FOREIGN KEY (codigo_cliente) REFERENCES Cliente_3FN(codigo_cliente)
);

CREATE TABLE Detalle_Factura_3FN (
    sucursal VARCHAR(50),
    numero_factura VARCHAR(50),
    codigo_articulo VARCHAR(50),
    cantidad_articulo INTEGER NOT NULL,
    precio_unitario NUMERIC(10,2) NOT NULL,
    subtotal_articulo NUMERIC(10,2) NOT NULL,
    PRIMARY KEY (sucursal, numero_factura, codigo_articulo),
    FOREIGN KEY (sucursal, numero_factura) REFERENCES Factura_3FN(sucursal, numero_factura),
    FOREIGN KEY (codigo_articulo) REFERENCES Articulo_3FN(codigo_articulo)
);
