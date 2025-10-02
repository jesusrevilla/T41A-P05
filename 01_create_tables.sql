CREATE TABLE clientes (
    codigo_del_cliente VARCHAR(10) PRIMARY KEY,
    nombre_del_cliente VARCHAR(50)
);


CREATE TABLE articulo (
    codigo_del_articulo VARCHAR(10) PRIMARY KEY,
    nombre_del_articulo VARCHAR(50),
    precio_unitario NUMERIC(10,2)
);


CREATE TABLE factura (
    sucursal VARCHAR(5),
    numero_de_factura int,
    fecha_de_la_factura DATE,
    forma_de_pago_factura VARCHAR(20),
    codigo_del_cliente VARCHAR(10),
    total_de_la_factura NUMERIC(10,2),
    PRIMARY KEY (sucursal, numero_de_factura),
    FOREIGN KEY (codigo_del_cliente) REFERENCES clientes(codigo_del_cliente)
);


CREATE TABLE detalle_de_factura (
    sucursal VARCHAR(5),
    numero_de_factura int,
    codigo_de_articulo VARCHAR(10),
    cantidad_del_articulo INT,
    precio_unitario_del_articulo NUMERIC(10,2),
    subtotal_del_articulo NUMERIC(10,2),
    PRIMARY KEY (sucursal, numero_de_factura, codigo_de_articulo),
    FOREIGN KEY (sucursal, numero_de_factura) REFERENCES factura(sucursal, numero_de_factura),
    FOREIGN KEY (codigo_de_articulo) REFERENCES articulo(codigo_del_articulo)
);
