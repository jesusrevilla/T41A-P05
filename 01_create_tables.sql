CREATE TABLE clientes (
    codigo_del_cliente VARCHAR(20) PRIMARY KEY,
    nombre_del_cliente VARCHAR(255) NOT NULL
);

CREATE TABLE articulo (
    codigo_del_articulo VARCHAR(50) PRIMARY KEY,
    nombre_del_articulo VARCHAR(255) NOT NULL,
    precio_unitario NUMERIC(10, 2) NOT NULL
);

CREATE TABLE factura (
    sucursal VARCHAR(10) NOT NULL,
    numero_de_factura BIGINT NOT NULL,
    fecha_de_la_factura DATE NOT NULL,
    forma_de_pago_factura VARCHAR(50),
    codigo_del_cliente VARCHAR(20),
    total_de_la_factura NUMERIC(12, 2) NOT NULL,
    PRIMARY KEY (sucursal, numero_de_factura),
    FOREIGN KEY (codigo_del_cliente) REFERENCES clientes (codigo_del_cliente)
);

CREATE TABLE detalle_de_factura (
    sucursal VARCHAR(10) NOT NULL,
    numero_de_factura BIGINT NOT NULL,
    codigo_del_articulo VARCHAR(50) NOT NULL,
    cantidad_del_articulo INTEGER NOT NULL,
    precio_unitario_del_articulo NUMERIC(10, 2) NOT NULL,
    subtotal_del_articulo NUMERIC(12, 2) NOT NULL,
    PRIMARY KEY (sucursal, numero_de_factura, codigo_del_articulo),
    FOREIGN KEY (sucursal, numero_de_factura) REFERENCES factura (sucursal, numero_de_factura) ON DELETE CASCADE,
    FOREIGN KEY (codigo_del_articulo) REFERENCES articulo (codigo_del_articulo)
);
