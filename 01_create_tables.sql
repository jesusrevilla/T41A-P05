-- Limpieza básica
DROP TABLE IF EXISTS detalle_de_factura;
DROP TABLE IF EXISTS factura;
DROP TABLE IF EXISTS articulo;
DROP TABLE IF EXISTS clientes;

-- Clientes
CREATE TABLE clientes (
  codigo_del_cliente   VARCHAR(20) PRIMARY KEY,
  nombre_del_cliente   VARCHAR(100) NOT NULL
);

-- Artículo
CREATE TABLE articulo (
  codigo_del_articulo   VARCHAR(20) PRIMARY KEY,
  nombre_del_articulo   VARCHAR(100) NOT NULL,
  precio_unitario       NUMERIC(12,2) NOT NULL
);

-- Factura (PK compuesta)
CREATE TABLE factura (
  sucursal               VARCHAR(10)   NOT NULL,
  numero_de_factura      INTEGER       NOT NULL,
  fecha_de_la_factura    DATE          NOT NULL,
  forma_de_pago_factura  VARCHAR(20)   NOT NULL,
  codigo_del_cliente     VARCHAR(20)   NOT NULL REFERENCES clientes(codigo_del_cliente),
  total_de_la_factura    NUMERIC(12,2) NOT NULL,
  PRIMARY KEY (sucursal, numero_de_factura)
);

-- Detalle de factura
CREATE TABLE detalle_de_factura (
  sucursal                      VARCHAR(10)   NOT NULL,
  numero_de_factura             INTEGER       NOT NULL,
  codigo_de_articulo            VARCHAR(20)   NOT NULL REFERENCES articulo(codigo_del_articulo),
  cantidad_del_articulo         INTEGER       NOT NULL,
  precio_unitario_del_articulo  NUMERIC(12,2) NOT NULL,
  subtotal_del_articulo         NUMERIC(12,2) NOT NULL,
  PRIMARY KEY (sucursal, numero_de_factura, codigo_de_articulo),
  FOREIGN KEY (sucursal, numero_de_factura)
    REFERENCES factura (sucursal, numero_de_factura)
);
