--Yovana Isabel Palencia Sánchez 174197

DROP TABLE IF EXISTS detalle_de_factura CASCADE;
DROP TABLE IF EXISTS factura CASCADE;
DROP TABLE IF EXISTS articulo CASCADE;
DROP TABLE IF EXISTS clientes CASCADE;

-- Crear tablas con numero_de_factura como INTEGER
CREATE TABLE clientes (
    codigo_del_cliente VARCHAR(50) PRIMARY KEY,
    nombre_del_cliente VARCHAR(100) NOT NULL
);

CREATE TABLE articulo (
    codigo_del_articulo VARCHAR(50) PRIMARY KEY,
    nombre_del_articulo VARCHAR(100) NOT NULL,
    precio_unitario NUMERIC(10,2) NOT NULL
);

CREATE TABLE factura (
    sucursal VARCHAR(50),
    numero_de_factura INTEGER,
    fecha_de_la_factura DATE NOT NULL,
    forma_de_pago_factura VARCHAR(50) NOT NULL,
    codigo_del_cliente VARCHAR(50) NOT NULL,
    total_de_la_factura NUMERIC(10,2) NOT NULL,
    PRIMARY KEY (sucursal, numero_de_factura),
    FOREIGN KEY (codigo_del_cliente) REFERENCES clientes(codigo_del_cliente)
);

CREATE TABLE detalle_de_factura (
    sucursal VARCHAR(50),
    numero_de_factura INTEGER,
    codigo_de_articulo VARCHAR(50),
    cantidad_del_articulo INTEGER NOT NULL,
    precio_unitario_del_articulo NUMERIC(10,2) NOT NULL,
    subtotal_del_articulo NUMERIC(10,2) NOT NULL,
    PRIMARY KEY (sucursal, numero_de_factura, codigo_de_articulo),
    FOREIGN KEY (sucursal, numero_de_factura) REFERENCES factura(sucursal, numero_de_factura),
    FOREIGN KEY (codigo_de_articulo) REFERENCES articulo(codigo_del_articulo)
);
