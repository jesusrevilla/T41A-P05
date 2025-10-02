-- TERCERA FORMA NORMAL (3FN)
-- Factura referencia a Cliente.
DROP TABLE IF EXISTS detalle_de_factura;
DROP TABLE IF EXISTS factura;
DROP TABLE IF EXISTS articulo;
DROP TABLE IF EXISTS clientes;

-- Tabla: clientes

CREATE TABLE clientes (
    codigo_del_cliente   VARCHAR(20) PRIMARY KEY,
    nombre_del_cliente   VARCHAR(150) NOT NULL
);

-- Tabla: articulo

CREATE TABLE articulo (
    codigo_del_articulo   VARCHAR(20) PRIMARY KEY,
    nombre_del_articulo   VARCHAR(150) NOT NULL,
    precio_unitario       NUMERIC(12,2) NOT NULL CHECK (precio_unitario >= 0)
);

-- Tabla: factura
CREATE TABLE factura (
    sucursal                VARCHAR(10)  NOT NULL,
    numero_de_factura       VARCHAR(20)  NOT NULL,
    fecha_de_la_factura     DATE         NOT NULL,
    forma_de_pago_factura   VARCHAR(20)  NOT NULL,
    codigo_del_cliente      VARCHAR(20)  NOT NULL,
    total_de_la_factura     NUMERIC(14,2) NOT NULL CHECK (total_de_la_factura >= 0),
    CONSTRAINT pk_factura PRIMARY KEY (sucursal, numero_de_factura),
    CONSTRAINT fk_factura_cliente
        FOREIGN KEY (codigo_del_cliente)
        REFERENCES clientes (codigo_del_cliente)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

-- Tabla: detalle_de_factura

CREATE TABLE detalle_de_factura (
    sucursal                      VARCHAR(10)  NOT NULL,
    numero_de_factura            VARCHAR(20)  NOT NULL,
    codigo_de_articulo           VARCHAR(20)  NOT NULL,
    cantidad_del_articulo        NUMERIC(12,2) NOT NULL CHECK (cantidad_del_articulo > 0),
    precio_unitario_del_articulo NUMERIC(12,2) NOT NULL CHECK (precio_unitario_del_articulo >= 0),
    subtotal_del_articulo        NUMERIC(14,2) NOT NULL CHECK (subtotal_del_articulo >= 0),
    CONSTRAINT pk_detalle_de_factura PRIMARY KEY (sucursal, numero_de_factura, codigo_de_articulo),
    CONSTRAINT fk_detalle_factura
        FOREIGN KEY (sucursal, numero_de_factura)
        REFERENCES factura (sucursal, numero_de_factura)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT fk_detalle_articulo
        FOREIGN KEY (codigo_de_articulo)
        REFERENCES articulo (codigo_del_articulo)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);
