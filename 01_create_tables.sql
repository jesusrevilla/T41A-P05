CREATE TABLE clientes (
    codigo_del_cliente VARCHAR(50),
    nombre_del_cliente TEXT,
    PRIMARY KEY (codigo_del_cliente)
);

CREATE TABLE articulo (
    codigo_del_articulo VARCHAR(50),
    nombre_del_articulo TEXT,
    precio_unitario NUMERIC(12,2),
    PRIMARY KEY (codigo_del_articulo)
);

CREATE TABLE factura (
    sucursal VARCHAR(50),
    numero_de_factura INTEGER,
    fecha_de_la_factura DATE,
    forma_de_pago_factura TEXT,
    codigo_del_cliente VARCHAR(50),
    total_de_la_factura NUMERIC(14,2),
    PRIMARY KEY (sucursal, numero_de_factura),
    FOREIGN KEY (codigo_del_cliente) REFERENCES clientes(codigo_del_cliente)
);

CREATE TABLE detalle_de_factura (
    sucursal VARCHAR(50),
    numero_de_factura INTEGER,
    codigo_de_articulo VARCHAR(50),
    cantidad_del_articulo INTEGER,
    precio_unitario_del_articulo NUMERIC(12,2),
    subtotal_del_articulo NUMERIC(14,2),
    PRIMARY KEY (sucursal, numero_de_factura, codigo_de_articulo),
    FOREIGN KEY (sucursal, numero_de_factura) REFERENCES factura(sucursal, numero_de_factura),
    FOREIGN KEY (codigo_de_articulo) REFERENCES articulo(codigo_del_articulo)
);
