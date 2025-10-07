-- Tabla de Sucursal
CREATE TABLE sucursal (
    sucursal VARCHAR(10) PRIMARY KEY,
    nombre_sucursal VARCHAR(50) NOT NULL
);

-- Tabla de Clientes
CREATE TABLE clientes (
    codigo_del_cliente VARCHAR(10) PRIMARY KEY,
    nombre_del_cliente VARCHAR(100) NOT NULL
);

-- Tabla de Articulo
CREATE TABLE articulo (
    codigo_del_articulo VARCHAR(10) PRIMARY KEY,
    nombre_del_articulo VARCHAR(100) NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL
);

-- Tabla de Factura
CREATE TABLE factura (
    sucursal VARCHAR(10) NOT NULL,
    numero_de_factura INT NOT NULL,
    fecha_de_la_factura DATE NOT NULL,
    forma_de_pago_factura VARCHAR(20) NOT NULL,
    codigo_del_cliente VARCHAR(10) NOT NULL,
    total_de_la_factura DECIMAL(10,2),
    PRIMARY KEY (sucursal, numero_de_factura),
    CONSTRAINT fk_factura_sucursal FOREIGN KEY (sucursal) REFERENCES sucursal(sucursal),
    CONSTRAINT fk_factura_cliente FOREIGN KEY (codigo_del_cliente) REFERENCES clientes(codigo_del_cliente)
);

-- Tabla de Detalle_de_Factura
CREATE TABLE detalle_de_factura (
    sucursal VARCHAR(10) NOT NULL,
    numero_de_factura INT NOT NULL,
    codigo_de_articulo VARCHAR(10) NOT NULL,
    cantidad_del_articulo INT NOT NULL,
    precio_unitario_del_articulo DECIMAL(10,2) NOT NULL,
    subtotal_del_articulo DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (sucursal, numero_de_factura, codigo_de_articulo),
    CONSTRAINT fk_detalle_factura_factura FOREIGN KEY (sucursal, numero_de_factura) REFERENCES factura(sucursal, numero_de_factura),
    CONSTRAINT fk_detalle_factura_articulo FOREIGN KEY (codigo_de_articulo) REFERENCES articulo(codigo_del_articulo)
);
