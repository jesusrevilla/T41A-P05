--Tablas en 3FN
-- Tabla CLIENTES
CREATE TABLE clientes (
    codigo_del_cliente VARCHAR(10) PRIMARY KEY,
    nombre_del_cliente VARCHAR(50) NOT NULL
);

-- Tabla FACTURA
CREATE TABLE factura (
    sucursal VARCHAR(10) NOT NULL,
    numero_de_factura INT NOT NULL,
    fecha_de_la_factura DATE NOT NULL,
    forma_de_pago_factura VARCHAR(20) NOT NULL,
    codigo_del_cliente VARCHAR(10) NOT NULL,
    total_de_la_factura NUMERIC(10,2) NOT NULL,
    PRIMARY KEY (sucursal, numero_de_factura),
    FOREIGN KEY (codigo_del_cliente)
        REFERENCES clientes (codigo_del_cliente)
);

-- Tabla ARTICULO
CREATE TABLE articulo (
    codigo_del_articulo VARCHAR(10) PRIMARY KEY,
    nombre_del_articulo VARCHAR(50) NOT NULL,
    precio_unitario NUMERIC(10,2) NOT NULL
);

-- Tabla DETALLE_DE_FACTURA
CREATE TABLE detalle_de_factura (
    sucursal VARCHAR(10) NOT NULL,
    numero_de_factura INT NOT NULL,
    codigo_de_articulo VARCHAR(10) NOT NULL,
    cantidad_del_articulo INT NOT NULL,
    precio_unitario_del_articulo NUMERIC(10,2) NOT NULL,
    subtotal_del_articulo NUMERIC(10,2) NOT NULL,
    PRIMARY KEY (sucursal, numero_de_factura, codigo_de_articulo),

    -- Claves foráneas que los tests esperan:
    FOREIGN KEY (sucursal, numero_de_factura)
        REFERENCES factura (sucursal, numero_de_factura),
    FOREIGN KEY (codigo_de_articulo)
        REFERENCES articulo (codigo_del_articulo),
    FOREIGN KEY (sucursal)
        REFERENCES factura (sucursal),
    FOREIGN KEY (numero_de_factura)
        REFERENCES factura (numero_de_factura)
);

