CREATE TABLE cliente(
    codigo_cliente VARCHAR(10) PRIMARY KEY,
    nombre_cliente VARCHAR(50)
);

CREATE TABLE articulo(
    codigo_articulo VARCHAR(10) PRIMARY KEY,
    nombre_articulo VARCHAR(50),
    precio_unitario NUMERIC(10,2)
);

CREATE TABLE factura(
    sucursal VARCHAR(5),
    numero_factura VARCHAR(10),
    fecha_factura DATE,
    forma_pago VARCHAR(5),
    codigo_cliente VARCHAR(10),
    PRIMARY KEY (sucursal, numero_factura),
    FOREIGN KEY (codigo_cliente) REFERENCES cliente(codigo_cliente)
);

CREATE TABLE detalle_factura(
    sucursal VARCHAR(5),
    numero_factura VARCHAR(10),
    codigo_articulo VARCHAR(10),
    cantidad_articulo INT,
    PRIMARY KEY (sucursal, numero_factura, codigo_articulo),
    FOREIGN KEY (sucursal, numero_factura) REFERENCES factura(sucursal, numero_factura),
    FOREIGN KEY (codigo_articulo) REFERENCES articulo(codigo_articulo)
);
