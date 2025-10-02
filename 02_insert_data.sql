-- BASE DE DATOS DE FACTURACIÓN — 3FN
DROP TABLE IF EXISTS detalle_factura;
DROP TABLE IF EXISTS factura;
DROP TABLE IF EXISTS articulo;
DROP TABLE IF EXISTS cliente;

-- Maestro: Cliente
CREATE TABLE cliente (
    cod_cliente      VARCHAR(20) PRIMARY KEY,
    nom_cliente      VARCHAR(150) NOT NULL
);

-- Factura (encabezado)
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

-- Catálogo: Artículo
CREATE TABLE articulo (
    cod_articulo     VARCHAR(20)  PRIMARY KEY,
    nom_articulo     VARCHAR(150) NOT NULL,
    precio_unitario  NUMERIC(12,2) NOT NULL CHECK (precio_unitario >= 0)
);

-- Detalle de Factura
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

-- INSERCIONES DE PRUEBA (3FN)
-- Clientes
INSERT INTO cliente (cod_cliente, nom_cliente) VALUES
('C001', 'Julian Pérez'),
('C002', 'Norma Benitez'),
('C003', 'Carlos Rodríguez');

-- Artículos
INSERT INTO articulo (cod_articulo, nom_articulo, precio_unitario) VALUES
('A100', 'Lápiz', 5.00),
('A200', 'Libreta', 25.00),
('A300', 'Goma', 3.50);

-- Facturas (encabezados)
INSERT INTO factura (sucursal, numero_factura, fecha_factura, forma_pago, cod_cliente, total_factura) VALUES
('S01', 'G001', '2025-10-01', 'EF', 'C001', 45.00),
('S01', 'G002', '2025-10-02', 'TC', 'C002', 38.50),
('S02', 'G003', '2025-10-03', 'EF', 'C003', 20.00);

-- Detalle de facturas (líneas)
INSERT INTO detalle_factura (sucursal, numero_factura, cod_articulo, cantidad_articulo) VALUES
('S01', 'G001', 'A100', 5),   -- 5 lápices = 25
('S01', 'G001', 'A200', 1),   -- 1 libreta = 25
('S01', 'G001', 'A300', 1),   -- 1 goma = 3.5
('S01', 'G002', 'A200', 1),   -- 1 libreta = 25
('S01', 'G002', 'A300', 1),   -- 1 goma = 3.5
('S02', 'G003', 'A100', 2);   -- 2 lápices = 10

-- CONSULTAS DE PRUEBA
SELECT * FROM cliente;
SELECT * FROM articulo;
SELECT * FROM factura;
SELECT * FROM detalle_factura;

-- JOIN: Facturas con clientes y artículos
SELECT f.sucursal, f.numero_factura, f.fecha_factura, c.nom_cliente, 
       a.nom_articulo, df.cantidad_articulo, a.precio_unitario,
       (df.cantidad_articulo * a.precio_unitario) AS subtotal
FROM factura f
JOIN cliente c ON f.cod_cliente = c.cod_cliente
JOIN detalle_factura df ON f.sucursal = df.sucursal AND f.numero_factura = df.numero_factura
JOIN articulo a ON df.cod_articulo = a.cod_articulo;
