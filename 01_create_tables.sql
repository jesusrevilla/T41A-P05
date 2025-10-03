CREATE TABLE Clientes (
    codigo_del_cliente CHAR(4) PRIMARY KEY,
    nombre_del_cliente VARCHAR(100) NOT NULL
);

CREATE TABLE Articulo (
    codigo_del_articulo CHAR(4) PRIMARY KEY,
    nombre_del_articulo VARCHAR(100) NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL
);

CREATE TABLE Factura (
    sucursal CHAR(2) NOT NULL,
    numero_de_factura INTEGER NOT NULL,
    fecha_de_la_factura DATE NOT NULL,
    forma_de_pago_factura VARCHAR(20) NOT NULL,
    codigo_del_cliente CHAR(4) NOT NULL,
    total_de_la_factura DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (sucursal, numero_de_factura),
    FOREIGN KEY (codigo_del_cliente) REFERENCES Clientes(codigo_del_cliente)
);

CREATE TABLE Detalle_de_Factura (
    sucursal CHAR(2) NOT NULL,
    numero_de_factura INTEGER NOT NULL,
    codigo_de_articulo CHAR(4) NOT NULL,
    cantidad_del_articulo INTEGER NOT NULL,
    precio_unitario_del_articulo DECIMAL(10,2) NOT NULL,
    subtotal_del_articulo DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (sucursal, numero_de_factura, codigo_de_articulo),
    FOREIGN KEY (sucursal, numero_de_factura) REFERENCES Factura(sucursal, numero_de_factura),
    FOREIGN KEY (codigo_de_articulo) REFERENCES Articulo(codigo_del_articulo)
);
