DROP TABLE IF EXISTS detalle_de_factura;
DROP TABLE IF EXISTS factura;
DROP TABLE IF EXISTS articulo;
DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS sucursal;

CREATE TABLE sucursal (
    sucursal VARCHAR(10) PRIMARY KEY,
    nombre_sucursal VARCHAR(50) NOT NULL
);

CREATE TABLE clientes (
    codigo_del_cliente VARCHAR(10) PRIMARY KEY,
    nombre_del_cliente VARCHAR(100) NOT NULL
);

CREATE TABLE articulo (
    codigo_del_articulo VARCHAR(10) PRIMARY KEY,
    nombre_del_articulo VARCHAR(100) NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL CHECK (precio_unitario >= 0)
);

CREATE TABLE factura (
    sucursal VARCHAR(10) NOT NULL,
    numero_de_factura VARCHAR(15) NOT NULL,
    fecha_de_la_factura DATE NOT NULL,
    forma_de_pago_factura VARCHAR(20) NOT NULL,
    codigo_del_cliente VARCHAR(10) NOT NULL,
    total_de_la_factura DECIMAL(10,2) CHECK (total_de_la_factura >= 0),

    CONSTRAINT pk_factura PRIMARY KEY (sucursal, numero_de_factura),
    CONSTRAINT fk_factura_sucursal FOREIGN KEY (sucursal) REFERENCES sucursal(sucursal),
    CONSTRAINT fk_factura_cliente FOREIGN KEY (codigo_del_cliente) REFERENCES clientes(codigo_del_cliente)
);

CREATE TABLE detalle_de_factura (
    sucursal VARCHAR(10) NOT NULL,
    numero_de_factura VARCHAR(15) NOT NULL,
    codigo_de_articulo VARCHAR(10) NOT NULL,
    cantidad_del_articulo INT NOT NULL CHECK (cantidad_del_articulo > 0),
    precio_unitario_del_articulo DECIMAL(10,2) NOT NULL CHECK (precio_unitario_del_articulo >= 0),
    subtotal_del_articulo DECIMAL(10,2) NOT NULL CHECK (subtotal_del_articulo >= 0),

    CONSTRAINT pk_detalle PRIMARY KEY (sucursal, numero_de_factura, codigo_de_articulo),
    CONSTRAINT fk_detalle_factura FOREIGN KEY (sucursal, numero_de_factura) REFERENCES factura(sucursal, numero_de_factura),
    CONSTRAINT fk_detalle_articulo FOREIGN KEY (codigo_de_articulo) REFERENCES articulo(codigo_del_articulo)
);
