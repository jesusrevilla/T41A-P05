--Tablas en 3FN
CREATE TABLE cliente(
    codigo_cliente SERIAL PRIMARY KEY,
    nombre_cliente VARCHAR(50) NOT NULL
);

CREATE TABLE factura(
    sucursal INT NOT NULL,
    numero_factura INT NOT NULL,
    codigo_cliente INT NOT NULL,
    fecha_factura DATE NOT NULL,
    forma_pago CHAR(2) NOT NULL,
    total_factura NUMERIC(10,2) NOT NULL,
    PRIMARY KEY (sucursal, numero_factura),
    FOREIGN KEY (codigo_cliente)
        REFERENCES cliente(codigo_cliente)
);

CREATE TABLE articulo(
    codigo_articulo SERIAL PRIMARY KEY,
    nombre_articulo VARCHAR(50) NOT NULL,
    precio_unitario NUMERIC(10,2) NOT NULL
);

CREATE TABLE detalle_factura(
    sucursal INT NOT NULL,
    numero_factura INT NOT NULL,
    codigo_articulo INT NOT NULL,
    cantidad_articulo INT NOT NULL,
    subtotal_articulo NUMERIC(10,2) NOT NULL,
    PRIMARY KEY (sucursal, numero_factura, codigo_articulo),
    FOREIGN KEY (codigo_articulo)
        REFERENCES articulo(codigo_articulo)
);

