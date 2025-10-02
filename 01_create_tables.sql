--Tablas en 3FN
CREATE TABLE clientes(
    codigo_del_cliente SERIAL PRIMARY KEY,
    nombre_del_cliente VARCHAR(50) NOT NULL
);

CREATE TABLE factura(
    sucursal INT NOT NULL,
    numero_de_factura INT NOT NULL,
    codigo_del_cliente INT NOT NULL,
    fecha_de_la_factura DATE NOT NULL,
    forma_de_pago_factura CHAR(2) NOT NULL,
    total_de_la_factura NUMERIC(10,2) NOT NULL,
    PRIMARY KEY (sucursal, numero_de_factura),
    FOREIGN KEY (codigo_del_cliente)
        REFERENCES clientes(codigo_del_cliente)
);

CREATE TABLE articulo(
    codigo_del_articulo SERIAL PRIMARY KEY,
    nombre_del_articulo VARCHAR(50) NOT NULL,
    precio_unitario NUMERIC(10,2) NOT NULL
);

CREATE TABLE detalle_de_factura(
    sucursal INT NOT NULL,
    numero_de_factura INT NOT NULL,
    codigo_de_articulo INT NOT NULL,
    cantidad_del_articulo INT NOT NULL,
    precio_unitario_del_articulo NUMERIC(10,2) NOT NULL,
    subtotal_del_articulo NUMERIC(10,2) NOT NULL,
    PRIMARY KEY (sucursal, numero_de_factura, codigo_de_articulo),
    FOREIGN KEY (codigo_de_articulo)
        REFERENCES articulo(codigo_del_articulo),
    FOREIGN KEY (sucursal, numero_de_factura)
        REFERENCES factura(sucursal, numero_de_factura)
);


