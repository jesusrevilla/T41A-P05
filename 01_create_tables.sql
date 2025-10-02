CREATE TABLE Clientes (
    codigo_cliente CHAR(3) PRIMARY KEY,
    nombre_cliente VARCHAR(100) NOT NULL
);

CREATE TABLE Articulo (
    codigo_articulo CHAR(2) PRIMARY KEY,
    nombre_articulo VARCHAR(100) NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL
);

CREATE TABLE Factura (
    sucursal CHAR(2) NOT NULL,
    numero_factura CHAR(3) NOT NULL,
    fecha_factura DATE NOT NULL,
    forma_pago CHAR(2) NOT NULL,
    codigo_cliente CHAR(3) NOT NULL,
    total_factura DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (sucursal, numero_factura),
    FOREIGN KEY (codigo_cliente) REFERENCES Clientes(codigo_cliente)
);

CREATE TABLE Detalle_Factura (
    sucursal CHAR(2) NOT NULL,
    numero_factura CHAR(3) NOT NULL,
    codigo_articulo CHAR(2) NOT NULL,
    cantidad INTEGER NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    subtotal_articulo DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (sucursal, numero_factura, codigo_articulo),
    FOREIGN KEY (sucursal, numero_factura) REFERENCES Factura(sucursal, numero_factura),
    FOREIGN KEY (codigo_articulo) REFERENCES Articulo(codigo_articulo)
);
