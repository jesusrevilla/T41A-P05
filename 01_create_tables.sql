CREATE TABLE clientes (
    codigo_del_cliente VARCHAR(50) PRIMARY KEY,
    nombre_del_cliente VARCHAR(50)
);

CREATE TABLE articulo (
    codigo_del_articulo VARCHAR(50) PRIMARY KEY,
    nombre_del_articulo VARCHAR(50),
    precio_unitario FLOAT
);

CREATE TABLE factura (
    sucursal VARCHAR(50),
    numero_de_factura INT,
    fecha_de_la_factura DATE,
    forma_de_pago_factura VARCHAR(50),
    codigo_del_cliente VARCHAR(50),
    total_de_la_factura FLOAT,
    PRIMARY KEY (sucursal, numero_de_factura),
    FOREIGN KEY (codigo_del_cliente) REFERENCES clientes(codigo_del_cliente)
);

CREATE TABLE detalle_de_factura (
    sucursal VARCHAR(50),
    numero_de_factura INT,
    codigo_de_articulo VARCHAR(50),
    cantidad_del_articulo INT,
    precio_unitario_del_articulo FLOAT, 
    subtotal_del_articulo FLOAT,
    PRIMARY KEY (sucursal, numero_de_factura, codigo_de_articulo),
    FOREIGN KEY (sucursal, numero_de_factura) REFERENCES factura(sucursal, numero_de_factura),
    FOREIGN KEY (codigo_de_articulo) REFERENCES articulo(codigo_del_articulo)
);

