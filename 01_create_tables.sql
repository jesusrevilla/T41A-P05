-- BASE DE DATOS DE FACTURACIÓN: DIFERENTES FORMAS NORMALES

/* 
   PRIMERA FORMA NORMAL (1FN)
*/

-- Tabla: Factura (1FN)

DROP TABLE IF EXISTS detalle_factura;
DROP TABLE IF EXISTS factura;

CREATE TABLE factura (
    sucursal         VARCHAR(10)  NOT NULL,
    numero_factura   VARCHAR(20)  NOT NULL,
    fecha_factura    DATE         NOT NULL,
    forma_pago       VARCHAR(10)  NOT NULL,
    cod_cliente      VARCHAR(20)  NOT NULL,
    nom_cliente      VARCHAR(150) NOT NULL,
    total_factura    NUMERIC(14,2) NOT NULL CHECK (total_factura >= 0),
    CONSTRAINT pk_factura PRIMARY KEY (sucursal, numero_factura)
);

-- Tabla: Detalle de Factura (1FN)
CREATE TABLE detalle_factura (
    sucursal             VARCHAR(10)  NOT NULL,
    numero_factura       VARCHAR(20)  NOT NULL,
    cod_articulo         VARCHAR(20)  NOT NULL,
    nom_articulo         VARCHAR(150) NOT NULL,
    cantidad_articulo    NUMERIC(12,2) NOT NULL CHECK (cantidad_articulo > 0),
    precio_unitario      NUMERIC(12,2) NOT NULL CHECK (precio_unitario >= 0),
    subtotal_articulo    NUMERIC(14,2) NOT NULL CHECK (subtotal_articulo >= 0),
    CONSTRAINT pk_detalle_factura PRIMARY KEY (sucursal, numero_factura, cod_articulo),
    CONSTRAINT fk_detalle_factura__factura
        FOREIGN KEY (sucursal, numero_factura)
        REFERENCES factura (sucursal, numero_factura)
        ON UPDATE CASCADE ON DELETE CASCADE
);

-- SEGUNDA FORMA NORMAL (2FN)
--    -> nom_articulo y precio_unitario van a ARTICULO

-- Factura (2FN) 
-- ----------------
DROP TABLE IF EXISTS detalle_factura;
DROP TABLE IF EXISTS articulo;
DROP TABLE IF EXISTS factura;

CREATE TABLE factura (
    sucursal         VARCHAR(10)  NOT NULL,
    numero_factura   VARCHAR(20)  NOT NULL,
    fecha_factura    DATE         NOT NULL,
    forma_pago       VARCHAR(10)  NOT NULL,
    cod_cliente      VARCHAR(20)  NOT NULL,
    nom_cliente      VARCHAR(150) NOT NULL,
    total_factura    NUMERIC(14,2) NOT NULL CHECK (total_factura >= 0),
    CONSTRAINT pk_factura PRIMARY KEY (sucursal, numero_factura)
);

-- Catálogo: Artículo (2FN)
CREATE TABLE articulo (
    cod_articulo     VARCHAR(20)  PRIMARY KEY,
    nom_articulo     VARCHAR(150) NOT NULL,
    precio_unitario  NUMERIC(12,2) NOT NULL CHECK (precio_unitario >= 0)
);

-- Detalle de Factura (2FN)
CREATE TABLE detalle_factura (
    sucursal             VARCHAR(10)  NOT NULL,
    numero_factura       VARCHAR(20)  NOT NULL,
    cod_articulo         VARCHAR(20)  NOT NULL,
    cantidad_articulo    NUMERIC(12,2) NOT NULL CHECK (cantidad_articulo > 0),
    CONSTRAINT pk_detalle_factura PRIMARY KEY (sucursal, numero_factura, cod_articulo),
    CONSTRAINT fk_detalle__factura
        FOREIGN KEY (sucursal, numero_factura)
        REFERENCES factura (sucursal, numero_factura)
        ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_detalle__articulo
        FOREIGN KEY (cod_articulo)
        REFERENCES articulo (cod_articulo)
        ON UPDATE CASCADE ON DELETE RESTRICT
);

-- TERCERA FORMA NORMAL (3FN)
-- Factura referencia a Cliente.
-- ----------------
-- Maestro: Cliente (3FN)
-- ----------------
DROP TABLE IF EXISTS detalle_factura;
DROP TABLE IF EXISTS factura;
DROP TABLE IF EXISTS articulo;
DROP TABLE IF EXISTS cliente;

CREATE TABLE cliente (
    cod_cliente      VARCHAR(20) PRIMARY KEY,
    nom_cliente      VARCHAR(150) NOT NULL
);

-- Factura (3FN)
CREATE TABLE factura (
    sucursal         VARCHAR(10)  NOT NULL,
    numero_factura   VARCHAR(20)  NOT NULL,
    fecha_factura    DATE         NOT NULL,
    forma_pago       VARCHAR(10)  NOT NULL,
    cod_cliente      VARCHAR(20)  NOT NULL REFERENCES cliente(cod_cliente)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    total_factura    NUMERIC(14,2) NOT NULL CHECK (total_factura >= 0),
    CONSTRAINT pk_factura PRIMARY KEY (sucursal, numero_factura)
);

-- Catálogo: Artículo (3FN)
CREATE TABLE articulo (
    cod_articulo     VARCHAR(20)  PRIMARY KEY,
    nom_articulo     VARCHAR(150) NOT NULL,
    precio_unitario  NUMERIC(12,2) NOT NULL CHECK (precio_unitario >= 0)
);

-- Detalle de Factura (3FN)
CREATE TABLE detalle_factura (
    sucursal             VARCHAR(10)  NOT NULL,
    numero_factura       VARCHAR(20)  NOT NULL,
    cod_articulo         VARCHAR(20)  NOT NULL,
    cantidad_articulo    NUMERIC(12,2) NOT NULL CHECK (cantidad_articulo > 0),
    CONSTRAINT pk_detalle_factura PRIMARY KEY (sucursal, numero_factura, cod_articulo),
    CONSTRAINT fk_detalle__factura
        FOREIGN KEY (sucursal, numero_factura)
        REFERENCES factura (sucursal, numero_factura)
        ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_detalle__articulo
        FOREIGN KEY (cod_articulo)
        REFERENCES articulo (cod_articulo)
        ON UPDATE CASCADE ON DELETE RESTRICT
);
