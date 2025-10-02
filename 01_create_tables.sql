CREATE TABLE Clientes (
    codigo_del_cliente CHAR(3) PRIMARY KEY,
    nombre_cliente VARCHAR(100) NOT NULL
);

CREATE TABLE Articulo (
    codigo_del_articulo CHAR(2) PRIMARY KEY,
    nombre_articulo VARCHAR(100) NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL
);

CREATE TABLE Factura (
    sucursal CHAR(2) NOT NULL,
    numero_de_factura CHAR(3) NOT NULL,
    fecha_factura DATE NOT NULL,
    forma_pago CHAR(2) NOT NULL,
    codigo_del_cliente CHAR(3) NOT NULL,
    total_factura DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (sucursal, numero_de_factura),
    FOREIGN KEY (codigo_del_cliente) REFERENCES Clientes(codigo_del_cliente)
);

CREATE TABLE Detalle_Factura (
    sucursal CHAR(2) NOT NULL,
    numero_de_factura CHAR(3) NOT NULL,
    codigo_del_articulo CHAR(2) NOT NULL,
    cantidad INTEGER NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    subtotal_articulo DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (sucursal, numero_de_factura, codigo_del_articulo),
    FOREIGN KEY (sucursal, numero_de_factura) REFERENCES Factura(sucursal, numero_de_factura),
    FOREIGN KEY (codigo_del_articulo) REFERENCES Articulo(codigo_del_articulo)
);
